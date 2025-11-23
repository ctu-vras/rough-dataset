#!/usr/bin/env python3

import sys
import yaml
from spatialmath import SE3, UnitQuaternion
import os


def conv(data_list):
    """
    Converts a list of dicts with 'key' and 'value' fields into a dictionary
    mapping 'key' values to 'value' values.
    """
    res = {}
    for item in data_list:
        if isinstance(item, dict) and 'key' in item and 'value' in item:
            res[item["key"]] = item["value"]
    return res


def wrap(topic, so3_data, pos_data):
    """
    Creates a spatialmath SE3 object (Homogeneous Transformation Matrix)
    from quaternion (SO3) and translation (POS) data for a given topic.
    The quaternion order in the YAML is (qx, qy, qz, qw), which is converted
    to spatialmath's UnitQuaternion order (qw, qx, qy, qz).
    """
    # Quaternion: spatialmath uses [qw, qx, qy, qz], YAML uses [qx, qy, qz, qw]
    q_dict = so3_data[topic]
    q_vec = [q_dict["qw"], q_dict["qx"], q_dict["qy"], q_dict["qz"]]

    # Translation: YAML uses r0c0, r1c0, r2c0 (x, y, z)
    p_dict = pos_data[topic]
    t_vec = [p_dict["r0c0"], p_dict["r1c0"], p_dict["r2c0"]]

    # Create UnitQuaternion -> SO3 -> SE3, then set translation
    rotation = UnitQuaternion(q_vec).SO3()
    transformation = SE3(rotation)
    transformation.t = t_vec

    return transformation


def process_yaml_file(input_filename):
    """
    Reads the YAML file, processes the transformations, inverts them,
    and writes the inverted transformations to a new YAML file.
    """
    # 1. Load data from the input YAML file
    try:
        with open(input_filename, "r") as f:
            data = yaml.safe_load(f)
    except FileNotFoundError:
        print(f"Error: Input file '{input_filename}' not found.")
        sys.exit(1)
    except Exception as e:
        print(f"Error loading YAML from '{input_filename}': {e}")
        sys.exit(1)

    # Check for expected structure
    try:
        extri_data = data["CalibParam"]["EXTRI"]
    except KeyError:
        print("Error: YAML structure missing 'CalibParam' or 'EXTRI'.")
        sys.exit(1)

    # 2. Convert list-of-dicts format to topic-to-value dicts
    so3 = {}
    pos = {}
    for k, v in extri_data.items():
        if k.startswith("SO3"):
            so3.update(conv(v))
        else:  # Assumes all other entries are POS
            pos.update(conv(v))

    # Check if a base topic exists. The session implied /imu/data is the base.
    base_topic = "/imu/data"
    if base_topic not in so3 or base_topic not in pos:
        print(f"Warning: Base topic '{base_topic}' not found in SO3 or POS data. Proceeding anyway.")
        # If /imu/data isn't there, we'll process all available keys
        all_topics = set(so3.keys()) & set(pos.keys())
        if not all_topics:
            print("Error: No common topics found in SO3 and POS data to process.")
            sys.exit(1)
    else:
        all_topics = set(so3.keys()) & set(pos.keys())

    # 3. Compute the inverse transformations
    inv_transformations = {}
    for topic in all_topics:
        try:
            # Create SE3 for Sen2ToSen1 and invert it (Sen1ToSen2)
            T_Sen2ToSen1 = wrap(topic, so3, pos)
            T_Sen1ToSen2 = T_Sen2ToSen1.inv()
            inv_transformations[topic] = T_Sen1ToSen2
        except Exception as e:
            print(f"Error processing topic '{topic}': {e}")

    # 4. Prepare output data structure (list-of-dicts format)
    res_so3 = []
    res_pos = []
    base_topic_name = base_topic if base_topic in inv_transformations else list(all_topics)[0]

    for k, T_inv in inv_transformations.items():
        # Rotation: Convert inverse rotation matrix (R) back to UnitQuaternion, then to dict
        q_inv = UnitQuaternion(T_inv.R).vec

        # Translation: Extract inverse translation vector (t)
        t_inv = T_inv.t

        key_dict = {"first": base_topic_name, "second": k}

        # Quaternion output: [qx, qy, qz, qw]
        so3_value = {"qx": float(q_inv[1]), "qy": float(q_inv[2]), "qz": float(q_inv[3]), "qw": float(q_inv[0])}
        res_so3.append({"key": key_dict, "value": so3_value})

        # Position output: [r0c0 (x), r1c0 (y), r2c0 (z)]
        pos_value = {"r0c0": float(t_inv[0]), "r1c0": float(t_inv[1]), "r2c0": float(t_inv[2])}
        res_pos.append({"key": key_dict, "value": pos_value})

    output_data = {
        "SO3_Sen1ToSen2": res_so3,
        "POS_Sen1InSen2": res_pos
    }
    
    # 5. Write data to a new YAML file
    base, ext = os.path.splitext(input_filename)
    output_filename = base + "-inv" + ext

    yaml.Dumper.ignore_aliases = lambda *args: True
    try:
        with open(output_filename, 'w') as f:
            # Use default_flow_style=None for cleaner, multi-line output (like the input)
            yaml.dump(output_data, f)
        print(f"\nSuccessfully inverted transformations and saved to '{output_filename}'")
    except Exception as e:
        print(f"Error writing to output file '{output_filename}': {e}")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 inv_params.py <input_yaml_file>")
        sys.exit(1)

    input_file = sys.argv[1]
    process_yaml_file(input_file)
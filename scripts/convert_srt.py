#!/usr/bin/env python3

import sys


def format_stamp(s):
    hours = s // 3600
    s -= hours * 3600
    minutes = s // 60
    s -= minutes * 60
    seconds = int(s)
    subsec = float(s) - seconds
    
    return "%02d:%02d:%02d,%03d" % (hours, minutes, seconds, subsec)


with open(sys.argv[1], 'r') as f:
    lines = f.readlines()

with open(sys.argv[1].replace('.log', '.srt'), 'w+') as f:
    i = 0
    for line in lines:
        secs, text = line.split(' ', maxsplit=1)
        secs = int(secs.strip('s'))
        secs2 = secs + 10
        i += 1
        print(i, file=f)
        print("%s --> %s" % (format_stamp(secs), format_stamp(secs2)), file=f)
        print(text.strip(), file=f)
        print(file=f)
        
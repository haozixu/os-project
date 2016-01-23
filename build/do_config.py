#!/usr/bin/env python
import sys

output = None
suffix = None

if len(sys.argv) != 1:
    cfg = open(sys.argv[1], "r")
else:
    cfg = open("build/CONFIG.lst", "r")        
lines = cfg.readlines()
for s in lines:
    if s[0] == '#' or s == '\n':
        continue
    if s[0] == '{' and s[-2] == '}':
        name = s[1:-2]
        output = open(name, "w")
        suffix = name[name.rfind('.'):]
        if suffix == ".h":
            output.write("/*\n *\t" + name + "\n *\n *\tThis file is auto generated. Do not modify manually!\n */\n")
            output.write("#pragma once\n")
        elif suffix == ".mk":
            output.write("# " + name + '\n')
        else:
            print("unrecognized file type!")
            sys.exit(1)
    if s[0] == '[' and s[-2] == ']':
        category = s[1:-2]
        if suffix == ".h":
            output.write("// " + category + '\n')
        elif suffix == ".mk":
            output.write("# " + category + '\n')
    idx = s.find(':')
    if idx == -1:
        continue
    if suffix == ".h":
        pos = output.tell()
        output.write("#define " + s[:idx])
        for i in range(output.tell(), pos + 40):
            output.write(' ')
        output.write(s[idx + 2:])
    elif suffix == ".mk":
        output.write(s[:idx] + " = " + s[idx + 2:])

cfg.close()
output.close()

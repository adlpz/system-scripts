#!/usr/bin/env python3
from subprocess import run, PIPE
processes = run(["ps", "ax", "c", "-o", "%cpu,cmd"], stdout=PIPE);
processes = processes.stdout.decode('ascii').strip()
processes = [[l.strip().split(' ')[0], ' '.join(l.strip().split(' ')[1:3])] for l in processes.split("\n")]

combined = {}
for cpu, process in processes[1:-1]:
    if not process in combined:
        combined[process] = float(cpu)
    else:
        combined[process] += float(cpu)

top = sorted(combined.items(), key=lambda t: t[1], reverse=True)

for item in top[:10]:
    print("{:20}{:10.2f}%".format(item[0], item[1]))





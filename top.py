#!/usr/bin/env python3
from subprocess import run, PIPE
from sys import argv

def top_processes(column, formatter):
    processes = run(["ps", "ax", "c", "-o", column + ",cmd"], stdout=PIPE);
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
        print(formatter(item[0], item[1]))

def usage():
    print("USAGE: " + argv[0] + " (mem|cpu)")

if len(argv) < 2:
    usage()
elif argv[1] == "cpu":
    top_processes("%cpu", lambda proc, cpu: "{:20}{:10.2f}%".format(proc, cpu))
elif argv[1] == "mem":
    top_processes("rss", lambda proc, mem: "{:20}{:10.2f}M".format(proc, mem/(1024)))
else:
    usage()


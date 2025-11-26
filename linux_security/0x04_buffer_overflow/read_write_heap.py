#!/bin/bash

"""
Script
"""

import sys

def main():
    """
    Funcion Principal
    """
    pid = sys.argv[1]
    search = sys.argv[2].encode("ascii")
    replace = sys.argv[3].encode("ascii")

    heap_start = None
    heap_end = None

    with open(f"/proc/{pid}/maps", "r") as maps:
        for line in maps:
            if "[heap]" in line:
                addr = line.split()[0]
                tmp = addr.split("-")
                heap_start = int(tmp[0], 16)
                heap_end = int(tmp[1], 16)
                break

    with open(f"/proc/{pid}/mem", "rb+") as mem:
        mem.seek(heap_start)
        heap_data = mem.read(heap_end - heap_start)
        index = heap_data.find(search)

        if index == -1:
            print("No se encontro")
            sys.exit(1)

        mem.seek(heap_start + index)
        mem.write(replace)

        print("Texto remplazado")

if __name__ == "__main__":
    main()

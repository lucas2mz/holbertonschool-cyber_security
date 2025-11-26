#!/usr/bin/python3

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
    try:
        with open(f"/proc/{pid}/maps", "r") as maps:
            for line in maps:
                if "[heap]" in line:
                    addr = line.split()[0]
                    tmp = addr.split("-")
                    heap_start = int(tmp[0], 16)
                    heap_end = int(tmp[1], 16)
                    break
    except FileNotFoundError:
        print("Usage: read_write_heap.py pid search_string replace_string")
        sys.exit(1)
    except PermissionError:
        print("Usage: read_write_heap.py pid search_string replace_string")
        sys.exit(1)

    if heap_start is None:
        print("Usage: read_write_heap.py pid search_string replace_string")
        sys.exit(1)

    try:
        with open(f"/proc/{pid}/mem", "rb+") as mem:
            mem.seek(heap_start)
            heap_data = mem.read(heap_end - heap_start)
            index = heap_data.find(search)

            if index == -1:
                sys.exit(1)

            mem.seek(heap_start + index)
            mem.write(replace)
    except (PermissionError, OSError, IOError):
        print("Usage: read_write_heap.py pid search_string replace_string")
        sys.exit(1)


if __name__ == "__main__":
    main()

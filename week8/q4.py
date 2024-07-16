#!/usr/bin/env python3

# argparse
import sys


def main():
    if len(sys.argv) != 4:
        print(f"wrong num of args", file=sys.stderr)
        sys.exit(1)
    
    try:
        rows = int(sys.argv[1])
        cols = int(sys.argv[2])
        padding = int(sys.argv[3])
    except ValueError as ve:
        print(f"arguments should be integers")
        sys.exit(1)

    for x in range(1, rows + 1):
        for y in range(1, cols + 1):
            print(f"{x * y:> {padding}}", end="")
        print()

if __name__ == "__main__":
    main()

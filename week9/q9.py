#! /usr/bin/env python3

import re, subprocess
from collections import Counter
from argparse import ArgumentParser

def main():

    parser = ArgumentParser()
    parser.add_argument('-f', '--frequency', action='store_true', help='print tags by frequency')
    parser.add_argument("url", help="url to fetch")
    args = parser.parse_args()

    # print(args.frequency)

    proc = subprocess.run(["wget", "-q", "-O-", args.url],
                             capture_output=True, text=True)
    
    # print(proc.stdout)

    tags = re.findall("<\s*([a-z0-9]+)", proc.stdout.lower())

    tags_counter = Counter(tags)

    if args.frequency:
        pass
        for tag in reversed(tags_counter.most_common()):
            print(tag[0], tag[1])

    else:    
        for tag in sorted(tags_counter):
            print(tag, tags_counter[tag])


    

if __name__ == "__main__":
    main()
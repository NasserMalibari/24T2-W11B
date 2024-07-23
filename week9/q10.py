#! /usr/bin/env python3

from collections import Counter
from argparse import ArgumentParser
import requests
# venv
from bs4 import BeautifulSoup

def main():

    parser = ArgumentParser()
    parser.add_argument('-f', '--frequency', action='store_true', help='print tags by frequency')
    parser.add_argument("url", help="url to fetch")
    args = parser.parse_args()

    resp = requests.get(args.url)
    soup = BeautifulSoup(resp.text.lower(), 'html.parser')
    tags = soup.find_all()
    tag_names = [tag.name for tag in tags]

    tags_counter = Counter(tag_names)

    if args.frequency:
        for tag in reversed(tags_counter.most_common()):
            print(tag[0], tag[1])

    else:    
        for tag in sorted(tags_counter):
            print(tag, tags_counter[tag])

if __name__ == "__main__":
    main()
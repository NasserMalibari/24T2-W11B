
import sys


for line in sys.stdin:
    line = line.strip()

    # translate_dict = {'a': 'A'}
    table = str.maketrans("aeiouAEIOU", 'AEIOUaeiou')
    print(line.translate(table))
    
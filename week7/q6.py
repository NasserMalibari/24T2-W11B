import sys

n_lines = 10

if len(sys.argv) > 1 and sys.argv[1].startswith('-'):
    n_lines = int(sys.argv.pop(1)[1:])

if len(sys.argv) == 1:
    sys.argv.append("-")

for filename in sys.argv[1:]:

    with open(filename) as f:
        for line in f:
            print(line)

        for line_num, line in enumerate(f, start = 0):
            if (n_lines == line_num):
                break
            print(line, end="")

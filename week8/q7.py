import sys, subprocess, re

url = sys.argv[1]

def main():
    proc = subprocess.run(f"wget -O- {url}", shell=True, capture_output=True, text=True)

    numbers = re.findall(r"[\d \-]+", proc.stdout)
    for number in numbers:
        new_num = re.sub(r"[ \-]", "", number)
        if len(new_num) > 8 and len(new_num) < 15:
            print(new_num)
        # print(new_num)
    # print(numbers)

    # subprocess.run(['grep', '-E', 'blah'])


if __name__ == "__main__":
    main()
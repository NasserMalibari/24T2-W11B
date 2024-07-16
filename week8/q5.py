import sys

# TODO: check arguments
file1 = sys.argv[1]
file2 = sys.argv[2]

def main():
    file1_words = get_word_set(file1)
    file2_words = get_word_set(file2)

    diff_words = file1_words.difference(file2_words)

    for word in sorted(diff_words):
        print(word)
    # print(file1_words)


    pass

def get_word_set(filename):
    """
    Description

    Input:

    Output:
    """
    words = set()

    with open(filename) as f:
        for line in f:
            words.add(line.strip())
        
    return words

if __name__ == "__main__":
    main()
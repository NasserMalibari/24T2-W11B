import sys

def chomp():
    pass

def qw(line):
    return line.split()

def die(error_msg, exit_status=1):
    """ Prints an error msg to sys.stderr and exits the program

    Arguments:
        error_msg: string
            the message written to sys.stderr 
        exit_status: int
            exit status of process
    """
    print(error_msg, file=sys.stderr)
    sys.exit(exit_status)

def main():
    pass

if __name__ == "__main__":
    print(qw("a list of words"))
#!/bin/python3
import sys
import os
import timeit
from termcolor import colored


def isC(filename):
    """checks if a file is .cpp or .cc"""
    extension = filename[-4:]
    if(extension == ".cpp" or extension == ".cc"):
        return True


def compile(code="*.cpp"):
    """compiles cpp files and checks for success"""
    print("compiling...")
    ret = os.WEXITSTATUS(os.system(f"g++ {code} -o do -std=c++17 -Wall -Wextra -pedantic -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -fstack-protector -Wno-unused-variable -Wno-conversion"))
    if(ret == 0):
        print(colored("compilation successful", "green"))
    else:
        print(colored(f"Error: compilation failed {ret}", "red"))
        exit(0)


def run(input_file=""):
    s = ""
    if(input_file != ""):
        s = "<"+input_file
    print("execution started...")
    print("------------------------")
    start = timeit.default_timer()
    os.system("./do "+s)
    stop = timeit.default_timer()
    print("\n------------------------")
    print("execeution finished")
    print(f"execution time {round(stop-start,3)}")


if __name__ == "__main__":
    #  this program has three modes of uses
    #  1) with two arguments:
        #  one of them must be a cpp file and the other
        #  must be the input file
        #  the order is irrelevant
    if(len(sys.argv) == 3):
        # checks if one of the files is .cpp
        if((isC(sys.argv[1]) and isC(sys.argv[2]))or (not isC(sys.argv[1]) and not isC(sys.argv[2]))):
            print(
                colored(f"Invalid input files {sys.argv[2]} and {sys.argv[1]}"), "red")
            print(colored("compilation terminated."), "red")
            exit(0)
# handles the order so "c file.cpp i" ot "c i file.cpp"
# are the same
        if(isC(sys.argv[1])):
            code = sys.argv[1]
            input_file = sys.argv[2]
        else:
            code = sys.argv[2]
            input_file = sys.argv[1]
        print(f"code file: \"{code}\"")
        print(f"input file: \"{input_file}\"")
        compile(code)
        run(input_file)
    #  2) second mode is with a single arguament
    #  if the argument is file.cpp then that file will be compiled
    #  and run without input file
    #  else if the file is input
    #  then we compile *.cpp (there must be a single cpp file)
    elif(len(sys.argv) == 2):
        if(isC(sys.argv[1])):
            print(f"code file: \"{sys.argv[1]}\"")
            print(colored("no input file", "yellow"))
            compile(sys.argv[1])
            run()
        else:
            print(colored("searching for a .cpp file",
                          "white", "on_grey", attrs=['bold']))
            print(f"input file is \"{sys.argv[1]}\"")
            compile()
            run(sys.argv[1])
    #  3) third mode is without any arguments
    #  here it will look for *.cpp and run it without
    #  input file
    else:
        print(colored("searching for a .cpp file",
                      "white", "on_grey", attrs=['bold']))
        compile()
        run()

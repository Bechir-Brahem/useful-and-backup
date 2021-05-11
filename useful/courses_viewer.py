#!/bin/python3.8
import subprocess
def keyboardInterruptHandler(signal, frame):
    print("KeyboardInterrupt (ID: {}) has been caught. Cleaning up...".format(signal))
    exit(0)
PATH_TO_DOC="/home/bb/github/useful-and-backup/course-notes/"
tmp=(f'cd {PATH_TO_DOC} && find . -name "*.md" -type f ')

res = subprocess.check_output(tmp,shell=True) # byte data returned
output=res.decode("utf-8") # formatted
files=output.split() # make a list of files


for i in range(0,len(files)):
    print(f"{i}. {files[i][2:]}")


try:
    choice=int(input("choose your file by typing its number "))
except (EOFError, KeyboardInterrupt, ValueError):
    print()
    exit(0)


open_command=f"nvim {PATH_TO_DOC}{files[choice]}"
subprocess.call(open_command, shell = True)


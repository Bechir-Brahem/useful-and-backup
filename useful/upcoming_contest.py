#!/usr/bin/python3

import sys
import requests
url = "https://codeforces.com/api/contest.list?gym=false"
x = requests.get(url)
x = x.json()


def printNotRuski(name, time):
    """prints contests that dont have a russian name and format the time"""
    ruski = "БбГДдЁёЖжИиЛлПпЦцЧчШшЩщЪъЫыЮюЯя"
    minutes = (time//60) % 60
    hours = (time//60//60)
    isRuski = False
    for x in name:
        if x in ruski:
            isRuski = True
            break
    if(not isRuski):
        if(hours < 1):
            print("contest \""+name+"\" starts in", minutes, "minutes")
        elif(hours < 24):
            print("contest \""+name+"\" starts in", hours, "hours and",minutes,"minutes" )
        else:
            print("contest \""+name+"\" starts in", hours//24, "days")


existContest = False


def checkMode(name, time):
    """checks the command line arguments
        cf   : to list contests in less than two days
        cf e : to list all upcoming contests
    """
    global existContest
    if(len(sys.argv) == 1):
        if(time//60//60 < 48):
            existContest = True
            printNotRuski(name, time)

    elif(sys.argv[1] == "e"):
        existContest = True
        printNotRuski(name, time)


contest = []
for i in x['result']:
    if i['phase'] == "BEFORE":
        l = i["name"]
        ms = -i["relativeTimeSeconds"]
        contest.append((l, ms))
    if i['phase'] == "FINISHED":
        break

contest.sort(key=lambda x: x[1])
for i in contest:
    checkMode(i[0], i[1])
if(not existContest):
    print("no upcoming contests")

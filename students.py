#!/usr/bin/env python3
n = int(input("Enter the number of students:"))
data = {} # the dic value
Subjects =('Physics','Maths','History') #all sub
for i in range(0,n):
    name = input('Enter the name of the student {}:'.format(i + 1)) #the name of the student
    marks = []
    for x in Subjects:
        marks.append(int(input('Enter marks of {}:'.format(x)))) #scores
    data[name] = marks
for x,y in data.items():
    total = sum(y)
    print("{}'s total marks {}".format(x,total))
    if total < 120:
        print(x,"failed :(")
    else:
        print(x,"passed :)")

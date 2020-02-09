#!/usr/bin/env python3
f = open('/tmp/String.txt')
s = f.read()
res = ""

for i in s:
    if i.isdigit():
        res += i
print(res)

f.close()

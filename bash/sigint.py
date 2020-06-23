#!/usr/bin/env python

import signal,time

def handler(signum,time):
    print("\n I got a SIGNINT,but I an not stopping")

signal.signal(signal.SIGINT,handler)
i = 0
while True:
    time.sleep(.1)
    print("\r{}".format(i),end="")
    i+=1


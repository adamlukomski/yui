#!/usr/bin/python

import socket

host = '192.168.0.114'
port = 80

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM )
try:
	s.connect((host,port))
	s.send("a 50 b 50")
	s.shutdown(2)
	print "Connected"
except:
	print "Failed"

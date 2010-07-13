#!/usr/bin/env python

import sys
import string

def readResult(file):
	if file.closed:
		return "?"
	else:
		line = file.readline()

	if line == "":
		file.close()
		return "?"
	else:
		line = line.split()
		return line[1]

def readFirstResult(file):
	line = file.readline()
	if line == "":
		print file.name + " doesn't start properly"
		sys.exit(1)
	else:
		line = line.split()
		if line[0] != "1":
			print file.name + " doesn't start properly"
			sys.exit(1)
		else:
			return line[1]



def writeTable(tablename, pointnum, bcfilename, d1filename, d2filename):
	bcfp = open(bcfilename, "r")
	d1fp = open(d1filename, "r")
	d2fp = open(d2filename, "r")

	linelength = 14

	ofp = open(tablename,"w")
	idxline = ["point"]
	bcrsltline = ["depth"]
	d1rsltline = ["approx 1"]
	d2rsltline = ["approx 2"]

	idxline.append("1")
	bcrsltline.append(readFirstResult(bcfp))
	d1rsltline.append(readFirstResult(d1fp))
	d2rsltline.append(readFirstResult(d2fp))

	for pidx in range(2, pointnum+1):
		idxline.append(str(pidx))
	        bcrsltline.append(readResult(bcfp))
		d1rsltline.append(readResult(d1fp))
		d2rsltline.append(readResult(d2fp))

		if pidx % linelength == 0:
			ofp.write("\\hline\n")
			ofp.write(string.join(idxline, " & ")+" \\\\\n")
			ofp.write("\\hline\n")
			ofp.write(string.join(bcrsltline, " & ")+" \\\\\n")
			ofp.write(string.join(d1rsltline, " & ")+" \\\\\n")
			ofp.write(string.join(d2rsltline, " & ")+" \\\\\n")
        
			idxline = ["point"]
			bcrsltline = ["depth"]
			d1rsltline = ["approx 1"]
			d2rsltline = ["approx 2"]
		elif pidx == pointnum:
			stuff = ""
			for i in range(0,linelength - pidx % linelength):
				stuff += " &"

			ofp.write("\\hline\n")
			ofp.write(string.join(idxline, " & ")+stuff+" \\\\\n")
			ofp.write("\\hline\n")
			ofp.write(string.join(bcrsltline, " & ")+stuff+" \\\\\n")
			ofp.write(string.join(d1rsltline, " & ")+stuff+" \\\\\n")
			ofp.write(string.join(d2rsltline, " & ")+stuff+" \\\\\n")
			ofp.write("\\hline\n")

if __name__ == "__main__":
	writeTable(sys.argv[1], int(sys.argv[2]),sys.argv[3],sys.argv[4],sys.argv[5])


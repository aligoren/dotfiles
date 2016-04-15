"""
tree directory output.
"""

import os
 
rootDir = '.'
for dirName, subdirList, fileList in os.walk(rootDir):
    if dirName == ".":
    	print('+-------%s' % "Current")
    else:
    	print('+-------%s' % dirName[2:])
    print('\t|')
    print('\t|')
    print('\t|')
    for fname in fileList:
        print('\t↳ ------------%s' % fname) # ↳ yerine + olabilir.
    # Remove the first entry in the list of sub-directories
    # if there are any sub-directories present
    if len(subdirList) > 0:
        del subdirList[0]
        print('\t|')
        print('\t|')
        #print('\t|')

"""
+-------Current
	|
	|
	|
	↳ ------------main.py~
	↳ ------------main.py
	|
	|
+-------Other
	|
	|
	|
	↳ ------------fedora_sorular
	↳ ------------fikirler.txt
	↳ ------------kutucuğum kaldığım yer
	|
	|
+-------Other/py_sozluk
	|
	|
	|
	↳ ------------.spyderworkspace
	|
	|
+-------Other/Book
	|
	|
	|
	↳ ------------python2.docx

"""

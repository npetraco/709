# Handy Makefile tocleanup and push changes out to website 

default:
	cp fos709.html index.html
	./bin/notes2sbucket.sh
	./bin/labs2sbucket.sh
	git add --all
	git commit -m "update"
	git push -u origin main

copy:
	cp fos709.html index.html

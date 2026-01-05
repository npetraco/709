# Handy Makefile tocleanup and push changes out to website 

default:
	cp fos709.html index.html
	git add --all
	git commit -m "update"
	git push -u origin main

copy:
	cp fos709.html index.html

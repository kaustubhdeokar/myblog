#!/bin/bash


function enableBashEcho {
	echo "" 
}

function disableBashEcho {
	echo ""
}

intellij(){
	enableBashEcho
	cd "/home/kaustubh/Documents/Apps/idea-IU-223.8617.56/bin/"
	exec ./idea.sh > log.sh --detach &
	cd /home/kaustubh
	disableBashEcho
}
export intellij

tor(){
	enableBashEcho
	cd "/home/kaustubh/Downloads/tor-browser-linux64-12.0.3_ALL/tor-browser/"
	exec ./start-tor-browser.desktop
	cd /home/kaustubh
	disableBashEcho
}
export tor

github(){
	enableBashEcho
	python3 -m webbrowser https://github.com/$1 &
	disableBashEcho	
}
export github

notion(){
	enableBashEcho
	python3 -m webbrowser https://notion.so/ &
	disableBashEcho	
}

export notion

taskkill(){
echo    "
	 1.lsof -i:1099
	 2.kill <PID>
	"
}

export taskkill

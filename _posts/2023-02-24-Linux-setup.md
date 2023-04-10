---
layout: post
title: Ubuntu Linux Setup
categories: setup
---

Installing Brave browser
    1  sudo apt install curl
    2  sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    3  echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    4  sudo apt update
    5  sudo apt install brave-browser -y


Installing IntelliJ
	

Installing java
	
	Downloading the latest java linux x64 compressed archive. 
	nano .profile
	
	JAVA_HOME=/home/kaustubh/Documents/Apps/jdk-17.0.6/
	export JAVA_HOME
	PATH=$JAVA_HOME/bin:$PATH
	export PATH

	
Installing vscode. 

	python support:	https://code.visualstudio.com/docs/python/python-tutorial	
	
	
Installing a .deb file
	sudo apt install ./<file>.deb
---
layout: post
title: Linux Commands
categories: 
- linux
---

	> to open `files` in the current path from terminal
		>>	xdg-open .
	
	> View entire contents of file
		>> cat <filename> 

	> View line count for file
		>> cat <filename> | wc -l

Find

	> Find file recursively in directories
		>> find . -name ".gitignore"

Grep

	> To search for a word in a text document & and print EVERY line containing the word.
		
		Command:
		>	grep <text> <filepath/filename>
		>	grep for ./Trie.java
		
		Command:
		> cat <filename> | grep <text>
		> cat Trie.java | grep for
		
		Output:
			for (int i = 0; i < word.length(); i++) {
		    for (int i = 0; i < word.length(); i++) {
        	for (int i = 0; i < word.length(); i++) {
            for (char c : set) {
        	for (int i = 0; i < prefix.length(); i++) {

	> To search for a word in a text document & and print EVERY line NOT containing the word.
		> cat <filename> | grep -v <text>
		> cat Trie.java | grep -v for
	
	> Print line numbers along with output (-n)
		grep -n <text> <filepath/filename>
	
	> Count (-c)
		grep -c <text> <filepath/filename>

	> Case insensitive (-i)
		grep -i <text> <filepath/filename>

		
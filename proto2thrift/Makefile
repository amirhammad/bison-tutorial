all: advanced

bison: advanced.y
	bison advanced.y

advanced: bison advanced.tab.c
	gcc -lm advanced.tab.c -o advanced

clean:
	rm -f advanced.tab.c
	rm -f advanced

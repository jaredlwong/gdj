#include <stdio.h>
#include "j.h"
#include "jlib.h"

static char input[30000];

char* Jinput(J jt, char* prompt)
{
	fputs(prompt,stdout);
	fflush(stdout); /* windows emacs */
	if(!fgets(input, sizeof(input), stdin))
	{
		/* unix eof without readline */
		return "2!:55''";
	}
	return input;
}

/* J calls for output */
void Joutput(J jt,int type, char* s)
{
	if (MTYOEXIT == type)
	{
		exit((int)(I)s);
	}
	fputs(s, stdout);
	fflush(stdout);
}

int main(int argc, char* argv[])
{
	void* callbacks[] = { Joutput, 0, Jinput, 0, (void*)SMCON};

	J jt = JInit();
	JSM(jt, callbacks);

	while (1) {
		JDo(jt, Jinput(jt,"   "));
	}
	JFree(jt);
	return 0;
}

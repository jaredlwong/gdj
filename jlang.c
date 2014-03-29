#include <stdio.h>
#include <string.h>
#include "j.h"
#include "jlib.h"

static char input[30000];
static char path[1000];

int jefirst(J jt, int type,char* arg)
{
	int r; char* p,*q;
	char* input=malloc(2000+strlen(arg));
	*input=0;
//	if(0==type)
//	{
		strcat(input,"(3 : '0!:0 y')<BINPATH,'");
		strcat(input,"/");
		strcat(input,"profile.ijs'");
//	}
//	else if(1==type)
//		strcat(input,"(3 : '0!:0 y')2{ARGV");
//	else if(2==type)
//		strcat(input,ijx);
//	else
//		strcat(input,"i.0 0");
	strcat(input,"[ARGV_z_=:");
	strcat(input,arg);
	strcat(input,"[BINPATH_z_=:'");
	p=path;
	q=input+strlen(input);
	while(*p)
	{
		if(*p=='\'') *q++='\'';	// 's doubled
		*q++=*p++;
	}
	*q=0;
	strcat(input,"'");
	printf("INPUT:%s\n", input);
	r=JDo(jt, input);
	free(input);
	return r;
}

char* Jinput(J jt, char* prompt)
{
	fputs(prompt, stdout);
	fflush(stdout); /* windows emacs */
	if(!fgets(input, sizeof(input), stdin)) {
		/* unix eof without readline */
		return "2!:55''";
	}
	return input;
}

/* J calls for output */
void Joutput(J jt, int type, char* s)
{
	if (MTYOEXIT == type) {
		exit((int)(I)s);
	}
	fputs(s, stdout);
	fflush(stdout);
}

void addargv(int argc, char* argv[], C* d)
{
 C *p,*q; I i;

 p=d+strlen(d);
 for(i=0;i<argc;++i)
 {
  if(sizeof(input)<(100+strlen(d)+2*strlen(argv[i]))) exit(100);
  if(1==argc){*p++=',';*p++='<';}
  if(i)*p++=';';	
  *p++='\'';
  q=argv[i];
  while(*q)
  {
   *p++=*q++;
   if('\''==*(p-1))*p++='\'';
  }
  *p++='\'';
 } 
 *p=0;
}

// set path and pathdll (wpath also set for win)
// WIN arg is 0, Unix arg is argv[0]
void jepath(char* arg)
{

#define sz 4000
 char arg2[sz],arg3[sz];
 char* src,*snk;int n,len=sz;
 // fprintf(stderr,"arg0 %s\n",arg);
 // try host dependent way to get path to executable
 // use arg if they fail (arg command in PATH won't work)
 n=readlink("/proc/self/exe",arg2,sizeof(arg2));
 if(-1==n) strcpy(arg2,arg); else arg2[n]=0;

 // arg2 is path (abs or relative) to executable or soft link
 n=readlink(arg2,arg3,sz);
 if(-1==n) strcpy(arg3,arg2); else arg3[n]=0;
 // fprintf(stderr,"arg3 %s\n",arg3);
 if('/'==*arg3)
  strcpy(path,arg3);
 else
 {
  getcwd(path,sizeof(path));
  strcat(path,"/");
  strcat(path,arg3);
 }
 *(1+strrchr(path,'/'))=0;
 // remove ./ and backoff ../
 snk=src=path;
 while(*src)
 {
	 if('/'==*src&&'.'==*(1+src)&&'.'==*(2+src)&&'/'==*(3+src))
	 {
		 *snk=0;
		 snk=strrchr(path,'/');
		 snk=0==snk?path:snk;
		 src+=3;
	 }
	 else if('/'==*src&&'.'==*(1+src)&&'/'==*(2+src))
      src+=2;
	 else
	  *snk++=*src++;
 }
 *snk=0;
 snk=path+strlen(path)-1;
 if('/'==*snk) *snk=0;

}

int main(int argc, char* argv[])
{
	void* callbacks[] = { Joutput, 0, Jinput, 0, (void*)SMCON};

	J jt = JInit();
	JSM(jt, callbacks);

	jepath(argv[0]);
	//printf("path:%s\n", path);
	//first(jt, path);
	
	addargv(argc,argv,input+strlen(input));
	jefirst(jt, 0, input);

	while (1) {
		JDo(jt, Jinput(jt, "   "));
	}
	JFree(jt);
	return 0;
}


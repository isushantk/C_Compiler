%{ 

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
int yylex(void);
void yyerror(const char *msg);
extern FILE* yyin;
%}


%token L G LE GE DIGIT CHARACTER
%left L G LE GE

%%

start: R   //{printf("Valid string \n");}
      ;
R: '(' R ')'
 | R L R
 | R G R
 | R LE R
 | R GE R
 | DIGIT
 | CHARACTER ;


%%

void yyerror(const char* msg)
{
	printf("%s\n", msg);
  exit(0);
}

int main(int argc, char** argv)
{
	if(argc>1) {
		yyin=fopen(argv[1], "r");
	}
	int ok=yyparse();
	if(ok==0) {
		printf("valid syntax\n");
	}
	
	return 0;
}


%{
#include <stdio.h>
#include "y.tab.h"
%}


%% 
[0-9] {return DIGIT;}
[a-zA-Z] {return CHARACTER;}
">" {return G;}
"<" {return L;}
">=" {return GE;}
"<=" {return LE;}
. ;
%%


int yywrap()
{
	return 1;
}
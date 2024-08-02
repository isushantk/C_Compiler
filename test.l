%{
#include <stdio.h>
%}

%%
[0-9][0-9][0-9][0-9] {
    int number = atoi(yytext);  // Convert matched text to an integer
    int sum = 0;
    int temp = number;
    
    // Calculate the sum of the digits
    while (temp > 0) {
        sum += temp % 10;
        temp /= 10;
    }

    if (sum == 16) {
        printf("Matched 4-digit number with sum 16: %s\n", yytext);
    } else {
        printf("Invalid 4-digit number with sum %d: %s\n", sum, yytext);
    }
}

. {
    /* Ignore other characters */
}

%%
int main() {
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}
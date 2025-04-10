%{
#include <stdio.h>
#include <string.h>
#include <limits.h>

char smallest[100][100];
int min_len = INT_MAX;
int count = 0;

void check_word(char *word) {
    int len = strlen(word);

    if (len < min_len) {
        min_len = len;
        count = 1;
        strcpy(smallest[0], word);
    } else if (len == min_len) {
        strcpy(smallest[count++], word);
    }
}
%}

%%

[[:alpha:]]+       { check_word(yytext); }
[ \t\n]+           ; // ignore spaces
.                  ; // ignore punctuation/symbols

%%

int main() {
    printf("Enter input: ");
    yylex();

    printf("\nSmallest word(s):\n");
    for (int i = 0; i < count; i++) {
        printf("%s\n", smallest[i]);
    }
    return 0;
}

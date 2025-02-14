#include <stdio.h>
#include <string.h>

int testfun(const char *str) {
    enum { q0, q1, q2, qz } state = q0;
    for (int i = 0; i < strlen(str); i++) {
        char c = str[i];
        switch (state) {
		case q0:
			if(c=='a'||c=='b'){
				state=q1;
			}
			break;
		case q1:
			if(c=='a'||c=='b){
				state=q2;
			}
			break;
		case q2:
			if(c=='1'||c=='0'){
				state=qz;
			}
			break;
		default:
			break;
        }
    }
    return state == q2;
}

int main() {
    const char *string_list[] = {"ab", "aba"};
    int n = 2;

    for (int i = 0; i < n; i++) {
        const char *s = string_list[i];
        if (testfun(s)) {
            printf("String '%s' is accepted by the DFA.\n", s);
        } else {
            printf("String '%s' is rejected by the DFA.\n", s);
        }
    }

    return 0;
}

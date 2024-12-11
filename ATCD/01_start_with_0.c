#include <stdio.h>
#include <string.h>

int testfun(const char *str) {
    enum { q0, q1, qz } state = q0;
    for (int i = 0; i < strlen(str); i++) {
        char c = str[i];
        switch (state) {
            case q0:
                if (c == '0') {
                    state = q1;
                } else {
                    state = qz;
                }
                break;
            case q1:
                if (c == '0' || c == '1') {
                    state = q1;
                }
                break;
            default:
                break;
        }
    }
    return state == q1;
}

int main() {
    const char *string_list[] = {"01", "0001"};
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

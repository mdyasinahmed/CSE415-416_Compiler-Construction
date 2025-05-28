#include <stdio.h>

unsigned long long factorial(int n) {
    if (n < 0) return 0;
    unsigned long long result = 1;
    for (int i = 2; i <= n; i++) {
        result *= i;
    }
    return result;
}

int main() {
    int n;
    printf("Enter a non-negative integer: ");
    scanf("%d", &n);

    if (n < 0) {
        printf("Factorial is not defined for negative numbers.\n");
    } else {
        printf("%d! = %llu\n", n, factorial(n));
    }
    return 0;
}
#include <stdio.h>
#include <stdbool.h>

bool two_sum(int arr[], int n, int target, int *index1, int *index2) {
    for (int i = 0; i < n - 1; ++i) {
        for (int j = i + 1; j < n; ++j) {
            if (arr[i] + arr[j] == target) {
                *index1 = i;
                *index2 = j;
                return true;
            }
        }
    }
    return false;
}

int main() {
    int arr[] = {2, 7, 11, 15};
    int n = sizeof(arr) / sizeof(arr[0]);
    int target = 9;
    int idx1, idx2;

    if (two_sum(arr, n, target, &idx1, &idx2)) {
        printf("Indices: %d, %d\n", idx1, idx2);
        printf("Numbers: %d, %d\n", arr[idx1], arr[idx2]);
    } else {
        printf("No two numbers add up to %d\n", target);
    }

    return 0;
}
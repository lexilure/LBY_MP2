#include <stdio.h>
#include <stdlib.h>

double *dot_product(double *A, double *B, int size) {
    double *sdot = (double *)malloc(sizeof(double));
    *sdot = 0.0;
    for (int i = 0; i < size; i++) {
        *sdot += A[i] * B[i];
    }
    return sdot;
}

int main() {
    int size;
    printf("Enter the length of the vectors: ");
    scanf("%d", &size);

    double *A = (double *)malloc(size * sizeof(double));
    double *B = (double *)malloc(size * sizeof(double));

    printf("Enter the elements of vector A: ");
    for (int i = 0; i < size; i++) {
        scanf("%lf", &A[i]);
    }

    printf("Enter the elements of vector B: ");
    for (int i = 0; i < size; i++) {
        scanf("%lf", &B[i]);
    }

    double *result = dot_product(A, B, size);

    printf("Memory location of the result (sdot): %p\n", (void *)result);

    // Free dynamically allocated memory
    free(A);
    free(B);
    free(result);

    return 0;
}

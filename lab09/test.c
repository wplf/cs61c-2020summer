#include<stdio.h>
#include<omp.h>
#include<x86intrin.h>
// #include <x86intrin.h>
__m128i _127 = _mm_set1_epi32(127);

int main(){

        int i;
        int array[100] = {0};

        // printf("the size of _127 %d", sizeof(_127));
        return 0;
        omp_set_num_threads(4);
        int tid;
        #pragma omp parallel for
        for(i = 0; i < 20; i++){
                tid = omp_get_thread_num();
                printf("Hello world from thread %d, and i equals %d\n", tid, i);
        }
        // return 0;
}
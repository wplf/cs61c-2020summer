#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "lfsr.h"

void lfsr_calculate(uint16_t *reg) {
    /* YOUR CODE HERE */
    uint16_t bit;
    bit = ((*reg >> 0 ) ^ (*reg >> 2) ^ (*reg >> 3) ^ (*reg >> 5)) & 1u;
    *reg = (bit << 15)  | (*reg >> 1);
}


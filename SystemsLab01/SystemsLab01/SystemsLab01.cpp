#include <stdio.h>

int bitOr(int x, int y)
{
    return ~(~x & ~y); // De Morgan
}

int negative(int x)
{
    return (~x + 1); // use ~ to flip all bits, then +1 to get the negative number
}

int getByte(int x, int n)
{
    return ((x >> (n << 3)) & 0xff); // shift n*8 bits to right, then & 0xff to get the last 8 bits
}

int flipBit(int x, int n)
{
    return (x ^ (1 << n)); // use xor operator with x and  (1 * 2^n)
}

unsigned int mulpw2(unsigned int x, int n)
{
    // if n is negative, then shift x to right by n bits
    // if n is positive, then shift x to left by n bits
    // there are 2 cases: ((~n + 1) & (n >> 31)) for positive, and (n & ~(n >> 31))) for negative
    // if n is positive, then it only execute x >> ((~n + 1) & (n >> 31)), ignore (n & ~(n >> 31)), and otherwise
    return (x >> ((~n + 1) & (n >> 31)) << (n & ~(n >> 31)));
}

int isSameSign(int x, int y) {
    // x ^ y will get the xor of x and y, which will be positive if x and y have the same sign
    // (x ^ y) >> 31 will get the sign bit of the xor result, which will be 0 if x and y have the same sign
    // !((x ^ y) >> 31) will return 1 if x and y have the same sign, and 0 otherwise 
    return !((x ^ y) >> 31);
}

int is8x(int x) {
    // 0x7 is 0b111 in binary. If number is a multiple of 8, then its last 3 bits will be 0
    // Result of AND operation of the number with 0x7 will be 0 if the number is a multiple of 8
    // Result of NOT operation on the result will be 1 if the number is a multiple of 8
    return !(x & 0x7);
}

int isPositive(int x) {
    // 'x>>31' will get the sign bit of the x
    // '!x' return true if x = 0 or false if x!=0
    // if x is less or equal to 0, '((x >> 31) | !x)' will return 1. Therefore, 'not' the result
    return !((x >> 31) | !x);
}

int isLess2n(int x, int n) {
    // x >> n will shift x to right by n bits
    // !x >> n will shift the result of !x to right by n bits
    // !(x >> n) will return 1 if x is less than 2^n, and 0 otherwise
    return !(x >> n);
}

int main()
{
    int score = 0;
    // 1.1
    printf("1.1 bitOr");
    if (bitOr(3, -9) == (3 | -9))
    {
        printf("\tPass.");
        score += 1;
    }
    else
        printf("\tFailed.");

    //1.2
    printf("\n1.2 negative");
    if (negative(0) == 0 && negative(9) == -9 && negative(-5) == 5)
    {
        printf("\tPass.");
        score += 1;
    }
    else
        printf("\tFailed.");

    //1.3
    printf("\n1.3 flipBit");
    if (flipBit(15, 0) == 14 && flipBit(0x3344, 9) == 0x3144 && flipBit(0, 3) == 8 && flipBit(0x7fffffff, 31) == 0xffffffff)
    {
        printf("\tPass.");
        score += 2;
    }
    else
        printf("\tFailed.");

    //1.4
    printf("\n1.4 getByte");
    if (getByte(8, 0) == 8 && getByte(0x11223344, 1) == 0x33)
    {
        printf("\tPass.");
        score += 2;
    }
    else
        printf("\tFailed.");

    //1.5
    printf("\n1.5 mulpw2");
    if (mulpw2(10, -1) == 5 && mulpw2(15, -2) == 3 && mulpw2(32, -4) == 2)
    {
        if (mulpw2(10, 1) == 20 && mulpw2(50, 2) == 200)
        {
            printf("\tAdvanced Pass.");
            score += 4;
        }
        else
        {
            printf("\tPass.");
            score += 3;
        }
    }
    else
        printf("\tFailed.");

    //2.1
    printf("\n2.1 isSameSign");
    if (isSameSign(4, 10) == 1 && isSameSign(-5, 2) == 0 && isSameSign(-5, -9) == 1)
    {
        printf("\tPass.");
        score += 2;
    }
    else
        printf("\tFailed.");

    //2.2
    printf("\n2.2 is8x");
    if (is8x(16) == 1 && is8x(3) == 0 && is8x(0) == 1)
    {
        printf("\tPass.");
        score += 2;
    }
    else
        printf("\tFailed.");

    //2.3
    printf("\n2.3 isPositive");
    if (isPositive(16) == 1 && isPositive(0) == 0 && isPositive(-8) == 0)
    {
        printf("\tPass.");
        score += 3;
    }
    else
        printf("\tFailed.");

    //2.4
    printf("\n2.4 isLess2n");
    if (isLess2n(12, 4) == 1 && isLess2n(8, 3) == 0 && isLess2n(9, 2) == 0)
    {
        printf("\tPass.");
        score += 3;
    }
    else
        printf("\tFailed.");

    printf("\n------\nYour score: %.1f", (float)score / 2);

}
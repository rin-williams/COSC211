/*
    Name: Rin Meng
    Student ID: 51940633
    Program name: "excercise3"
*/
#include <stdio.h>
int main()
{
    int n1;
    int n2;

    printf("Enter a number: ");
    scanf("%d", &n1);
    printf("Enter another number: ");
    scanf("%d", &n2);

    if (n1 > n2)
    {
        printf("%d is larger than %d", n1, n2);
    }
    else
    {
        printf("%d is less than or equal to %d", n1, n2);
    }

    return 0;
}

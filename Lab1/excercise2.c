/*
    Name: Rin Meng
    Student ID: 51940633
    Program name: "excercise2"
*/
#include <stdio.h>
int main()
{
    int arr[10];
    int max = 0;
    int min = 0;
    printf("Enter a number: ");
    scanf("%d", &arr[0]);
    min = arr[0];
    for (int i = 1; i < 10; i++)
    {
        printf("Enter a number: ");
        scanf("%d", &arr[i]);

        if (arr[i] < min)
        {
            min = arr[i];
        }
        if (arr[i] > max)
        {
            max = arr[i];
        }
    }
    for (int i = 0; i < 10; i++)
    {
        printf("Guess #%d is %d\n", i + 1, arr[i]);
    }
    printf("Max is: %d, Min is: %d", max, min);

    return 0;
}

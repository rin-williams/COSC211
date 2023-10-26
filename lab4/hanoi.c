#include <stdio.h>

/* number_of_disks[i] is the number of disks at peg i */
int number_of_disks[3];

main()
{

  int n;
  printf("Enter the number of disks:");
  scanf("%d", &n);

  /*initially, disks are all on peg 0 */
  number_of_disks[0] = n;
  number_of_disks[1] = 0;
  number_of_disks[2] = 0;
  print_towers();

  hanoi(n, 0, 1, 2);

  print_towers();
}

print_towers()
{

  printf("[");
  printf("%d", number_of_disks[0]);
  printf(", ");
  printf("%d", number_of_disks[1]);
  printf(", ");
  printf("%d", number_of_disks[2]);
  printf("]\n");
}

hanoi(int n, int src, int helper, int dest)
{

  if (n == 1)
  {
    /*move the disk from src to dest*/
    number_of_disks[src]--;
    number_of_disks[dest]++;
    print_towers();
  }
  else
  {

    /*move top n - 1 from src to helper with dest as a "helper"*/
    hanoi(n - 1, src, dest, helper);

    /*move disk n from src to dest*/
    number_of_disks[src]--;
    number_of_disks[dest]++;
    print_towers();

    /* move n - 1 disks from helper to dest */
    hanoi(n - 1, helper, src, dest);
  }
}

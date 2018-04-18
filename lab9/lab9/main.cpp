//
//  main.cpp
//  lab9
//
//  Created by Roman Mishchenko on 28.03.2018.
//  Copyright © 2018 Roman Mishchenko. All rights reserved.
//

#include <iostream>
#include <array>

template<class T>
void GnomeSort(T *A, int N)
{
    int i = 0;
    while(i < N)
    {
        if( i == 0 || A[i - 1] <= A[i] )
        {
          i++;
        }
        else
        {
            A[i] ^= A[i-1];
            A[i-1] ^= A[i];
            A[i] ^= A[i-1];
            
            i--;
        }
    }
}

int main()
{
    int n = 10;
    int * array = new int[n];
    int k;
    for (int i = 0; i < n; i++)
    {
        array[i] = rand() % 100;
        // cin >> k;
        // array[i] = k;
         std::cout << array[i] << " ";
    }
    std::cout << "\n";
    clock_t time;
    time = clock();
    GnomeSort(array, n);
    for (int i = 0; i < n; i++)
    {
        //array[i] = rand() % 100;
        // cin >> k;
        // array[i] = k;
        std::cout << array[i] << " ";
    }
    time = clock() - time;
    printf("%f\n", (double)time / CLOCKS_PER_SEC);
    return 0;
}

//
//  main.cpp
//  lab14
//
//  Created by Roman Mishchenko on 30.03.2018.
//  Copyright © 2018 Roman Mishchenko. All rights reserved.
//

#include <iostream>
#include <time.h>
using namespace std;
const int maxV = 10000;
int i, j, n;
int GR[maxV][maxV];
//алгоритм Флойда-Уоршелла
void FU(int D[][maxV], int V)
{
    int k;
    for (i = 0; i<V; i++) D[i][i] = 0;
    
    for (k = 0; k<V; k++)
        for (i = 0; i<V; i++)
            for (j = 0; j<V; j++)
                if (D[i][k] && D[k][j] && i != j)
                    if (D[i][k] + D[k][j]<D[i][j] || D[i][j] == 0)
                        D[i][j] = D[i][k] + D[k][j];
    
    
}
//главная функция
int main()
{
    srand(10);
    //setlocale(LC_ALL, "Rus");
    cout << "Количество вершин в графе > "; cin >> n;
    //cout << "Введите матрицу весов ребер:\n";
    for (i = 0; i<n; i++)
    {
        for (j = 0; j<n; j++)
        {
            /*cout << "GR[" << i + 1 << "][" << j + 1 << "] > ";*/
            GR[i][j] = rand() % 10;
        }
    }
    cout << "Матрица кратчайших путей:" << endl;
    double p = clock() / 1000000000.0000;
    FU(GR, n);
    cout << endl << clock() / 1000000000.0000 - p << endl;
    return 0;
}


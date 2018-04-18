//
//  main.cpp
//  lab6
//
//  Created by Roman Mishchenko on 23.03.2018.
//  Copyright © 2018 Roman Mishchenko. All rights reserved.
//

#include <iostream>
#include <ctime>
using namespace std;

struct treeList
{
    int key;
    treeList *left, *right;
};

void putInTheTree(int a,treeList **tree)
{
    if ((*tree) == NULL)
    {
        (*tree) = new treeList;
        (*tree)->key = a;
        (*tree)->left = (*tree)->right = NULL;
        return;
    }
    if (a>(*tree)->key)
    {
        putInTheTree(a, &(*tree)->right);
    }
    else
    {
        putInTheTree(a, &(*tree)->left);
    }
}


void print(treeList *tree, int n)
{
    if (tree == NULL)
    {
        return;
    }
    else
    {
        print(tree->left, n += 1);
        cout << tree->key << "\n";
        n -= 1;
        print(tree->right, n += 1);
    }
}

int main ()
{
    int n;
    cin >> n;
   
  
    treeList * tree = NULL;
    clock_t time;
    putInTheTree(n, &tree);
    time = clock();
    int put;
    for (int i = 1; i < n; i += 1)
    {
        put = rand() % (n+n);
        if(put == n)
        {
            put--;
        }
        putInTheTree(put, &tree);
    }
    time = clock() - time;
    printf("%f\n", (double)time / CLOCKS_PER_SEC);
    print(tree, n);
}


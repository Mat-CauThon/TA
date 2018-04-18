//
//  main.cpp
//  lab16
//
//  Created by Roman Mishchenko on 30.03.2018.
//  Copyright © 2018 Roman Mishchenko. All rights reserved.
//


#include <cstdio>
#include <vector>
#include <list>
#include <cstring>
#include <iostream>
#include <time.h>

using namespace std;

// Class to represent a Digraph, with vertices labeled
// from 0 to V-1, where V is the number of vertices
class Graph {
private:
    int V;
    vector <int>* adjList;
    bool* explored;
    list <int> topologicalOrder;
    
    void dfsUtil(int u) {
        explored[u] = true;
        for (vector <int>::iterator v = adjList[u].begin(); v != adjList[u].end(); v++)
            if (!explored[*v])
                dfsUtil(*v);
        topologicalOrder.push_front(u);
    }
    
    void dfs() {
        for (int u = 0; u < V; u++)
            if (!explored[u])
                dfsUtil(u);
    }
    
public:
    
    // create an empty Digraph having V vertices
    Graph(int V) {
        this->V = V;
        adjList = new vector <int>[V];
        explored = new bool[V];
        memset(explored, false, V * sizeof(bool));
    }
    
    ~Graph() {
        delete[] adjList;
        delete[] explored;
    }
    
    // add a directed edge u -> v to the digraph
    // returns false if either u or v is less than 0 or greater than equal to V
    // returns true if the edge was added to the digraph
    bool addEdge(int u, int v) {
        if (u < 0 || u >= V) return false;
        if (v < 0 || v >= V) return false;
        adjList[u].push_back(v);
        return true;
    }
    
    list <int> getTopologicalOrder() {
        if (topologicalOrder.empty())
            dfs();
        
        return topologicalOrder;
    }
    
    void printTopologicalOrder() {
        if (topologicalOrder.empty())
            dfs();
        
        printf("Topological Order :");
        for (list<int>::iterator it = topologicalOrder.begin(); it != topologicalOrder.end(); it++)
         printf(" %d", *it);
         printf("\n");
    }
    
};

int main() {
    int n;
    cin >> n;
    Graph G(n);
    srand(10);
    for (int i = 0; i < n; i++) {
        G.addEdge(rand() % 10, rand() % 10);
    }
    
    //std::cout
    double p = clock() / 1000000000.0000;
    G.printTopologicalOrder();
    cout << endl << clock() / 1000000000.0000 - p << endl << endl;
    
    
    return 0;
     
}

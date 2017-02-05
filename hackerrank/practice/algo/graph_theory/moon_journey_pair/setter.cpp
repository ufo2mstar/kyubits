//This problem can be thought of as a graph problem. The very first step is to compute how many different countries are there. For this, we apply Depth First Search to calculate how many different connected components are present in the graph where the vertices are represented by the people and the people from the same country form one connected component. After we get how many connected components are present, say M, we just need to calculate the number of ways of selecting two persons from two different connected component. Let us assume that component i contains Mi people. So, for the number of ways selecting two persons from different components, we subtract the number of ways of selecting two persons from the same component from the total numbers of ways of selecting two persons i.e.
//Ways = N choose 2 - (∑(Mi Choose 2) for i = 1 to M)
//Problem Setter's code :
//C++

   //Animesh Sinha

#include <iostream>
#include <list>
#include <vector>
#include <stdio.h>
#include <iterator>
#include <cmath>

#define MAX 100000

using namespace std;

list<int> *ad;
int *visited;
int vertices;

void DFS(int u)
{
    visited[u] = 1;

    vertices++;

    list<int>::iterator it;

    for(it=ad[u].begin();it!=ad[u].end();it++)
    {
        if(visited[*it] == 0)
        {
            visited[*it] = 1;
            DFS(*it);
        }
    }
}

int main()
{
    int i,m,u,v,numComponents=0,allv=0,temp=2,count=0;
    long long int n;
    int eachC[MAX];

    cin >> n >> m;

    if(n == 1)
    {
        cout <<"0\n";
        return 0;
    }

    ad = new list<int>[n];

    list<int>::iterator it;

    for(i=0;i<m;i++)
    {
        cin >> u >> v;

        ad[u].push_back(v);
        ad[v].push_back(u);
    }

    visited = new int[n];

    for(i=0;i<n;i++)
    {
        visited[i] = 0;
    }

    for(i=0;i<n;i++)
    {
        if(visited[i] == 0)
        {
            vertices = 0;
            DFS(i);
            eachC[numComponents] = vertices;
            numComponents++;
        }
    }

    long long int totalWays = n*(n-1) / 2;
    long long int sameWays = 0;

    for(i=0;i<numComponents;i++)
    {
        sameWays = sameWays + (eachC[i]*(eachC[i]-1) / 2);
    }
    cout << (totalWays - sameWays) << endl;
    return 0;
}

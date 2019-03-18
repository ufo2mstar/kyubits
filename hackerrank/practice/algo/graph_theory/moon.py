class Vertex:
    def __init__(self,name):
        self.name=name
        self.neighbour=[]
    def AddNeighbour(self,a):
        if a not in self.neighbour:
            self.neighbour.append(a)
            return True
        else:
            return False
class Graph:
    def __init__(self):
        self.vertex ={}
    def AddVertex(self,v):
        if isinstance(v,Vertex) and v.name not in self.vertex:
            self.vertex[v.name] = v
            return True
        else:
            return False
    def AddEdge(self,u,v):
        if u in self.vertex and v in self.vertex:
            for key ,value in self.vertex.items():
                if key==u:
                    value.AddNeighbour(v)
                if key==v:
                    value.AddNeighbour(u)
            return True
        else:
            return False
    def DFS(self,num):
        n=len(self.vertex)
        a=[0 for i in range(n)]
        #print(a)
        for key,node in self.vertex.items():
            if a[key]==0:
                self.dfsprint(a,key)
                n = n - a.count(0)
                num.append(n)
                n=a.count(0)
    def dfsprint(self,check,v):
        check[v]=1
        #print(v,end=" ")
        for i in self.vertex[v].neighbour:
            if check[i]==0:
                self.dfsprint(check,i)

n,m = input().split()
n,m = [int(n),int(m)]
graph=Graph()
#n=int(input('enter number of vertex : '))
for i in range(0,n):
    graph.AddVertex(Vertex(i))
#m=int(input('number of edge : '))
for i in range(m):
    #print('enter edage with weight : ')
    a=list(map(int,input().split()))
    #print(a[0],a[1],a[2])
    graph.AddEdge(a[0],a[1])
num = []
graph.DFS(num)
multi=0
total = (n*(n-1))//2
for i in range(len(num)):
    total -= (num[i]*(num[i]-1))//2
print(total)


Why is a DFS necessary? Instead my algorith does this :
1) Create an empty 2D vector.
2) For each I, and astronaut A and B there are can be following cases

    a) A and B are not in vector. So add them to vector and decrease n (number of single astronauts ) by 2.
    b) A is not in any vector. Append A to vector B. Decrease n by 1.
    c) B is not in any vector. Append B to vector A. Decrease n by 1.
    d) A and B are in vector. So, append all elements in vector B to vector A and delete vector B.

    After each of these cases, sort the vector. And to find if an element is in a vector we can now use binary search instead of linear one.

3) Now, we have n single astronauts. They can pair up between themselves in (n)(n-1)/2 ways and with others in (n * size of other group).

4) Others can pair them selves. To do this, we iterate over the original vector.
In case of large N and small I, this will not result in time out, since our 2D vector will have size <= I. We do not need to iterate over single astronauts unnessarily.
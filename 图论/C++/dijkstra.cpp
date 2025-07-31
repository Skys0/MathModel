/*单源最短路径：dijkstra */
#include<cstdio>
#include<iostream>
#include<vector>
#include<cstring>
#include<queue>

using namespace std;

const int maxn = 200010;
// maxn最大节点数，inf最大的边权
const int inf  = 1000000001;

// 有向边的储存，从from到to边权为w的一条边
struct Edge{
	int from,to,w;
};

struct note{
	int d,u;
	bool operator < (const note &rhs) const {
		return d > rhs.d;
	}
};

vector<Edge> edge;
vector<int> G[maxn];
bool vis[maxn];
int dis[maxn];
int cnt = 0;
int n,m;

// 添加一条边
void addedge(int u,int v,int w){
	edge.push_back((Edge){u,v,w});
	cnt = edge.size();
	G[u].push_back(cnt-1);
}

void dij(int s){
	priority_queue<note> q;
	for(int i=1;i<=n;i++)		dis[i] = inf;
	dis[s] = 0;
	memset(vis,0,sizeof(vis));
	q.push((note){0,s});
    
	while(!q.empty()){
		note x = q.top();q.pop();
		int u = x.u;
		if(vis[u])	continue;
		vis[u] = 1;
		for(unsigned int i=0;i<G[u].size();i++){
			Edge& e = edge[G[u][i]];
            // 松弛边
			if(dis[e.to] > dis[u] + e.w && dis[u]!=inf &&e.w != inf){
				dis[e.to] = dis[u] + e.w;
				// 如果还有松弛的余地，就更新单源距离
                q.push((note){dis[e.to],e.to});
			}
		}
	}
}

int main()
{
	int s;
    // 输入n为节点数，m条边，s为出发节点
	scanf("%d %d %d",&n,&m,&s);
    // 输入m次，输入有向边u——>v，边权为w
	for(int i=1;i<=m;i++){
		int u,v,w;
		scanf("%d %d %d",&u,&v,&w);
		addedge(u,v,w);
	}
	
	dij(s);
	
	for(int i=1;i<=n;i++){
		if(dis[i] != inf)
			printf("到达%d最小距离为%d\n",i,dis[i]);
		else
			printf("无法到达%d\n.",i);
	}
	return 0;
}

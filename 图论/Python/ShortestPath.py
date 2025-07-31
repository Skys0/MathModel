import matplotlib.pyplot as plt
import networkx as nx
import pandas as pd

# 有向图 G
G = nx.Graph()


# 将csv中的边添加图中
def AddEdges(data):
    for row in data.itertuples():
        G.add_edge(row[1], row[2], weight=row[3])


# 最短路径的主代码
def ShortestPath():
    p = dict(nx.shortest_path(G, weight="weight"))
    # 在什么参数都没加的情况下，返回一个dict，p[2][4] 表示从2点到4点的最短路径
    p1 = nx.shortest_path(G, source=2, target=3, weight="weight")
    # p1为从2点到3点的最短路径，返回路径
    dis = nx.shortest_path_length(G, source=2, target=3, weight="weight")
    print(p1, dis)

    # 使用FLoyd算法计算最短路径长度，适用于稠密图
    fw = nx.floyd_warshall(G, weight="weight")
    results = {a: dict(b) for a, b in fw.items()}
    print(results)


# 画图的主代码
def DrawGraph():
    edges = [(u, v) for (u, v, d) in G.edges(data=True)]
    # 将所有的边提取出来，可以添加点条件
    fig, ax = plt.subplots()
    # 用 Fruchterman-Reingold 力导向算法定位节点确定画图的节点位置
    pos = nx.spring_layout(G)
    # 画节点，可以自定义
    nx.draw_networkx_nodes(G, pos, node_size = 700)
    # 画边节点，可以自定义宽度，边型
    nx.draw_networkx_edges(G, pos, edgelist=edges)
    # 添加节点信息
    nx.draw_networkx_labels(G, pos, font_size=20, font_family="sans-serif")

    # 将边权一并画进图里
    edge_labels = nx.get_edge_attributes(G, "weight")
    nx.draw_networkx_edge_labels(G, pos, edge_labels)

    ax = plt.gca()
    ax.margins(0.08)
    plt.axis("off")
    plt.tight_layout()
    plt.show()


if __name__ == '__main__':
    # 创建有向图 G
    data = pd.read_csv("example.csv")  # 读取csv文件中的边
    AddEdges(data)
    ShortestPath()
    DrawGraph()

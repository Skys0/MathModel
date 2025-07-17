import numpy as np
import pandas as pd
from sklearn.cluster import DBSCAN
import matplotlib.pyplot as plt


if __name__ == '__main__':
    # 读入csv文件，xslx同理
    data = pd.read_csv("mydata.CSV").to_numpy()

    # DBSCAN 的函数，eps表示半径，min_samples是最小的点，可以根据需要调整
    dbScan = DBSCAN(eps = 0.5, min_samples = 10)
    dbScan.fit(data)

    # dbScan.labels_表示分类，-1表示不处于任何一个类中
    plt.scatter(data[:, 0], data[:, 1], c = dbScan.labels_)
    plt.show()
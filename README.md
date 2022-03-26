# CPN-network
CPN-模拟电路故障

第四次作业第2题

（2）ＣＰＮ神经网络在模拟电路故障诊断中的应用研究
 
 由于matlab中并没有函数可以直接搭建CPN网络，于是我并未使用matlab神经网络工具箱中的函数

数据处理：归一化

CPN神经网络（ 3-5-5）

输入层到竞争层的权值W的学习率为0.2

竞争层到输出层的权值V的学习率为0.1

训练次数为100

输入层神经元数目为3，竞争层神经元数目为5，输出层神经元数目为5

运行import_2.m导入数据data2.mat 其中x为数据集 d为标签集

再运行exam4_2.m进行网络的训练及回想

p为input                         t为target

![image](https://user-images.githubusercontent.com/92127845/160222363-fd4f8b77-8ae8-4bde-9ae8-cd013022be4d.png)
![image](https://user-images.githubusercontent.com/92127845/160222366-30c08e25-4e51-46cd-8f1a-9e73aa39ad59.png)


网络训练后得到的结果

![image](https://user-images.githubusercontent.com/92127845/160222367-f7817f75-6f86-4294-8c73-0ecb515ac1bc.png)

网络回想 pc为测试输入 outc为输出

![image](https://user-images.githubusercontent.com/92127845/160222372-42a9a14e-f9fb-4546-a903-ab6a1deff6b6.png)

可以看出，该CPN神经网络拟合效果很好。

该网络中W,V的的权值取法很重要，由于我不熟悉该网络，并且网上也没有太多关于matlab如何构建CPN网络的资料，于是我踩了很多坑，实在愚笨，耗时一个星期才终于完成这个CPN网络。

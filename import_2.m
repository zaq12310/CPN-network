
%导入数据集
x=importdata('E:\计算智能作业\第四次作业\CPN-模拟电路故障\data.xlsx');  
%导入期望输出
x=x';

d=importdata('E:\计算智能作业\第四次作业\CPN-模拟电路故障\期望数据.xlsx');  
%导入期望输出

save  'data2.mat'  x d;
clear;close all;
clc;
load data2.mat
p=x'
t=d'
t_out=t;
%t_out为计算值,t为导师值
% p(:,1)=10*p(:,1);
% p(:,2)=2*p(:,2);
% % %归一化
% input=mapminmax(input,0,1);
% target=mapminmax(target,0,1);

% p=[0.4500 0.1282 0.2110];
% t=[1 0 0 0 0];
% t_out=t;
n=3;%输入层神经元n为3
m=15;%输入数据样本集15个
h=5;
%竞争层神经元h为18个
%输入层与竞争层权值为W，竞争层与输出层的权值为V
W=rands(h,n)/2+0.5;
V=rands(5,h)/2+0.5;

%对输入向量进行归一化处理
for i=1:m
    if p(i,:)==0
        p(i,:)=p(i,:);
    else
        p(i,:)=p(i,:)/norm(p(i,:));
    end
end

%设置学习步数为100
epoch=100;
s=zeros(1,h);
%开始训练
for j=1:m
    while epoch>0

        %归一化正向权值W

        for i=1:h
            W(i,:)=W(i,:)/norm(W(i,:));
            s(i)=p(j,:)*W(i,:)';
        end
        %求输出最大的神经元，即获胜神经元
        temp=max(s);
        for i=1:h
            if temp==s(i)
                count=i;
            end
        end
        %将所有竞争层神经元的输出均设为0
        for i=1:h
            s(i)=0;
        end
        %将竞争获胜的神经元输出设为1
        s(count)=1;
        %权值调整
        W(count,:)=W(count,:)+0.2*(p(j,:)-W(count,:));
        W(count,:)=W(count,:)/norm(W(count,:));
        V(:,count)=V(:,count)+0.1*(t(j,:)'-t_out(j,:)');
        %         if count-1>0
        %             V(:,count-1)=V(:,count-1)+0.05*(t(j,:)'-t_out(j,:)');
        %         end
        %         if count+1<19
        %             V(:,count+1)=V(:,count+1)+0.05*(t(j,:)'-t_out(j,:)');
        %         end
        %         if count-2>0
        %             V(:,count-2)=V(:,count-2)+0.01*(t(j,:)'-t_out(j,:)');
        %         end
        %         if count+2<19
        %             V(:,count+2)=V(:,count+2)+0.01*(t(j,:)'-t_out(j,:)');
        %         end
        %计算网络输出
        t_out(j,:)=V(:,count)';
        %训练次数递减
        epoch=epoch-1;
    end

end

%训练结束
t_out

%%
%网络回想
%网络的输入模式pc
% pc=[0.5 1;1 3];
pc=x(:,8:9)'

%初始化pc，归一化
n_c=2;%输入n_c=2个元素
for i=1:n_c
    if pc(i,:)==0
        pc(i,:)=pc(i,:);
    else
        pc(i,:)=p(i,:)/norm(pc(i,:));
    end
end
%网络输出
outc=[0 0 0 0 0;0 0 0 0 0];
sc=zeros(1,h);
for j=1:n_c
    for i=1:h
        sc(i)=pc(j,:)*W(i,:)';
    end
    tempc=max(sc);
    for i=1:h
        if tempc==sc(i)
            countp=i;
        end
        sc(i)=0;
    end
    sc(countp)=1;
    outc(j,:)=V(:,countp)';
end
%回想结束
outc
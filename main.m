% MATLAB必备三句初始化
% 清除命令行窗口，清除工作区变量，关闭所有图窗
clc;
clear;
close all;
% 随机数种子初始化，添加当前文件夹及其子文件夹到搜索路径
rng('default');
addpath(genpath(pwd));

% 定义泵浦源及其初始化
pump_1 = PUMP;
pump_1.Init(50,808,300);
pump_2 = PUMP;
pump_2.Init(50,808,300);
pump_3 = PUMP;
pump_3.Init(50,808,300);
pump_4 = PUMP;
pump_4.Init(50,808,300);
pump_5 = PUMP;
pump_5.Init(50,808,300);

% 定义晶体及其初始化
crystal = CRYSTAL;
crystal.Init(0.0025,300);


% 设置绘图网络
x=linspace(-crystal.r,crystal.r,2500);
y=linspace(-crystal.r,crystal.r,2500);
[x2,y2]=meshgrid(x,y);
i_total=zeros(size(x2));

% 进行泵浦传播
i = crystal.Propagation(pump_1,x2,y2,0);
i_total = i_total + i;
i = crystal.Propagation(pump_2,x2,y2,72);
i_total = i_total + i;
i = crystal.Propagation(pump_3,x2,y2,144);
i_total = i_total + i;
i = crystal.Propagation(pump_4,x2,y2,216);
i_total = i_total + i;
i = crystal.Propagation(pump_5,x2,y2,288);
i_total = i_total + i;

% 对强度进行归一化
i_total=real(i_total/max(max(i_total)));

% 绘制图像
figure(1);
surf(x,y,i_total);
colorbar;
shading interp;
hold on;
xlabel('x方向距离 (m)');
ylabel('y方向距离 (m)');
zlabel('归一化强度 I');
title('X-Y 五方向泵浦传播');
view(0,90);
figure(2);
surf(x,y,i_total);
shading interp;
hold on;
xlabel('x方向距离 (m)');
ylabel('y方向距离 (m)');
zlabel('归一化强度 I');
title('X-I 五方向泵浦传播');
view(0,0);
figure(3);
surf(x,y,i_total);
shading interp;
hold on;
xlabel('x方向距离 (m)');
ylabel('y方向距离 (m)');
zlabel('归一化强度 I');
title('Y-I 五方向泵浦传播');
view(90,0);
figure(4);
surf(x,y,i_total);
colorbar;
shading interp;
hold on;
xlabel('x方向距离 (m)');
ylabel('y方向距离 (m)');
zlabel('归一化强度 I');
title('X-Y-I 五方向泵浦传播');
figure(5);
contour(x,y,i_total,30);
colorbar;
xlabel('x方向距离 (m)');
ylabel('y方向距离 (m)');
zlabel('归一化强度 I');
title('X-Y 五方向泵浦传播等强度线');
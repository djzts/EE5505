%% HW2 Problem 4 Coding 
clc
%% script of Rayleigh
sigma_set=[0.5 1 2 3 4];
figure('name','Rayleigh')
for i=1:5
    sigma=sigma_set(i);                      %Choose the sigma
    [x,F_p,sum_F_p]=Rayleigh(sigma);       %Rayleigh function defined in .m
    subplot(1,2,1) 
    plot(x,F_p);                             %Plot each method
    hold on;
    subplot(1,2,2) 
    plot(x,sum_F_p);                         %Plot each method
    hold on;
end
subplot(1,2,1)
title('Calculated by cumulative distribution')
legend('sigma=0.5','sigma=1','sigma=2','sigma=3','sigma=4','Location','southeast')
grid on;
subplot(1,2,2)
title('Calculated by sum of PDF times gap')
legend('sigma=0.5','sigma=1','sigma=2','sigma=3','sigma=4','Location','southeast')
grid on;

%% script of Rice
Pr=1;
K_set=[1,5,10];
figure('name','Rice')
for i=1:3
    K=K_set(i);                      %Choose the sigma
    [x,G_p]=Rice(Pr,K);       %Rayleigh function defined in .
    plot(x,G_p);                             %Plot each method
    hold on;
end
title('Calculated by sum of PDF times gap')
legend('K=1','K=5','K=10','Location','southeast')
grid on;

%% script of Nakagami
figure('name','Nakagami')
for i=1:3
    K=K_set(i);                      %Choose the sigma
    m=(K+1)^2/(2*K+1);
    [x,G_p]=Nakagami(Pr,m);
    [x,F_p]=Rice(Pr,K);       %Rayleigh function defined in .
    subplot(1,3,i)
    plot(x,G_p);                      %Plot each method
    hold on;
    plot(x,F_p);
    hold on;
    str=sprintf('plot in codition of K=%0.5f',K);
    title(str);
    legend('Nakagami','Rice','Location','southeast');
    grid on;
    ylim([0,1])
end
clear
clc

%Varibles/data
V0= 5.5;
t = [.5, 1, 1.5 ,2 ,2.5 ,3 ,3.5 ,4 ,4.5 ,5]';
V =[3.5, 2.5, 1.75, 1.25, .8, .6, .5, .4, .25, .15]';
v1= log(V/V0);

%line of best fit
x=t;
y=v1;
slope= x\y;

x_plot = [min(x):1e-3:max(x)]';
y_plot = slope.*x_plot;

%confidence interval
n=length(x);
sig = sqrt(sum((y - x*slope).^2)./(n - 1)); 
se_s = sig*sqrt(1/((n - 1)*std(x)^2)); 
ci_s = tinv(0.975,n - 1)*se_s; 
SE = sig.*sqrt(1/length(x) + (x_plot-mean(x)).^2./((length(x)-1)*std(x).^2));
CI = tinv(0.975, length(x)-1).*SE;

%graph
figure(1)
clf
plot(x,y,'ok','MarkerFaceColor','b','MarkerSize',7)
hold on
plot(x_plot,y_plot,'r-','LineWidth',2)
plot(x_plot, y_plot + CI, 'g--', 'LineWidth', 1)
plot(x_plot, y_plot - CI, 'g--', 'LineWidth', 1)
hold off
ylabel(' ln(Vt/V0) ')
xlabel('t (sec) ')
set(figure(1), 'color', 'white')
axis([.400, 5.25, -3.7, 0]) 

%equations
ta= slope(1,1);
tau= 1/(-ta);
disp('the time constant is:')
disp(tau)

ci_tau = (1/(slope.^2))*ci_s;
disp('the uncertainty is:')
disp(ci_tau)


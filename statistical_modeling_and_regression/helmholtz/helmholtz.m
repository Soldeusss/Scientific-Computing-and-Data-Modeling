clear
clc
%Varibles/data

I = [1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9, 2.0,]';
r = .01*[5.75, 5.5, 5.15, 5, 4.85, 4.6, 4.5, 4.3, 4.15, 4]'; %converted from cm

R = .16;
Tr = 30;
V = 9;
U = ((4*pi)*10^-7);
k = 8/((125)^(1/2));

%line of best fit

x = I.^(-1); 
y = r; 
slope =x\y; 

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
ylabel('r (m) ')
xlabel('1/I (A^{-1}) ')
set(figure(1), 'color', 'white')
axis([.485, .92, .027, .071]) 


%equations


q = (1/(slope.^2))*((2*V*R^2)/(k^2*U^2*Tr*2));
ci_q_m = (2 * (1/(slope.^3))) * ((2*V*R^2)/(k^2*U^2*Tr*2))*ci_s;
disp('q/m (C/kg) = ')
disp(q)
disp('ci_q/m = ')
disp(ci_q_m)

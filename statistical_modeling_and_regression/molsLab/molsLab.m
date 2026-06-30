clear
clc
R= 8.314; % gas constant
p=101325;
T = 273+[100, 90.5, 81, 69, 60, 55 ,53, 47, 41.5, 36.5, 34]'; % Temperature X
V = (1e-9)* [73, 71.5, 70, 69, 68.5, 67.5, 65, 64.5, 63.5, 62, 61]'; % volume Y 

           %line of best fit
% g = ones(x,2);
% g(:,2)= T;
X=T;
Y=V;
slope = X\Y;
T_plot = [min(T):1e-3:max(T)]';
V_plot = (slope.*T_plot);

            % confidence interval
n=length(X);

sig = sqrt(sum((Y - X*slope).^2)./(n - 1)); 
se_s = sig*sqrt(1/((n - 1)*std(X)^2)); 
ci_s = tinv(0.975,n - 1)*se_s; 
SE = sig.*sqrt(1/length(X) + (T_plot-mean(X)).^2./((length(X)-1)*std(X).^2));
CI = tinv(0.975, length(X)-1).*SE;

%graph

figure(1)
clf()
plot(T,V,'bo','markersize', 7, 'markerfacecolor','b')
hold on
plot(T_plot, V_plot, 'r-', 'linewidth', 2.5)
plot(T_plot, V_plot + CI, 'g--', 'LineWidth', 1)
plot(T_plot, V_plot - CI, 'g--', 'LineWidth', 1)
hold off
axis([303.5, 375, 5.90e-8, 7.8e-8]) 

xlabel('T (K)') %label for x axis
ylabel('V (m^{3})')  %label for y axis
set(figure(1), 'color', 'white')
% axis([-3.32, -2.58, 3.98, 5.01]) %(xmin,xmax, ymin,ymax)
% xtick = [-3.3, -3.2, -3.1,-2.9, -2.8, -2.7, -2.6]';
% xtick_label = xtick;
% ytick = [4, 4.1, 4.2, 4.3, 4.4, 4.5, 4.6, 4.7, 4.8, 4.9, 5]'; 
% ytick_label = ytick;

% calculations
disp('s =')
disp(slope)
disp('ci_s =')
disp(ci_s)
N = ((slope.*p)./R);
disp('N =')
disp(N)
ci_n = (p/R) * ci_s;
disp('ci_n =')
disp(ci_n)

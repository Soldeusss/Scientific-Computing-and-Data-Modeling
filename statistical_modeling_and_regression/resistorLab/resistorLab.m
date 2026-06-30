clear

clc

%Data
%unknown resistor 1 brown black red gold
I1 = 1e-3*[1.2, 3.3, 5.3, 7.4, 9.4, 11.6, 13.5, 15.5, 17.6, 19.7]'; % converted from milliamps to amps
V1 = [1.2, 3.2, 5.2 7.2, 9.2, 11.3, 13.2, 15.2, 17.2, 19.2]';
%unknown resistor 2 orange orange red gold
I2 = 1e-3*[.3, 1.0, 1.5, 2.2, 2.7, 3.1, 3.7, 4.3, 4.9, 5.5]';
V2 = [1.1, 3.4, 5.0, 7.2, 8.8, 10.7, 12.1 14, 15.9 17.7]';
%unknown resistor 3 brown, green, red, gold
I3= 1e-3*[.9, 2.0, 3.0, 4.3, 6.0, 7.4, 8.9, 10.6, 11.9, 13.5]';
V3= [1.3, 3.0, 5.5, 6.4, 8.9, 11.00, 13.3, 15.67, 17.7, 20]';

% line of best fit 
slope1= I1\V1; % equation for resistance is V/I
slope2= I2\V2;
slope3= I3\V3;

I1_plot = [min(I1):1e-3:max(I1)]';
V1_plot = slope1.*I1_plot;

I2_plot = [min(I2):1e-3:max(I2)]';
V2_plot = slope2.*I2_plot;

I3_plot = [min(I3):1e-3:max(I3)]';
V3_plot = slope3.*I3_plot;

%confidence interval
n=length(I1);

sig1 = sqrt(sum((V1 - I1*slope1).^2)./(n - 1)); 
se_s1 = sig1*sqrt(1/((n - 1)*std(I1)^2)); 
ci_s1 = tinv(0.975,n - 1)*se_s1; 
SE1 = sig1.*sqrt(1/n + (I1_plot-mean(I1)).^2./(n-1)*std(I1).^2);
CI1 = tinv(0.975, n-1).*SE1;

sig2 = sqrt(sum((V2 - I2*slope2).^2)./(n - 1)); 
se_s2 = sig2*sqrt(1/((n - 1)*std(I2)^2)); 
ci_s2 = tinv(0.975,n - 1)*se_s2; 
SE2 = sig2.*sqrt(1/n + (I2_plot-mean(I2)).^2./(n-1)*std(I2).^2);
CI2 = tinv(0.975, n-1).*SE2;

sig3 = sqrt(sum((V3 - I3*slope3).^2)./(n - 1)); 
se_s3 = sig3*sqrt(1/((n - 1)*std(I3)^2)); 
ci_s3 = tinv(0.975,n - 1)*se_s3; 
SE3 = sig3.*sqrt(1/n + (I3_plot-mean(I3)).^2./(n-1)*std(I3).^2);
CI3 = tinv(0.975, n-1).*SE3;


%plots
figure(1)
clf
plot(I1,V1,'ok','MarkerFaceColor','b','MarkerSize',7)
hold on
plot(I1_plot,V1_plot,'r-','LineWidth',2)
plot(I1_plot,V1_plot + CI1,'g--','LineWidth',1)
plot(I1_plot,V1_plot - CI1,'g--','LineWidth',1)
hold off
set(figure(1), 'color', 'white')
axis([.0009, .0205, .6, 20]) 


ylabel('V1 (V)')
xlabel('I1 (A)')

figure(2)
clf
plot(I2,V2,'ok','MarkerFaceColor','b','MarkerSize',7)
hold on
plot(I2_plot,V2_plot,'r-','LineWidth',2)
plot(I2_plot,V2_plot + CI2,'g--','LineWidth',1)
plot(I2_plot,V2_plot - CI2,'g--','LineWidth',1)
hold off
set(figure(2), 'color', 'white')
axis([.0001, .0065, .6, 18.5]) 
ylabel('V2 (V)')
xlabel('I2 (A)')

figure(3)
clf
plot(I3,V3,'ok','MarkerFaceColor','b','MarkerSize',7)
hold on
plot(I3_plot,V3_plot,'r-','LineWidth',2)
plot(I3_plot,V3_plot + CI3,'g--','LineWidth',1)
plot(I3_plot,V3_plot - CI3,'g--','LineWidth',1)
hold off
set(figure(3), 'color', 'white')
axis([.0004, .0140, .85, 20.5])

ylabel('V3 (V)')
xlabel('I3 (A)')
% calculations
R1 = slope1;
R2 = slope2;
R3 = slope3;
ci_R1 = ci_s1;
ci_R2 = ci_s2;
ci_R3 = ci_s3;

disp('Resistor 1 (Ohms) =')
disp(R1)
disp('ci_R_1 =')
disp(ci_R1)
disp(' ')
disp('Resistor 2 (Ohms) =')
disp(R2)
disp('ci_R_2 =')
disp(ci_R2)
disp(' ')
disp('Resistor 3 (Ohms) =')
disp(R3)
disp('ci_R_3 =')
disp(ci_R3)

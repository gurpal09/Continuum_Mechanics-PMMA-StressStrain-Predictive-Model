%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%Sensitivity Study of the Material Coefficients for the DSGZ Model
%
%Author: Gurpal Singh
%
%Date: 4/29/2017
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Optimized Coeffs were found from curve fit:
C1 = 1.379;
C2 = 1.722;
C3 = 0.003;  
C4 =10.25; 
K = 3.5; 
a = 1196; 
alpha = 12;
m = 0.06036;

%Study will be performed by changing each coefficient one at 
%a time for the data that was initially fit.

%Experimental Data for Duan Figure 1
%Temperature: 323 K
%Strain Rate: 0.001/s

strainrate = 0.001;
T = 323;

Data_1= [0.0650   75.8767
         0.1936   65.8009
         0.2928   65.1989
         0.3907   66.8687
         0.4874   71.3780
         0.5914   77.7775
         0.6912   85.1249
         0.7911   93.6079
         0.8912  104.5513
         0.9928  115.6836]; 
     
 %DSGZ Model Calculation    
 se = 0:.01:1;
 se = se';
 for i = 1:length(se)
    strain = se(i,1);
    y(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Computing R^2 value of the fit
strain_data = zeros(length(Data_1(:,2)),1);

%Model evaluated at experimental data points only
f = zeros(length(Data_1(:,2)),1);
strain_data(:,1) = Data_1(:,1);

%Calculation
 for i = 1:length(f)
    strain = strain_data(i,1);
    f(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Experimental Data  
exp_data = Data_1(:,2);

%Function for R^2
[r2_y rmse] = rsquare(exp_data,f);

%%%%%%%%%------C1 Decreased by 50%-------%%%%%%%%%
C1 = C1/2;

%DSGZ Model Calculation  
se = 0:.01:1;
se = se';
for i = 1:length(se)
    strain = se(i,1);
    y1(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
end

%Computing R^2 value of the fit
strain_data = zeros(length(Data_1(:,2)),1);

%Model evaluated at experimental data points only
f = zeros(length(Data_1(:,2)),1);
strain_data(:,1) = Data_1(:,1);

%Calculation
 for i = 1:length(f)
    strain = strain_data(i,1);
    f(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Experimental Data  
exp_data = Data_1(:,2);

%Function for R^2
[r2_y1 rmse] = rsquare(exp_data,f);

%%%%%%%%%------C1 Increased by 50%-------%%%%%%%%%

% Increase by 50 (extra factor of 2 because of decrease earlier%
C1 = C1*2*2;

%DSGZ Model Calculation
 for i = 1:length(se)
    strain = se(i,1);
    y2(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Computing R^2 value of the fit
strain_data = zeros(length(Data_1(:,2)),1);

%Model evaluated at experimental data points only
f = zeros(length(Data_1(:,2)),1);
strain_data(:,1) = Data_1(:,1);

%Calculation
 for i = 1:length(f)
    strain = strain_data(i,1);
    f(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Experimental Data  
exp_data = Data_1(:,2);

%Function for R^2
[r2_y2 rmse] = rsquare(exp_data,f);

%Plotting
figure 
xlabel('True Strain')
ylabel('True Stress (MPa)')
title('Coefficient Sensitivity Study: C_{1}')
hold on
% plot(Data_1(:,1),Data_1(:,2),'b*')
hold on
plot(se,y,'b')
plot(se,y1,'r')
plot(se,y2,'g')
hold on
txt1 = ' T = 323 K';
text(0.7,20,txt1)
txt2 = ' Strain Rate = 0.001';
text(0.7,10,txt2)
s1 = 'R^2 =  ';

s2 = num2str(r2_y);
s = strcat(s1,s2);
text(0.4,65, s ,'FontSize',10)

s2 = num2str(r2_y1);
s = strcat(s1,s2);
text(0.35,100, s ,'FontSize',10)

s2 = num2str(r2_y2);
s = strcat(s1,s2);
text(0.35,40, s ,'FontSize',10)
legend('Original Curve', 'C_{1} decreased by 50%', 'C_{1} increased by 50%')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Coefficient: C2

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Coeffs were found from curve fit:
C1 = 1.379;
C2 = 1.722;
C3 = 0.003;  
C4 =10.25; 
K = 3.5; 
a = 1196; 
alpha = 12;
m = 0.06036;

%DSGZ Model Calculation
for i = 1:length(se)
    strain = se(i,1);
    y(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
end

%Computing R^2 value of the fit
strain_data = zeros(length(Data_1(:,2)),1);

%Model evaluated at experimental data points only
f = zeros(length(Data_1(:,2)),1);
strain_data(:,1) = Data_1(:,1);

%Calculation
 for i = 1:length(f)
    strain = strain_data(i,1);
    f(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Experimental Data  
exp_data = Data_1(:,2);

%Function for R^2
[r2_y rmse] = rsquare(exp_data,f);

%%%%%%%%%------C2 Decreased by 50%-------%%%%%%%%%
C2 = C2/2;

%DSGZ Model Calculation
 for i = 1:length(se)
    strain = se(i,1);
    y1(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Computing R^2 value of the fit
strain_data = zeros(length(Data_1(:,2)),1);

%Model evaluated at experimental data points only
f = zeros(length(Data_1(:,2)),1);
strain_data(:,1) = Data_1(:,1);

%Calculation
 for i = 1:length(f)
    strain = strain_data(i,1);
    f(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Experimental Data  
exp_data = Data_1(:,2);

%Function for R^2
[r2_y1 rmse] = rsquare(exp_data,f);

%%%%%%%%%------C2 Increased by 50%-------%%%%%%%%%
% Increase by 50 (extra factor of 2 because of decrease earlier%
C2 = C2*2*2;

%DSGZ Model Calculation
 for i = 1:length(se)
    strain = se(i,1);
    y2(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Computing R^2 value of the fit
strain_data = zeros(length(Data_1(:,2)),1);

%Model evaluated at experimental data points only
f = zeros(length(Data_1(:,2)),1);
strain_data(:,1) = Data_1(:,1);

%Calculation
 for i = 1:length(f)
    strain = strain_data(i,1);
    f(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Experimental Data  
exp_data = Data_1(:,2);

%Function for R^2
[r2_y2 rmse] = rsquare(exp_data,f);

%Plotting
figure 
xlabel('True Strain')
ylabel('True Stress (MPa)')
title('Coefficient Sensitivity Study: C_{2}')
hold on
plot(se,y,'b')
plot(se,y1,'r')
plot(se,y2,'g')
hold on
txt1 = ' T = 323 K';
text(0.7,20,txt1)
txt2 = ' Strain Rate = 0.001';
text(0.7,10,txt2)
s1 = 'R^2 = ';

s2 = num2str(r2_y);
s = strcat(s1,s2);
text(0.4,65, s ,'FontSize',10)

s2 = num2str(r2_y1);
s = strcat(s1,s2);
text(0.35,100, s ,'FontSize',10)

s2 = num2str(r2_y2);
s = strcat(s1,s2);
text(0.35,49, s ,'FontSize',10)
legend('Original Curve', 'C_{2} decreased by 50%', 'C_{2} increased by 50%')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Coefficient: C3

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Coeffs were found from curve fit:
C1 = 1.379;
C2 = 1.722;
C3 = 0.003;  
C4 =10.25; 
K = 3.5; 
a = 1196; 
alpha = 12;
m = 0.06036;

%DSGZ Model Calculation
for i = 1:length(se)
    strain = se(i,1);
    y(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
end

%Computing R^2 value of the fit
strain_data = zeros(length(Data_1(:,2)),1);

%Model evaluated at experimental data points only
f = zeros(length(Data_1(:,2)),1);
strain_data(:,1) = Data_1(:,1);

%Calculation
 for i = 1:length(f)
    strain = strain_data(i,1);
    f(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Experimental Data  
exp_data = Data_1(:,2);

%Function for R^2
[r2_y rmse] = rsquare(exp_data,f);

%%%%%%%%%------C3 Decreased by 50%-------%%%%%%%%%
C3 = C3/2;

%DSGZ Model Calculation
 for i = 1:length(se)
    strain = se(i,1);
    y1(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Computing R^2 value of the fit
strain_data = zeros(length(Data_1(:,2)),1);

%Model evaluated at experimental data points only
f = zeros(length(Data_1(:,2)),1);
strain_data(:,1) = Data_1(:,1);

%Calculation
 for i = 1:length(f)
    strain = strain_data(i,1);
    f(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Experimental Data  
exp_data = Data_1(:,2);

%Function for R^2
[r2_y1 rmse] = rsquare(exp_data,f);

%%%%%%%%%------C3 Increased by 50%-------%%%%%%%%%
% Increase by 50 (extra factor of 2 because of decrease earlier%
C3 = C3*2*2;

%DSGZ Model Calculation
 for i = 1:length(se)
    strain = se(i,1);
    y2(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Computing R^2 value of the fit
strain_data = zeros(length(Data_1(:,2)),1);

%Model evaluated at experimental data points only
f = zeros(length(Data_1(:,2)),1);
strain_data(:,1) = Data_1(:,1);

%Calculation
 for i = 1:length(f)
    strain = strain_data(i,1);
    f(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Experimental Data  
exp_data = Data_1(:,2);

%Function for R^2
[r2_y2 rmse] = rsquare(exp_data,f);

%Plotting
figure 
xlabel('True Strain')
ylabel('True Stress (MPa)')
title('Coefficient Sensitivity Study: C_{3}')
hold on
% plot(Data_1(:,1),Data_1(:,2),'b*')
hold on
plot(se,y,'b')
plot(se,y1,'r')
plot(se,y2,'g')
hold on
txt1 = ' T = 323 K';
text(0.7,20,txt1)
txt2 = ' Strain Rate = 0.001';
text(0.7,10,txt2)
s1 = 'R^2 = ';

s2 = num2str(r2_y);
s = strcat(s1,s2);
text(0.4,65, s ,'FontSize',10)

s2 = num2str(r2_y1);
s = strcat(s1,s2);
text(0.15,45, s ,'FontSize',10)

s2 = num2str(r2_y2);
s = strcat(s1,s2);
text(0.2,80, s ,'FontSize',10)
legend('Original Curve', 'C_{3} decreased by 50%', 'C_{3} increased by 50%')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Coefficient: C4

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Coeffs were found from curve fit:
C1 = 1.379;
C2 = 1.722;
C3 = 0.003;  
C4 =10.25; 
K = 3.5; 
a = 1196; 
alpha = 12;
m = 0.06036;

%DSGZ Model Calculation
 for i = 1:length(se)
    strain = se(i,1);
    y(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Computing R^2 value of the fit
strain_data = zeros(length(Data_1(:,2)),1);

%Model evaluated at experimental data points only
f = zeros(length(Data_1(:,2)),1);
strain_data(:,1) = Data_1(:,1);

%Calculation
 for i = 1:length(f)
    strain = strain_data(i,1);
    f(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Experimental Data  
exp_data = Data_1(:,2);

%Function for R^2
[r2_y rmse] = rsquare(exp_data,f);

%%%%%%%%%------C4 Decreased by 50%-------%%%%%%%%%

% Decrease by 50%
C4 = C4/2;

%DSGZ Model Calculation
 for i = 1:length(se)
    strain = se(i,1);
    y1(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Computing R^2 value of the fit
strain_data = zeros(length(Data_1(:,2)),1);

%Model evaluated at experimental data points only
f = zeros(length(Data_1(:,2)),1);
strain_data(:,1) = Data_1(:,1);

%Calculation
 for i = 1:length(f)
    strain = strain_data(i,1);
    f(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Experimental Data  
exp_data = Data_1(:,2);

%Function for R^2
[r2_y1 rmse] = rsquare(exp_data,f);

%%%%%%%%%------C4 Increased by 50%-------%%%%%%%%%

% Increase by 50 (extra factor of 2 because of decrease earlier%
C4 = C4*2*2;

%DSGZ Model Calculation
 for i = 1:length(se)
    strain = se(i,1);
    y2(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Computing R^2 value of the fit
strain_data = zeros(length(Data_1(:,2)),1);

%Model evaluated at experimental data points only
f = zeros(length(Data_1(:,2)),1);
strain_data(:,1) = Data_1(:,1);

%Calculation
 for i = 1:length(f)
    strain = strain_data(i,1);
    f(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Experimental Data  
exp_data = Data_1(:,2);

%Function for R^2
[r2_y2 rmse] = rsquare(exp_data,f);

%Plotting
figure 
xlabel('True Strain')
ylabel('True Stress (MPa)')
title('Coefficient Sensitivity Study: C_{4}')
hold on
% plot(Data_1(:,1),Data_1(:,2),'b*')
hold on
plot(se,y,'b')
plot(se,y1,'r')
plot(se,y2,'g')
hold on
txt1 = ' T = 323 K';
text(0.7,20,txt1)
txt2 = ' Strain Rate = 0.001';
text(0.7,10,txt2)
s1 = 'R^2 = ';

s2 = num2str(r2_y);
s = strcat(s1,s2);
text(0.4,65, s ,'FontSize',10)

s2 = num2str(r2_y1);
s = strcat(s1,s2);
text(0.15,45, s ,'FontSize',10)

s2 = num2str(r2_y2);
s = strcat(s1,s2);
text(0.2,80, s ,'FontSize',10)
legend('Original Curve', 'C_{4} decreased by 50%', 'C_{4} increased by 50%')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Coefficient: K

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Coeffs were found from curve fit:
C1 = 1.379;
C2 = 1.722;
C3 = 0.003;  
C4 =10.25; 
K = 3.5; 
a = 1196; 
alpha = 12;
m = 0.06036;

%DSGZ Model Calculation
 for i = 1:length(se)
    strain = se(i,1);
    y(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Computing R^2 value of the fit
strain_data = zeros(length(Data_1(:,2)),1);

%Model evaluated at experimental data points only
f = zeros(length(Data_1(:,2)),1);
strain_data(:,1) = Data_1(:,1);

%Calculation
 for i = 1:length(f)
    strain = strain_data(i,1);
    f(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Experimental Data  
exp_data = Data_1(:,2);

%Function for R^2
[r2_y rmse] = rsquare(exp_data,f);

%%%%%%%%%------K Decreased by 50%-------%%%%%%%%%
K = K/2;

%DSGZ Model Calculation
 for i = 1:length(se)
    strain = se(i,1);
    y1(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Computing R^2 value of the fit
strain_data = zeros(length(Data_1(:,2)),1);

%Model evaluated at experimental data points only
f = zeros(length(Data_1(:,2)),1);
strain_data(:,1) = Data_1(:,1);

%Calculation
 for i = 1:length(f)
    strain = strain_data(i,1);
    f(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Experimental Data  
exp_data = Data_1(:,2);

%Function for R^2
[r2_y1 rmse] = rsquare(exp_data,f);

%%%%%%%%%------K Increased by 50%-------%%%%%%%%%
% Increase by 50 (extra factor of 2 because of decrease earlier%
K = K*2*2;

%DSGZ Model Calculation
 for i = 1:length(se)
    strain = se(i,1);
    y2(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Computing R^2 value of the fit
strain_data = zeros(length(Data_1(:,2)),1);

%Model evaluated at experimental data points only
f = zeros(length(Data_1(:,2)),1);
strain_data(:,1) = Data_1(:,1);

%Calculation
 for i = 1:length(f)
    strain = strain_data(i,1);
    f(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Experimental Data  
exp_data = Data_1(:,2);

%Function for R^2
[r2_y2 rmse] = rsquare(exp_data,f);

%Plotting
figure 
xlabel('True Strain')
ylabel('True Stress (MPa)')
title('Coefficient Sensitivity Study: K')
hold on
hold on
plot(se,y,'b')
plot(se,y1,'r')
plot(se,y2,'g')
hold on
txt1 = ' T = 323 K';
text(0.7,20,txt1)
txt2 = ' Strain Rate = 0.001';
text(0.7,10,txt2)
s1 = 'R^2 = ';

s2 = num2str(r2_y);
s = strcat(s1,s2);
text(0.4,60, s ,'FontSize',10)

s2 = num2str(r2_y1);
s = strcat(s1,s2);
text(0.15,25, s ,'FontSize',10)

s2 = num2str(r2_y2);
s = strcat(s1,s2);
text(0.2,150, s ,'FontSize',10)
legend('Original Curve', 'K decreased by 50%', 'K increased by 50%')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Coefficient: a

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Coeffs were found from curve fit:
C1 = 1.379;
C2 = 1.722;
C3 = 0.003;  
C4 =10.25; 
K = 3.5; 
a = 1196; 
alpha = 12;
m = 0.06036;

%DSGZ Model Calculation
 for i = 1:length(se)
    strain = se(i,1);
    y(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Computing R^2 value of the fit
strain_data = zeros(length(Data_1(:,2)),1);

%Model evaluated at experimental data points only
f = zeros(length(Data_1(:,2)),1);
strain_data(:,1) = Data_1(:,1);

%Calculation
 for i = 1:length(f)
    strain = strain_data(i,1);
    f(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Experimental Data  
exp_data = Data_1(:,2);

%Function for R^2
[r2_y rmse] = rsquare(exp_data,f);

%%%%%%%%%------a Dncreased by 50%-------%%%%%%%%%

% Decrease by 50%
a = a/2;

%DSGZ Model Calculation
 for i = 1:length(se)
    strain = se(i,1);
    y1(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Computing R^2 value of the fit
strain_data = zeros(length(Data_1(:,2)),1);

%Model evaluated at experimental data points only
f = zeros(length(Data_1(:,2)),1);
strain_data(:,1) = Data_1(:,1);

%Calculation
 for i = 1:length(f)
    strain = strain_data(i,1);
    f(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Experimental Data  
exp_data = Data_1(:,2);

%Function for R^2
[r2_y1 rmse] = rsquare(exp_data,f);

%%%%%%%%%------a Increased by 50%-------%%%%%%%%%
% Increase by 50 (extra factor of 2 because of decrease earlier%
a = a*2*2;

%DSGZ Model Calculation
 for i = 1:length(se)
    strain = se(i,1);
    y2(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Computing R^2 value of the fit
strain_data = zeros(length(Data_1(:,2)),1);

%Model evaluated at experimental data points only
f = zeros(length(Data_1(:,2)),1);
strain_data(:,1) = Data_1(:,1);

%Calculation
 for i = 1:length(f)
    strain = strain_data(i,1);
    f(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Experimental Data  
exp_data = Data_1(:,2);

%Function for R^2
[r2_y2 rmse] = rsquare(exp_data,f);

%Plotting
figure 
xlabel('True Strain')
ylabel('True Stress (MPa)')
title('Coefficient Sensitivity Study: a')
hold on
hold on
plot(se,y,'b')
plot(se,y1,'r')
plot(se,y2,'g')
hold on
txt1 = ' T = 323 K';
text(0.7,1000,txt1)
txt2 = ' Strain Rate = 0.001';
text(0.7,800,txt2)
s1 = 'R^2 = ';

s2 = num2str(r2_y);
s = strcat(s1,s2);
text(0.4,500, s ,'FontSize',10)

s2 = num2str(r2_y1);
s = strcat(s1,s2);
text(0.4,300, s ,'FontSize',10)

s2 = num2str(r2_y2);
s = strcat(s1,s2);
text(0.2,2400, s ,'FontSize',10)
legend('Original Curve', 'a decreased by 50%', 'a increased by 50%')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Coefficient: alpha

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Coeffs were found from curve fit:
C1 = 1.379;
C2 = 1.722;
C3 = 0.003;  
C4 =10.25; 
K = 3.5; 
a = 1196; 
alpha = 12;
m = 0.06036;

%DSGZ Model Calculation
 for i = 1:length(se)
    strain = se(i,1);
    y(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Computing R^2 value of the fit
strain_data = zeros(length(Data_1(:,2)),1);

%Model evaluated at experimental data points only
f = zeros(length(Data_1(:,2)),1);
strain_data(:,1) = Data_1(:,1);

%Calculation
 for i = 1:length(f)
    strain = strain_data(i,1);
    f(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Experimental Data  
exp_data = Data_1(:,2);

%Function for R^2
[r2_y rmse] = rsquare(exp_data,f);

%%%%%%%%%------alpha Decreased by 50%-------%%%%%%%%%
alpha = alpha/2;

%DSGZ Model Calculation
 for i = 1:length(se)
    strain = se(i,1);
    y1(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Computing R^2 value of the fit
strain_data = zeros(length(Data_1(:,2)),1);

%Model evaluated at experimental data points only
f = zeros(length(Data_1(:,2)),1);
strain_data(:,1) = Data_1(:,1);

%Calculation
 for i = 1:length(f)
    strain = strain_data(i,1);
    f(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Experimental Data  
exp_data = Data_1(:,2);

%Function for R^2
[r2_y1 rmse] = rsquare(exp_data,f);

%%%%%%%%%------alpha Increased by 50%-------%%%%%%%%%
% Increase by 50 (extra factor of 2 because of decrease earlier%
alpha = alpha*2*2;

%DSGZ Model Calculation
 for i = 1:length(se)
    strain = se(i,1);
    y2(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Computing R^2 value of the fit
strain_data = zeros(length(Data_1(:,2)),1);

%Model evaluated at experimental data points only
f = zeros(length(Data_1(:,2)),1);
strain_data(:,1) = Data_1(:,1);

%Calculation
 for i = 1:length(f)
    strain = strain_data(i,1);
    f(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Experimental Data  
exp_data = Data_1(:,2);

%Function for R^2
[r2_y2 rmse] = rsquare(exp_data,f);

%Plotting
figure 
xlabel('True Strain')
ylabel('True Stress (MPa)')
title('Coefficient Sensitivity Study: \alpha')
hold on
plot(se,y,'b')
plot(se,y1,'r')
plot(se,y2,'g')
hold on
txt1 = ' T = 323 K';
text(0.7,40,txt1)
txt2 = ' Strain Rate = 0.001';
text(0.7,30,txt2)
s1 = 'R^2 = ';

s2 = num2str(r2_y);
s = strcat(s1,s2);
text(0.5,85, s ,'FontSize',10)

s2 = num2str(r2_y1);
s = strcat(s1,s2);
text(0.2,45, s ,'FontSize',10)

s2 = num2str(r2_y2);
s = strcat(s1,s2);
text(0.2,80, s ,'FontSize',10)
legend('Original Curve', '\alpha decreased by 50%', '\alpha increased by 50%')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Coefficient: m

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Coeffs were found from curve fit:
C1 = 1.379;
C2 = 1.722;
C3 = 0.003;  
C4 =10.25; 
K = 3.5; 
a = 1196; 
alpha = 12;
m = 0.06036;

%DSGZ Model Calculation
 for i = 1:length(se)
    strain = se(i,1);
    y(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Computing R^2 value of the fit
strain_data = zeros(length(Data_1(:,2)),1);

%Model evaluated at experimental data points only
f = zeros(length(Data_1(:,2)),1);
strain_data(:,1) = Data_1(:,1);

%Calculation
 for i = 1:length(f)
    strain = strain_data(i,1);
    f(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Experimental Data  
exp_data = Data_1(:,2);

%Function for R^2
[r2_y rmse] = rsquare(exp_data,f);

%%%%%%%%%------m Decreased by 50%-------%%%%%%%%%
m = m/2;

%DSGZ Model Calculation
 for i = 1:length(se)
    strain = se(i,1);
    y1(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Computing R^2 value of the fit
strain_data = zeros(length(Data_1(:,2)),1);

%Model evaluated at experimental data points only
f = zeros(length(Data_1(:,2)),1);
strain_data(:,1) = Data_1(:,1);

%Calculation
 for i = 1:length(f)
    strain = strain_data(i,1);
    f(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Experimental Data  
exp_data = Data_1(:,2);

%Function for R^2
[r2_y1 rmse] = rsquare(exp_data,f);

%%%%%%%%%------m Increased by 50%-------%%%%%%%%%
% Increase by 50 (extra factor of 2 because of decrease earlier%
m = m*2*2;

%DSGZ Model Calculation
 for i = 1:length(se)
    strain = se(i,1);
    y2(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Computing R^2 value of the fit
strain_data = zeros(length(Data_1(:,2)),1);

%Model evaluated at experimental data points only
f = zeros(length(Data_1(:,2)),1);
strain_data(:,1) = Data_1(:,1);

%Calculation
 for i = 1:length(f)
    strain = strain_data(i,1);
    f(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Experimental Data  
exp_data = Data_1(:,2);

%Function for R^2
[r2_y2 rmse] = rsquare(exp_data,f);

%Plotting
figure 
xlabel('True Strain')
ylabel('True Stress (MPa)')
title('Coefficient Sensitivity Study: m')
hold on
plot(se,y,'b')
plot(se,y1,'r')
plot(se,y2,'g')
hold on
txt1 = ' T = 323 K';
text(0.7,40,txt1)
txt2 = ' Strain Rate = 0.001';
text(0.7,30,txt2)
s1 = 'R^2 = ';

s2 = num2str(r2_y);
s = strcat(s1,s2);
text(0.5,85, s ,'FontSize',10)

s2 = num2str(r2_y1);
s = strcat(s1,s2);
text(0.2,45, s ,'FontSize',10)

s2 = num2str(r2_y2);
s = strcat(s1,s2);
text(0.2,80, s ,'FontSize',10)
legend('Original Curve', 'm decreased by 50%', 'm increased by 50%')


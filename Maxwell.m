%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%Comparison of The DSGZ Model with the Discrete Element Maxwell Model
%
%Author: Gurpal Singh
%
%Date: 4/29/2017
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Data_1= [        0        0
                 0.0650   75.8767
                 0.1936   65.8009
                 0.2928   65.1989
                 0.3907   66.8687
                 0.4874   71.3780
                 0.5914   77.7775
                 0.6912   85.1249
                 0.7911   93.6079
                 0.8912  104.5513
                 0.9928  115.6836];
             
time_data = Data_1(:,1)/0.001;
time = [0:10:1000]';

%strain rate is constant
strainrate = 0.001;
%Temperature: 323K
T = 323;
C1 = 1.379;
C2 = 1.722;
C3 = 0.003;  
C4 =10.25; 
K = 3.5;
a = 1196;
alpha = 12;
m = 0.06036;

s = [0:0.001:1];
t = [0:1:1000];

tspan = 0:1:1000;
%Initial Condition and Coefficients
disp('The material coefficients for the Maxwell Model are:')
k = 5000
c = 78000
y0 = 0;

%Constant Strain rate = 0.0111
[t1, y1] = ode45(@(t,y) fun1(k,c,strainrate,y), tspan, y0);

%Calculating R^2
[time_data,y2] = ode45(@(t,y) fun1(k,c,strainrate,y), time_data, y0);

%Experimental Data  
exp_data = Data_1(:,2);

%Function for R^2
[r2_Maxwell rmse] = rsquare(exp_data,y2);


%%%%%%%%%%%%%%%DSGZ Model%%%%%%%%%%%%%%%%%%%
%  strain = zeros(10,1);
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
[r2_DSGZ rmse] = rsquare(exp_data,f);

figure
title('Stress vs. Time')
xlabel('Time (s)')
ylabel('True Stress (MPa)')
hold on
plot(t,y1,'r')
hold on
plot(time_data, Data_1(:,2),'b*')

% plot(Data_1(:,1),Data_1(:,2),'b*')
hold on
plot(time,y,'g')
legend('Maxwell Model', 'Exp Data','DSGZ Model')
hold on
s1 = 'Maxwell: R^2 = ';
s2 = num2str(r2_Maxwell);
st = strcat(s1,s2);
text(600,30, st ,'FontSize',10)
hold on
s1 = 'DSGZ: R^2 = ';
s2 = num2str(r2_DSGZ);
st = strcat(s1,s2);
text(600,20, st ,'FontSize',10)

figure
title('Strain vs. Time')
xlabel('Time (s)')
ylabel('True Strain')
hold on
plot(t,s,'b')

 

 
 


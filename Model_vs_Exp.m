%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%Comparison of The DSGZ Model and Experimental Results
%
%Author: Gurpal Singh
%
%Date: 4/29/2017
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Experimental Data for Duan Figure 1
%Temperature: 323 K
%Strain Rate: 0.001/s
Data_1= [              
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

 %True Strain Rate: 0.001/s
 strainrate = 0.001;
 
 %Temperature: 323K
 T = 323;
 
%Material Coefficients
disp('The Material Coefficients are: ')
C1 = 1.379
C2 = 1.722 
C3 = 0.003  
C4 =10.25 
K = 3.5 
a = 1196 
alpha = 12
m = 0.06036


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
[r2 rmse] = rsquare(exp_data,f);

%Plotting the figure
figure 
xlabel('True Strain')
ylabel('True Stress (MPa)')
title('DSGZ Model: T = 323 K & Strain Rate = 0.001/s')
hold on
plot(Data_1(:,1),Data_1(:,2),'b*')
hold on 
plot(se,y,'r')
hold on
s1 = 'R^2 = ';
s2 = num2str(r2);
s = strcat(s1,s2);
text(0.7,36, s ,'FontSize',10)
legend('Experimental Data', 'DSGZ Approximation')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Experimental Data for Duan Figure 1
%Temperature: 296 K
%Strain Rate: 0.001/s
Data_2 = [0.0950  109.7465
          0.1920   99.8708
          0.2909   94.9157
          0.3902   96.2064
          0.4927  101.2816
          0.5897  110.3333
          0.6897  119.1948
          0.7884  131.4637
          0.8902  145.6243
          0.9950  161.6765];

%Temperature & Strainrate      
T = 296;
strainrate = 0.001;

%DSGZ Model Calculation
 for i = 1:length(se)
    strain = se(i,1);
    y(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Computing R^2 value of the fit
strain_data = zeros(length(Data_2(:,2)),1);

%Model evaluated at experimental data points only
f = zeros(length(Data_2(:,2)),1);
strain_data(:,1) = Data_2(:,1);

%Calculation
 for i = 1:length(f)
    strain = strain_data(i,1);
    f(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Experimental Data  
exp_data = Data_2(:,2);

%Function for R^2
[r2 rmse] = rsquare(exp_data,f);

%Plotting
figure 
xlabel('True Strain')
ylabel('True Stress (MPa)')
title('DSGZ Model: T = 296 K & Strain Rate = 0.001/s')
hold on
plot(Data_2(:,1),Data_2(:,2),'b*')
hold on 
plot(se,y,'r')
hold on
s1 = 'R^2 = ';
s2 = num2str(r2);
s = strcat(s1,s2);
text(0.7,40, s ,'FontSize',10)
legend('Experimental Data', 'DSGZ Approximation')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Experimental Data for Duan Figure 2
%Temperature: 296 K
%Strain Rate: 0.0001/s 
Data_5 = [       
          0.1018   95.3330
          0.2044   86.1193
          0.3024   82.1904
          0.3489   81.9892];
      
%Temperature & Strainrate      
T = 296;
strainrate = 0.0001;

%DSGZ Model Calculation
se = 0:.01:.5;
se = se';
y = zeros(length(se),1);
for i = 1:length(se)
    strain = se(i,1);
    y(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
end

%Computing R^2 value of the fit
strain_data = zeros(length(Data_5(:,2)),1);

%Model evaluated at experimental data points only
f = zeros(length(Data_5(:,2)),1);
strain_data(:,1) = Data_5(:,1);

%Calculation at Experimental Points
 for i = 1:length(f)
    strain = strain_data(i,1);
    f(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

%Experimental Data  
exp_data = Data_5(:,2);

%Function for R^2
[r2 rmse] = rsquare(exp_data,f);

%Plotting
figure 
xlabel('True Strain')
ylabel('True Stress (MPa)')
title('DSGZ Model: T = 296 K & Strain Rate = 0.0001/s' )
hold on
plot(Data_5(:,1),Data_5(:,2),'b*')
hold on 
plot(se,y,'r')
hold on
s1 = 'R^2 = ';
s2 = num2str(r2);
s = strcat(s1,s2);
text(0.3,30, s ,'FontSize',10)
legend('Experimental Data', 'DSGZ Approximation')
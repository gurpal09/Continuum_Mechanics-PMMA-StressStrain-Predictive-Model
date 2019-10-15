%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%Comparison of The DSGZ Model with other Models
%
%Author: Gurpal Singh
%
%Date: 4/29/2017
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%-----Linear Elastic Isotropic Model-----%%%%%%%%%%%%%%

%Experimental Data for Duan Figure 1
%Temperature: 323 K
%Strain Rate: 0.001/s
T = 323;
strainrate = 0.001;

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
   
%For Curve Fitter            
x_data = Data_1(:,1);
y_data = Data_1(:,2);


strain = Data_1(:,1);
stress_LEI = zeros(length(strain),1);

%Coefficient found using Curve Fitter
disp('The Material Coefficient for the Linear Elastic Isotropic Model is: ')
C = 129.2

%Calculation
for i = 1:length(strain)
   stress_LEI(i,1) = C*strain(i,1);
end

%Experimental Data  
exp_data = Data_1(:,2);

%Function for R^2
[r2_LEI rmse] = rsquare(exp_data,stress_LEI);

%%%%%%%%%%%%%-----Hyper Elastic Mooney-Rivlin Model-----%%%%%%%%%%%%%%
%Coefficients were chosen to provide best fit
% for transverse data from curve fitting app on matlab
disp('The Material Coefficients for the Mooney-Rivlin Model are:')
C1 = -31.14
C2 = 90.09


stress_MR = zeros(length(Data_1),1);


%Calculation
for i = 1:length(Data_1)
    lambda = sqrt(2*Data_1(i,1) + 1);
    stress_MR(i,1) = 2*C1*(lambda^2 - (1/lambda)) + 2*C2*(lambda - (1/lambda^2));
end

%R^2
[r2_MR rmse] = rsquare(exp_data,stress_MR)

%%%%%%%%%%%%%-----DSGZ Polymer Model-----%%%%%%%%%%%%%%

%Material Coefficients
disp('The Material Coefficients for the DSGZ Model are: ')
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


strain_data = zeros(length(Data_1(:,2)),1);
%Model evaluated at experimental data points only to compute R^2
stress_DSGZ = zeros(length(Data_1(:,2)),1);
strain_data(:,1) = Data_1(:,1);

%Calculation
 for i = 1:length(stress_DSGZ)
    strain = strain_data(i,1);
    stress_DSGZ(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end
 
 %Function for R^2
[r2_DSGZ rmse] = rsquare(exp_data,stress_DSGZ);

%Plotting 
figure
title('Model Comparison')
xlabel('True Strain')
ylabel('True Stress (MPa)')
hold on
plot(strain_data, stress_LEI, 'r')
hold on
plot(strain_data, stress_MR, 'b')
hold on
plot(se, y, 'black--')
hold on
plot(strain_data,Data_1(:,2),'m*')
hold on
legend('Linear Elastic Isotropic', 'Mooney-Rivlin', 'DSGZ', 'Exp. Data')
s1 = 'Linear Elastic: R^2 = ';
s2 = num2str(r2_LEI);
s = strcat(s1,s2);
text(0.6,40, s ,'FontSize',10)
hold on
s1 = 'Mooney Rivlin: R^2 = ';
s2 = num2str(r2_MR);
s = strcat(s1,s2);
text(0.6,30, s ,'FontSize',10)
hold on
s1 = 'DSGZ: R^2 = ';
s2 = num2str(r2_DSGZ);
s = strcat(s1,s2);
text(0.6,20, s ,'FontSize',10)
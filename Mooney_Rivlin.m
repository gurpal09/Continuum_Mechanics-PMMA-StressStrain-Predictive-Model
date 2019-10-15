%Mooney Rivlen
%Experimental Data for Duan Figure 1
%Temperature: 323 K
%Strain Rate: 0.001/s
Data_1= [0        0
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

%Mooney-Rivlen hyperelastic model
x_data = Data_1(:,1);
y_data = Data_1(:,2);

%Coefficients were chosen to provide best fit
% for transverse data from curve fitting app on matlab
disp('The Material Coefficients are:')
C1 = -31.14
C2 = 90.09

F = zeros(3);
P = 0;
Stress = zeros(length(Data_1),1);

for i = 1:length(Data_1)
lambda = sqrt(2*Data_1(i,1) + 1);

% F(1,1) = lambda;
% F(2,2) = 1/sqrt(lambda);
% F(3,3) = 1/sqrt(lambda);
% 
% C = F'*F;
% 
% B = F*F';
% 
% I_1 = trace(C);
% 
% I_2 = 2*lambda + 1/(lambda^2);
% 
% I_3 = det(C);

%p = (-2*C1/lambda) - 2*lambda*C2 - (2*C2)/(lambda^2);

Stress(i,1) = 2*C1*(lambda^2 - (1/lambda)) + 2*C2*(lambda - (1/lambda^2));
end

figure
title('Mooney-Rivlin Hyperelastic Model (Uniaxial Tension)')
xlabel('True Strain')
ylabel('True Stress (MPa)')
hold on
plot(Data_1(:,1), Data_1(:,2),'b-*')
hold on
plot(Data_1(:,1),Stress(:,1),'r')
hold on
txt1 = ' T = 323 K';
text(0.7,50,txt1)
txt2 = ' Strain Rate = 0.001/s';
text(0.7,43,txt2)
legend('Data','Approx')

%Experimental Data  
exp_data = Data_1(:,2);

%Function for R^2
[r2 rmse] = rsquare(exp_data,Stress)

s1 = 'R^2 = ';
s2 = num2str(r2);
s = strcat(s1,s2)
text(0.7,36, s ,'FontSize',10)
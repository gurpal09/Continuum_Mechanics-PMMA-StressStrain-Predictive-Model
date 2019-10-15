%Linear Elastic Isotropic Solid

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
             
x_data = Data_1(:,1);
y_data = Data_1(:,2);

strain = Data_1(:,1);
stress = zeros(length(strain),1);

%Coefficient found using Curve Fitter
C = 129.2;


for i = 1:length(strain)
   stress(i,1) = C*strain(i,1);
end


figure
title('Linear Elastic Isotropic Model (Uniaxial Tension)')
xlabel('True Strain')
ylabel('True Stress (MPa)')
hold on
plot(strain,stress,'r')
hold on
plot(Data_1(:,1),Data_1(:,2),'b-*')  
hold on
txt1 = ' T = 323 K';
text(0.7,50,txt1)
txt2 = ' Strain Rate = 0.001/s';
text(0.7,43,txt2)
legend('Data','Approx')

%Experimental Data  
exp_data = Data_1(:,2);

%Function for R^2
[r2 rmse] = rsquare(exp_data,stress)

s1 = 'R^2 = ';
s2 = num2str(r2);
s = strcat(s1,s2)
text(0.7,36, s ,'FontSize',10)

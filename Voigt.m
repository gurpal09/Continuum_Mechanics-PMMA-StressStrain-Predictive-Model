%Voigt Model
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
%Voigt Model
Strain_data = Data_1(:,1);
Strain_rate = zeros(length(Data_1),1);
Stress_Voigt = zeros(length(Data_1),1);
time_data = Data_1(:,1)/0.001;
%Coefficients
disp('The material coefficients for the Voigt Model are:')
k = 2500
c = 15000

%Calculating Strain Rate
for i = 2:7
    Strain_rate(i,1) = (Strain_data(i,1)-Strain_data(i-1,1))/(Strain_data(i,1) - Strain_data(i-1,1));
end



%Calculating stress from Voigt Model
for i=1:length(Data_1)
   Stress_Voigt(i,1) = k*Strain_data(i,1) + c*Strain_rate(i,1);
end
 Stress_Voigt(1,1) = 0;
%Plotting
figure
title('Stress vs. Time')
xlabel('Time (s)')
ylabel('T_{11}Stress (kPa)')
hold on
plot(time_data(:,1), Data_1(:,2),'b')
hold on
plot(time_data(:,1), Stress_Voigt(:,1),'r')
hold on
legend('Experimental','Voigt Model')

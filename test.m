 

Data_1 = [0 0
   0.0435   57.9050
    0.0409   60.0367
    0.0382   60.6537
    0.0351   61.5753
    0.0324   61.8894
    0.0299   61.5962
    0.0273   60.2936
    0.0248   58.5867
    0.0224   56.4752
    0.0171   49.5270
    0.0139   43.1762
    0.0121   39.0421];


%True Strain Rate: 0.001/s
 strainrate = .11;
 
 %Temperature: 323K
 T = 383.15;
 
 %Material Coefficients
 K = 3.9;
 C1 = 1.91;
 C2 = 1.49
 C3 = 0.0029;
 C4 = 11;
 a = 1191;
 m = 0.064;
 alpha = 11.7;
%  K = 4;
%  C1 = 2.5;
%  C2 = 1.7
%  C3 = 0.003;
%  C4 = 9;
%  a = 1200;
%  m = 0.05;
%  alpha = 12;

% C1 = 1.69
% C2 = 1.49 
% C3 = 0.003  
% C4 =10.35  
% K = 3.5 
% a = 1200  
% alpha = 11.3  
% m = 0.06  
%  strain = zeros(10,1);
 
 se = 0:.01:0.05;
 se = se';
 y = zeros(length(se),1);
 for i = 1:length(se)
    strain = se(i,1);
    y(i,1) = fun(K, C1, C2, C3, C4, a, m, alpha,strain,strainrate,T);
 end

figure 
xlabel('True Strain')
ylabel('True Stress (MPa)')
title('DSGZ Model')
hold on
plot(Data_1(:,1),Data_1(:,2),'b*')
hold on 
plot(se,y,'r')
hold on
legend('Experimental Data', 'DSGZ Approximation')
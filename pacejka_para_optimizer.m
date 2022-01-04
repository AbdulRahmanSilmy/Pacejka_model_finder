%This script will find the optimal parameters for the pacejka formula 
%This is done so utilizing the concept of gradient descent with SE setup 
%as the cost function.

%intilialization
clear;close;
load('SR_vs_xForce.mat')
data_SR=SR_vs_xForce(:,1); %contains slip ratio data 
data_force=SR_vs_xForce(:,2); %contains force data
para={}; %creating cell to hold parameter values for the pacejka formula
%para{1}=[2.2,10,1.9,1,0.97];
para{1}=[3,12,3,2,2]; %initializing a some random parameter values  
SE(1)=SE_calculator(para{1},data_SR,data_force); %Standard error of initial parameter value 
i=1; %step number
dp_cell={}; %cell containing the approximate gradient of paramerers
lr=0.01; %learning rate 
max_steps=25000;  %max step number 
min_SE=0.3;

%displaying intial parameter values 
fprintf('\nintial parameter values: %4.2f, %4.2f, %4.2f, %4.2f, %4.2f \n',para{1})
fprintf('Training...')


%The while loop below applies gradient descent 
while(SE(i)>=min_SE)
    i=i+1;
    dp_cell{i-1}=dpara(para{i-1},data_SR,data_force,lr); 
    para{i}=para{i-1}-dp_cell{i-1};
    SE(i)=SE_calculator(para{i},data_SR,data_force);
    if i== max_steps;
        break
    end
end

%displaying the final parameter values
fprintf(' Done\n')
fprintf('final parameter values: %4.2f, %4.2f, %4.2f, %4.2f, %4.2f \n\n',para{end})

%plotting the training
steps=1:i;
plot(steps,SE);
xlabel('steps')
ylabel('Standard Error')



%This function below calculates the Standard error
function SE=SE_calculator(Para,data_SR,data_force)
%Anonymous function below is the pacejka formula that caculates horizontal
%force as per slip_ratio
x_Force=@(slip_ratio)Para(1)*Para(4).*sin(Para(3)*atan(Para(2)*slip_ratio-Para(5)*(Para(2)*slip_ratio-atan(Para(2)*slip_ratio))));
sum=0;
for i=1:length(data_SR)
    sum=sum+(x_Force(data_SR(i))-data_force(i))^2;
end
SE=sqrt(sum/(length(data_SR)-2));
end


%This function calculates the gradient of the para meters
%It based on a numerical approximation of a gradient called the symmetric
%difference quotient 
function dp=dpara(para,data_SR,data_force,lr)
Upara=cell(1,length(para));
Lpara=cell(1,length(para));
dp=zeros(1,length(para));

for i=1:length(para)
    Upara{i}=para;
    Upara{i}(i)=para(i)+lr;
    Lpara{i}=para;
    Lpara{i}(i)=para(i)-lr;
    dp(i)=(SE_calculator(Upara{i},data_SR,data_force)-SE_calculator(Lpara{i},data_SR,data_force))/2*lr;
end
end





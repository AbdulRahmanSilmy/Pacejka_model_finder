function SE=SE_calculator(Para,data_SR,data_force)
x_Force=@(slip_ratio)Para(1)*Para(4).*sin(Para(3)*atan(Para(2)*slip_ratio-Para(5)*(Para(2)*slip_ratio-atan(Para(2)*slip_ratio))));
sum=0;
for i=1:length(data_SR)
    sum=sum+(x_Force(data_SR(i))-data_force(i))^2;
end
SE=sqrt(sum/(length(data_SR)-2));
end

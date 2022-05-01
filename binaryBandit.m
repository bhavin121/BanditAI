%Epsilon greedy algorithm
%monte carlo simulation 

N=zeros(1,2);
Q=zeros(1,2);
eps=0.1;

for i=1:5000
    if(rand > eps)
        [m,id]=max(Q);
        A=id;
    else
        temp=randperm(2);
        A=temp(1);
    end
    R = binaryBanditB(A);  %reward
    N(A)=N(A)+1;
    Q(A)= Q(A)+(R - Q(A))/N(A);
    if i==1
        avg(i)= R;
    else
        avg(i)=((i-1)*avg(i-1)+R)/i;
    end
end

figure
plot(1:5000,avg,"blue")
title('Binary Bandit B')
ylabel('Expected Reward')
xlabel('Iterations')
ylim([0 1])

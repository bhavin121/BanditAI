R = zeros(1, 10000);
N = zeros(1, 10);
Q = zeros(1, 10);
eps = 0.15;
m = ones(1, 10);
alpha = 0.7;

for i=1:10000
    if rand > eps
        [a, id] = max(Q);
        A = id;
    else 
        temp = randperm(10);
        A = temp(1);
    end
    [RR, m] = nonStatReward(A, m)
    N(A) = N(A)+1;
    Q(A) = Q(A) + (RR-Q(A))*alpha;
    if i==1
        R(i) = RR;
    else
        R(i) = ((i-1)*R(i-1) + RR)/i;
    end
    
end

i = 1:10000;
figure
plot(i, R, 'b')
title('10 Armed Badit (Non stationary reward)')
ylabel('Expected Reward')
xlabel('Iterations')

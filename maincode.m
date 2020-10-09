format compact;
[x,y]=ReadData(Tot);

%% standardize data
for i=1:13
    mesi=mean(x(i,:));
    diasp=var(x(i,:));
   for j=1:178
       x_new(i,j)=(x(i,j)-mesi)/sqrt(diasp);
   end
end
 
[Recs1,Sums1] = MlpEbp1LBias(x_new,y,5,0.1,1000,50);
error1 = 100 - max(Recs1);


%% plot accuracy against Lr

for i=0:90
    Lr(i+1)=1-0.01*i;
    [Recs,Sums]=MlpEbp1LBias(x_new,y,5,Lr(i+1),10000,50);
    accuracy(i+1)=max(Recs);
end
plot(Lr,accuracy)
xlabel('Lr');
ylabel('accuracy');


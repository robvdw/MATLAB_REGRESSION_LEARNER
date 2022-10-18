%EricsScript.m   WCR 20210628
%See posting by Eric Dilger on Matlab Answrs, 6/28/2021
clear;
%Make two time series
X1=ones(1,500); X2=X1;
for i=2:500
    X1(i)=0.9*X1(i-1)+0.1*(0.5+rand());
    X2(i)=0.7*X1(i-1)+0.3*(0.5+rand());
end
%Compute the fluctuations, in %
Y1=100*abs((X1-mean(X1))/mean(X1)); 
Y2=100*abs((X2-mean(X2))/mean(X2));
%Plot histograms on same plot
figure;
h1=histogram(Y1);
hold on; 
h2=histogram(Y2);
%Normalize each histogram to units of probability
h1.Normalization = 'probability';
h2.Normalization = 'probability';
%Specify  bin width=2(%)
h1.BinWidth=2; 
h2.BinWidth=2;
%Add labels
xlabel('Fluctuation from Mean (%)'); ylabel('Probability');
legend('Y1','Y2');

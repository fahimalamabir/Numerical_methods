[v1,err1]=main(5);
[v2,err2]=main(10);
[v3,err3]=main(20);
[v4,err4]=main(40);
L = pi;
N=40;
x=0:pi/N:pi;
exact=sin(x);
plot(x,exact,'k-')
hold on
plot(x(1:8:end),v1,'.-','color',[0.4940 0.1840 0.5560])
plot(x(1:4:end),v2,'+-','color',[0.8500 0.3250 0.0980])
plot(x(1:2:end),v3,'--o','color',[0.9290 0.6940 0.1250])
plot(x,v4,'m*:')
hold off
xlabel('x')
ylabel('v(x)')
axis tight
legend('exact','N=5','N=10','N=20','N=40','Location','northeastoutside')

%saveas(gcf,'1D_consf','epsc')
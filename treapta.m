close all;
clc;

t=scope13(:,1);
u=scope13(:,2);
trp=u;
y=scope13(:,3);

t=t-t(1);
figure;
plot(t,[u,y]);
xlabel('Timp[s]');
ylabel('Tensiune[V]');
title('Raspunsul la treapta');

i1=455; i2=502; i3=889; i4=916;
yst=mean(y(i3:i4));
ust=mean(u(i3:i4));
y0=mean(y(i1:i2));
u0=mean(u(i1:i2));
k=(yst-y0)/(ust-u0)

% hold on; plot(t,yst*ones(1,length(t)));
i5=567;
ymax=y(i5)
sigma=(ymax-yst)/(yst-y0)
zeta=-log(sigma)/sqrt(pi^2+log(sigma)^2)

i6=872;
tr=t(i6)-t(i2);
wn=4/tr/zeta


At=[0 1; -wn^2 -2*zeta*wn]; Bt=[0; k*wn^2]; Ct=[1 0]; Dt=0;
ysim=lsim(At,Bt,Ct,Dt,u,t,[y(1),0]);
trp_init=y(1);
 hold on; plot(t,ysim,'g'); %title('3,6%');


figure
plot(t,ysim);

Y=norm(y-ysim)
epsMPN=norm(y-ysim)/norm(y-mean(y))
function [Fe1,Fe2]=Fe(JXYe,JBPe) % F矩阵

% 初始化Fe1和Fe2

Fe1=zeros(9,1);
Fe2=zeros(9,1);

% 高斯积分数据

gp=[0.932469514203152,0.661209386466265,0.238619186083197,-0.932469514203152,-0.661209386466265,-0.238619186083197];
gw=[0.171324492379170,0.360761573048139,0.467913934572691,0.171324492379170,0.360761573048139,0.467913934572691];
kesi=gp;
ita=gp;

% 第二类边界条件数据

P_side=JBPe(1,2);
l=JBPe(1,3);
m=JBPe(1,4);
P_value1=JBPe(1,5);
P_value2=JBPe(1,6);

%当压力施加于单元第1边时，Fe1和Fe2的计算

if P_side==1
    for i=1:6
        fy=[1/4*kesi(i)*(-1)*(kesi(i)-1)*((-1)-1);
            1/2*(-1)*(1-kesi(i)^2) *((-1)-1);
            1/4*kesi(i)*(-1)*(kesi(i)+1)*((-1)-1);
            1/2*kesi(i)*( kesi(i)-1)*(1-(-1)^2);
            (1-kesi(i)^2)*(1-(-1)^2);
            1/2*kesi(i)*( kesi(i)+1)*(1-(-1)^2);
            1/4*kesi(i)*(-1)*(kesi(i)-1)*((-1)+1);
            1/2*(-1)*(1-kesi(i)^2) *((-1)+1);
            1/4*kesi(i)*(-1)*(kesi(i)+1)*((-1)+1);];
        Fyp= [1/4*(1-kesi(i))*(1-(-1))
            1/4*(1+kesi(i))*(1-(-1))
            1/4*(1+kesi(i))*(1+(-1))
            1/4*(1-kesi(i))*(1+(-1))];  
        P=[P_value1,P_value2,0,0]';
        le=sqrt((JXYe(1,1)-JXYe(3,1))^2+(JXYe(1,2)-JXYe(3,2))^2);
        Fe1=Fe1+gw(i)*Fyp'*P*l*fy*le/2;
        Fe2=Fe2+gw(i)*Fyp'*P*m*fy*le/2;
    end
end

% 当压力施加于单元第2边时，Fe1和Fe2的计算

if P_side==2
    for j=1:6
        fy=[1/4*1*ita(j)*(1-1)*(ita(j)-1);
            1/2*ita(j)*(1-1^2) *(ita(j)-1);
            1/4*1*ita(j)*(1+1)*(ita(j)-1);
            1/2*1*( 1-1)*(1-ita(j)^2);
            (1-1^2)*(1-ita(j)^2);
            1/2*1*( 1+1)*(1-ita(j)^2);
            1/4*1*ita(j)*(1-1)*(ita(j)+1);
            1/2*ita(j)*(1-1^2) *(ita(j)+1);
            1/4*1*ita(j)*(1+1)*(ita(j)+1);];
        Fyp= [1/4*(1-1)*(1-ita(j))
            1/4*(1+1)*(1-ita(j))
            1/4*(1+1)*(1+ita(j))
            1/4*(1-1)*(1+ita(j))];      
        P=[0,P_value1,P_value2,0]';
        le=sqrt((JXYe(3,1)-JXYe(9,1))^2+(JXYe(3,2)-JXYe(9,2))^2);
        Fe1=Fe1+gw(j)*Fyp'*P*l*fy*le/2;
        Fe2=Fe2+gw(j)*Fyp'*P*m*fy*le/2;
    end
end

%当压力施加于单元第3边时，Fe1和Fe2的计算

if P_side==3
    for i=1:6
        fy=[1/4*kesi(i)*1*(kesi(i)-1)*(1-1);
            1/2*1*(1-kesi(i)^2) *(1-1);
            1/4*kesi(i)*1*(kesi(i)+1)*(1-1);
            1/2*kesi(i)*( kesi(i)-1)*(1-1^2);
            (1-kesi(i)^2)*(1-1^2);
            1/2*kesi(i)*( kesi(i)+1)*(1-1^2);
            1/4*kesi(i)*1*(kesi(i)-1)*(1+1);
            1/2*1*(1-kesi(i)^2) *(1+1);
            1/4*kesi(i)*1*(kesi(i)+1)*(1+1);];
       Fyp= [1/4*(1-kesi(i))*(1-1)
            1/4*(1+kesi(i))*(1-1)
            1/4*(1+kesi(i))*(1+1)
            1/4*(1-kesi(i))*(1+1)];      
        P=[0,0,P_value1,P_value2]';
        le=sqrt((JXYe(7,1)-JXYe(9,1))^2+(JXYe(7,2)-JXYe(9,2))^2);
        Fe1=Fe1+gw(i)*Fyp'*P*l*fy*le/2;
        Fe2=Fe2+gw(i)*Fyp'*P*m*fy*le/2;
    end
end

% 当压力施加于单元第4边时，Fe1和Fe2的计算

if P_side==4
    for j=1:6
        fy=[1/4*(-1)*ita(j)*((-1)-1)*(ita(j)-1);
            1/2*ita(j)*(1-(-1)^2) *(ita(j)-1);
            1/4*(-1)*ita(j)*((-1)+1)*(ita(j)-1);
            1/2*(-1)*( (-1)-1)*(1-ita(j)^2);
            (1-(-1)^2)*(1-ita(j)^2);
            1/2*(-1)*( (-1)+1)*(1-ita(j)^2);
            1/4*(-1)*ita(j)*((-1)-1)*(ita(j)+1);
            1/2*ita(j)*(1-(-1)^2) *(ita(j)+1);
            1/4*(-1)*ita(j)*((-1)+1)*(ita(j)+1);];
       Fyp= [1/4*(1-(-1))*(1-ita(j))
            1/4*(1+(-1))*(1-ita(j))
            1/4*(1+(-1))*(1+ita(j))
            1/4*(1-(-1))*(1+ita(j))];      
        P=[P_value2,0,0,P_value1]';
        le=sqrt((JXYe(7,1)-JXYe(1,1))^2+(JXYe(7,2)-JXYe(1,2))^2);
        Fe1=Fe1+gw(j)*Fyp'*P*l*fy*le/2;
        Fe2=Fe2+gw(j)*Fyp'*P*m*fy*le/2;
    end
end
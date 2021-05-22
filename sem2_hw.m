clear
close all

global q a b h m B Uo Em n 
q = 1e-9;
a = 0.5*q;
b = 2*q;
h = 1.054571817e-34;
m = 9.1093837e-31;
B = 1.602176634e-19
Uo = -5*B;
Em = 26*B;
n = 3;

%U - прямоугольные импульсы
figure
grid on
p = 5 
%рисуется 5*2=10 прямоугольных импульсов
t = -(a+b)*p:(a+b)/50:(a+b)*p;
U = Uo*(mod(t,a+b)>=b);
plot(t,U, "k-")

figure
%hold on
E = Uo:(Em-Uo)/1000:Em;
plot(E, - F(E), "r-")
grid on
%на графике интересны именно нули функции

figure
hold on
m = 9.1*10.^(-28); 
a = 0.5; 
b = 2; 
Uo = -4; 
Em = 26;
h = 1.054571817*10.^(-27)/((1.602176634*10.^(-12)*1*10.^(-14)).^0.5);
plot([-pi/2.5:0.015:pi/2.5], KronigPenney([-pi/2.5:0.015:pi/2.5], m, a, b, Uo, Em, h), 'y-');
grid on

%right part of equation
function fr = F(E)
global h m a b Uo;
    mu = sqrt(2*m*(E))/h;
    lm = sqrt(2*m*(E-Uo))/h;
    fr = cos(a*mu).*cos(b*lm)-((lm./mu + mu./lm)/2).*sin(a*mu).*sin(b*lm);
end
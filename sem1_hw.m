clear
close all
t = -10:0.005:10
figure
hold on
x = fresnelc(t)
y = fresnels(t)
plot(x, y)
grid on
%https://ru.wikipedia.org/wiki/%D0%A1%D0%BF%D0%B8%D1%80%D0%B0%D0%BB%D1%8C
%https://ru.wikipedia.org/wiki/%D0%9A%D0%BB%D0%BE%D1%82%D0%BE%D0%B8%D0%B4%D0%B0
%https://ru.wikipedia.org/wiki/%D0%98%D0%BD%D1%82%D0%B5%D0%B3%D1%80%D0%B0%D0%BB%D1%8B_%D0%A4%D1%80%D0%B5%D0%BD%D0%B5%D0%BB%D1%8F
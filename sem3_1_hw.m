clear
close all

r = [ 5 2]; 
f = [1; 2];  
XYZ = [0 20; 
       0  1; 
       0  0];
Nxy = [100 200];
a = [0; 1; 0];
b = [1; 1; 0];
Dx = [-10 10];
Dy = [-10 10];
r0 = [1;1;1];

Q = ElectrostaticBalls(XYZ, r, f);
disp('Q = ');
disp( Q);
[f,X,Y,P] = SpherePotential(XYZ,Q,r,r0,a,b,Dx,Dy,Nxy)

figure; hold on; grid on; mesh(X,Y,f); 

function [Q] = ElectrostaticBalls(XYZ, r, f)
N = length(r);
rel_dist = zeros(N,N);

for i = 1 : N 
    for j = 1 : N 
        rel_dist(i,j) = sqrt(  (XYZ(1,i) - XYZ(1,j))^2+((XYZ(2,i) - XYZ(2,j))^2+(XYZ(3,i) - XYZ(3,j))^2  ));
    end
end

    function [L] = check_coll(XYZ, r)
        N = length(r);
        L = 1;
        for i = 1:(N - 1)
            for j = (i + 1):N
                if norm(XYZ(:,i)-XYZ(:,j)) <= r(i) + r(j)
                    error('Try again to enter radius');
                    L = 0;
                end
            end
        end
    end

if check_coll(XYZ, r) == 1
    disp('rel_dist: ');
    disp(rel_dist);
    M = rel_dist .^ (-1);
    for i = 1:N
        M(i,i) = 1/r(i);
    end
    disp('M: ');

    disp(M);
    Q = f\M;

end
end
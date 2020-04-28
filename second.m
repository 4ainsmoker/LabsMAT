clc, clear;
steps = 0;
vNew = [1 0 0];
p = [4/8 3/8 1/8;
    2/8 3/8 3/8;
    2/8 2/8 4/8];

%1 способ
pT = p.';

A = pT-eye(3);
A(3,:) = [1 1 1];
B = [0;0;1];
Ainv = inv(A);
res = Ainv*B;
res = res.';

%2 способ
var = zeros(1,steps);
while 1
    vOld = vNew;
    vNew = vOld*p;
    var = std(vNew -vOld);
    steps = steps +1;
    if var < 0.00001
        lalala = 2;
        break;
    end
end

mas = zeros(1,100);
tests = 10000;
counter = [0 0 0];
for i = 1:tests
    pos = 1;
    for s = 1:steps
        ran = rand();
        if ran < p(pos,1)
            pos =1;
        elseif ran < p(pos,1)+p(pos,2)
            pos = 2;
        else
            pos =3;
        end
    end
    %здесь полученное значение прибавляем в одну из ячеек
    counter(pos) = counter(pos) + 1 ;
end
counter(:) = counter(:)/tests;
res
counter
vNew





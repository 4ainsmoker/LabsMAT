clc, clear;
%%https://www.mathworks.com/help/econ/dtmc.redistribute.html

steps = 15;
p = [0.7 0.3; 
    0.1 0.9];
vNew = [1 0];

var = zeros(1,steps);
positions = zeros(2,steps);
for step = 1:steps
    vOld = vNew;
    vNew = vOld*p;
    positions(:,step) = vNew;
    var(step) = std(vNew -vOld);
end
%plot(var);
varProd = [1 0] * p^steps;
rez = p(2,1);
counter = [0 0];
tests = 30000;
% for i = 1:tests
%     pos = 1;
%     for s = 1:steps
%         if pos == 1
%             if rand()> p(1)
%                 pos = 2;
%             end
%         else
%             if rand() > p(2,2)
%                 pos = 1;
%             end
%         end
%     end
%     %здесь полученное значение прибавляем в одну из ячеек
%     counter(pos) = counter(pos) + 1 ;
% end

vNew = [1 0];
varMod = zeros(1,steps);
posMod = zeros(2,steps);
for step = 1:steps
    vOld = vNew;
    counter = [0 0];
    for i = 1:tests
        pos = 1;
        for s = 1:step
            if pos == 1
                if rand()> p(1)
                    pos = 2;
                end
            else
                if rand() > p(2,2)
                    pos = 1;
                end
            end
        end
        counter(pos) = counter(pos) + 1;
    end
    vNew = counter/tests;
    posMod(:,step) = vNew;
    varMod(step) = std(vNew-vOld);
    
end
figure(1);
plot(1:steps,var,'green',1:steps, varMod,'blue');
figure(2);
plot(1:steps,positions,'red',1:steps, posMod,'blue');
counter(:) = counter(:)/tests;
counter
varProd


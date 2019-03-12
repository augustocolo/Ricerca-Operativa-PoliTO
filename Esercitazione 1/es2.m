mobiliprob = optimproblem('ObjectiveSense', 'maximize');
% Variabili
x = optimvar('mobili',4,'Type','integer','LowerBound',0);
% Vincoli
%   Stabilimenti
stabAConst = [3,5]';
mobiliprob.Constraints.vincStabA = dot(stabAConst,[x(1),x(2)]) <= 4000;
mobiliprob.Constraints.vincStabB = 4*x(3)+4*x(4) <= 4000;
%   Trasporto
woodNeed = [0.2, 0.6, 0.3, 0.5];
transp = 5*(dot([woodNeed(1),woodNeed(2)],[x(1),x(2)]))+3*(dot([woodNeed(3),woodNeed(4)],[x(3),x(4)]));
mobiliprob.Constraints.Trasp = transp <= 15000;
%   Legno
mobiliprob.Constraints.Legno = dot(woodNeed, x)<=50000;
% Funz.Obiettivo
PrezzoTransp = 20*transp;
PrezzoLegno = 10*dot(woodNeed, x);
RicavoUnitario = [150, 80, 100, 110];
mobiliprob.Objective = dot(RicavoUnitario,x)-PrezzoTransp-PrezzoLegno;
%Soluzione
[sol, fval] = solve(mobiliprob);

sol.mobili
fval




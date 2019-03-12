puntiprob = optimproblem('ObjectiveSense','minimize');
% Variabili
x = optimvar('centro', 5, 'Type', 'integer', 'LowerBound', 0, 'UpperBound', 1);
% Vincoli
puntiprob.Constraints.uno = x(3)+ x(4) >= 1;
puntiprob.Constraints.due = x(1)+ x(2) + x(3) >= 1;
puntiprob.Constraints.tre = x(1)+ x(5) >= 1;
puntiprob.Constraints.quattro = x(1) + x(4) + x(5) >= 1;
puntiprob.Constraints.cinque = x(1) + x(2) + x(3) + x(4) >= 1;
puntiprob.Constraints.sei = x(2) + x(3) + x(4) >= 1;
puntiprob.Constraints.sette = x(4) + x(5) >= 1;
% Funz.Obbiettivo
costo = [310, 250, 260, 330, 280];
puntiprob.Objective = dot(costo, x);
%Soluzione
[sol, fval] = solve(puntiprob);

sol.centro
fval
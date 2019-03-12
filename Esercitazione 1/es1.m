modelprob = optimproblem('ObjectiveSense', 'maximize');
% Variabili
modello = optimvar('modello',3,'Type','integer','LowerBound',0);
%Vincoli
%   Materiale
vMaterA = [2, 3, 5]';
vMaterB = [4, 2, 7]';
modelprob.Constraints.vincMaterA = dot(vMaterA, modello) <= 4000;
modelprob.Constraints.vincMaterB = dot(vMaterB, modello) <= 6000;
%   Richiesta Minima
modelprob.Constraints.x1 = modello(1) >= 200;
modelprob.Constraints.x2 = modello(2) >= 200;
modelprob.Constraints.x3 = modello(3) >= 150;
%   Forza Lavoro
valForzaLavoro = [1, 1/2, 1/3]';
modelprob.Constraints.forLav = dot(valForzaLavoro,modello) <= 700;
%Funzione Obbiettivo
vObb = [30, 20, 50]';
modelprob.Objective = dot(vObb, modello);
%Soluzione
[sol, fval] = solve(modelprob);

sol.modello
fval

prob = optimproblem('ObjectiveSense','maximize');
% Variabili
x = optimvar('acquisti', 3, 'Type', 'integer', 'LowerBound', 0);
nFurgoncini = dot(x, [2,2,2]);
nAutoMedie = dot(x, [1,2,2]);
nBerline = dot(x, [1,1,2]);
% Vincoli
%   Costo d'acquisto
prob.Constraints.cAcqu = dot(x, [80000,120000,140000]) <= 8000000;
%   Numero di auto
prob.Constraints.nF = nFurgoncini >= 80;
prob.Constraints.nA = nAutoMedie >= 130;
prob.Constraints.nB = nBerline >= 40;
%   Vincolo assicurazione
prob.Constraints.Assic = dot([nBerline, nAutoMedie, nFurgoncini], [250, 125, 75]) <= 50000;
%   Funzione obbiettivo
prob.Objective = nFurgoncini + nBerline + nAutoMedie;
%Soluzione
[sol, fval] = solve(prob);

acquisti = sol.acquisti
parco_macchine = fval
numeroFurg = dot(sol.acquisti, [2,2,2])
numeroAutoM = dot(sol.acquisti, [1,2,2])
numeroBerline = dot(sol.acquisti, [1,1,2])
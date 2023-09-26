%creates a new Mamdani-style Fuzzy Inference System structure
clear all;

a = newfis('settletime')
% Create new FIS with filename "settletime"

% Add input variable pressure, temperature and output variable time to FIS.
% Fuzzification

%input 1-pressure
a = addvar(a, 'input', 'pressure', [-30 30]);
a = addmf (a, 'input',1, 'NB', 'gaussmf', [-30 -30 -20 ]);
a = addmf (a, 'input', 1, 'NS', 'trimf', [-28.8 -18.8 -6.27]);
a = addmf (a, 'input', 1, 'Z', 'trimf', [-17.3 -6.94 4.68]);
a = addmf (a, 'input', 1, 'PS', 'trimf', [-6.63 5.35 16.5]);
a = addmf (a, 'input', 1, 'PB', 'trapmf',[5.32 17 30 30]);

%plot the MF
figure;plotmf(a, 'input', 1);

% input 2- temperature-Fuzzification
a = addvar(a, 'input', 'temperature', [0 30]);
a = addmf(a, 'input', 2,'low','trapmf', [0 0 5 12.49]);
a = addmf(a, 'input', 2, 'medium', 'trimf',[0.2904 12.3 24.31]);
a = addmf(a, 'input',2, 'high', 'trapmf', [12.29 24.3 36.31 36.31]);
figure;
plotmf(a, 'input', 2);

%mampis a = mamfis
%addInput a = addInput(a, [-30 30])

%output 1-cooking time
a = addvar(a , 'output', 'time', [0,15]);
a = addmf(a, 'output',1, 'short' , 'trapmf', [0 0 4 7.568]);
a = addmf(a, 'output', 1, 'average', 'trimf', [0.1223 7.54 14.96]);
a = addmf(a , 'output', 1, 'long', 'trapmf', [7.512 10 15 15]);
figure;
plotmf(a, 'output', 1);

%creating rules
%rule1 : if pressure is NB AND temperature is high THEN time is short
%rule2 : if pressure is NB AND temperature is medium THEN time is average
%rule3 L if pressure is Z AND temperature is high THEN time is average
%rule4 : if pressure is PS THEN time is long

rule = [1 3 1 1 1; 2 2 2 1 1; 3 3 2 1 1; 4 0 3 1 1];
a = addrule(a, rule);

% Use centroid defuzzication method to find output z.
aa = setfis(a, 'Defuzzmethord', 'centroid');
time1 = evalfis([-22 15], aa)

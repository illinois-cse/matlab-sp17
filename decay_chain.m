function dN = decay_chain(t,N0)
% We expect that N0 is a two-element vector.

% Decay constants / s^-1
l_A = log(2);
l_B = log(2)/20;

% Equation matrix
eqns = [-l_A 0;
     l_A -l_B];
    
 % Differential change from N0
 dN = eqns*N0;
 
 
 
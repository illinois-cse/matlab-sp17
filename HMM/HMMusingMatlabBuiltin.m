clear all
clc
figure(2)
N = 1000;
transition = [ 0.9 0.1;
              0.4 0.6];
emission = [0.8 0.1 0.1;
            0.2 0.3 0.5];
% hiddenStateList = [1 2]; % all the possible states
% observationList = [1 2 3]; % all the possible observations

[obs, states] = hmmgenerate(N, transition, emission);
stairs(obs, 'r-', 'LineWidth',2)
set(gca, 'YGrid','on', 'YLim', [0 4]);
xlabel('Time step')
ylabel('observations')

transition_GUESS = [0.5 0.5; 0.4 0.6];
emission_GUESS = [0.5 0.3 0.2; 0.3 0.3 0.4];
[transition_EST, emission_EST] = hmmtrain(obs, transition_GUESS, emission_GUESS)

likelystates = hmmviterbi(obs, transition, emission);
% the percentage of correct guess is
sum(obs==likelystates)/N

[transition_EST, emission_EST] = hmmestimate(obs, states)
clear all
clc
transition = [ 0.9 0.1;
              0.4 0.6];
emission = [0.8 0.1 0.1;
            0.2 0.3 0.5];
hiddenStateList = [1 2]; % all the possible states
observationList = [1 2 3]; % all the possible observations

% Generate Hidden Markov Process step by step
N = 100;
states = repmat(-9999, 1, N);
obs = repmat(-9999, 1, N);

states(1) = 2; % starting hidden state
ProbVector = emission(find(hiddenStateList == states(1)), :);
id = find(cumsum(ProbVector) >= rand());
obs(1) = observationList(id(1));

for i =2:N
    ProbVector = transition(find(hiddenStateList == states(i-1)), :);
    id = find(cumsum(ProbVector) >= rand());
    states(i) = hiddenStateList(id(1));

    ProbVector = emission(find(hiddenStateList == states(i)), :);
    id = find(cumsum(ProbVector) >= rand());
    obs(i) = observationList(id(1));
end

% plot(obs, 'r.--')
figure(1)
stairs(obs, 'b-', 'LineWidth',2)
set(gca, 'YGrid','on', 'YLim',[0 4])
xlabel('Time step')
ylabel('observations')

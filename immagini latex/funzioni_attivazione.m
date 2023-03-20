clear all; close all; clc;

x = [-6:0.01:6];

%% Relu
y_relu = max(0, x);

figure()
plot(x, y_relu, 'LineWidth', 2);
grid on;
title("ReLU")
xlim([-6,6])
ylim([-0.5, 6])
set(gca, 'FontSize', 20)

%% Sigmoide 
y_sigmoide = 1 ./ (1+exp(-x));

figure()
plot(x, y_sigmoide, 'LineWidth', 2);
grid on;
title("Sigmoide")
xlim([-6,6])
ylim([-0.5, 1.5])
set(gca, 'FontSize', 20)

%% Tangente imperbolica

y_tanh = tanh(x);

figure()
plot(x, y_tanh, 'LineWidth', 2);
grid on;
title("Tangente iperbolica")
xlim([-6,6])
ylim([-1.5, 1.5])
set(gca, 'FontSize', 20)

%% Leaki relu
y_leaki = max(0.05*x, x);

figure()
plot(x, y_leaki, 'LineWidth', 2);
grid on;
title("Leaky ReLU (0.05)")
xlim([-6,6])
ylim([-0.5, 5.5])
set(gca, 'FontSize', 20)

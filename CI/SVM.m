% Dataset 1
X1 = [1, 1, 0, -1];
X2 = [1, -1, 2, -1];
kelas_y = [1, -1, -1, -1];
support_vector = [1, 1, 1, 0];

% Support vectors
support_vectors_X1 = X1(support_vector == 1)
support_vectors_X2 = X2(support_vector == 1)

% Hyperplane parameters
slope = -1;  % Adjust based on your specific data
intercept = 1;  % Adjust based on your specific data

% Hyperplane equation: X2 = slope * X1 + intercept
x_hyperplane = linspace(min(X1), max(X1), 100)
y_hyperplane = slope * x_hyperplane + intercept
    
    % Plotting
scatter(X1, X2, [], kelas_y, 'filled');
hold on;
scatter(support_vectors_X1, support_vectors_X2, 'r', 'filled', 'DisplayName', 'Support Vectors');
plot(x_hyperplane, y_hyperplane, 'b-', 'LineWidth', 2, 'DisplayName', 'Hyperplane');
hold off;

title('Hyperplane Visualization - Dataset 1');
xlabel('X1');
ylabel('X2');
legend('Dataset 1', 'Location', 'Best');
grid on;
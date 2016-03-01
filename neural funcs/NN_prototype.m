


clear ; close all; clc
addpath('cicular cut','readHands4','neural func' );

input_layer_size  = 10;  
hidden_layer_size = 5;   
num_labels = 5;
n = 1800;
y = zeros(n,1);

%%
fprintf('Loading Data ...\n')

[X] = readHands4('data3' , n , 'jpg');
y(1:360)=5;
y(361:360*2)=1;
y(360*2+1:360*3)=2;
y(360*3+1:360*4)=3;
y(360*4+1:360*5)=4;
m = size(X, 1);

fprintf('\nInitializing Neural Network Parameters ...\n')

Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

nn_params = [Theta1(:) ; Theta2(:)];




%%
fprintf('\nTraining Neural Network... \n')
options = optimset('MaxIter', 50);


lambda = 1;


costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);


[nn_params, cost] = fmincg(costFunction, nn_params, options);


Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

      
 pred = predict(Theta1, Theta2, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);

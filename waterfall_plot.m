clear; clc;

Z = double(cell2mat(struct2cell(load('z_values.mat'))));
X = double(cell2mat(struct2cell(load('x_values.mat'))));
Y = double(cell2mat(struct2cell(load('y_values.mat'))));

X = 1:size(Z);

colormap copper;
waterfall(Z);


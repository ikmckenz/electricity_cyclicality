clear; clc;

Z = double(cell2mat(struct2cell(load('z_values.mat'))));
Y = string(cell2mat(struct2cell(load('x_values.mat'))));

% Flip both so the most recent data is at the top
Z = flipud(Z);
Y = flipud(Y);

% Animate the plot panning into shape
for i=2275:5:2275
    h = waterfall(Z);
    set(h, 'EdgeColor', 'k');
    ticks = 1:1000:size(Y);
    yticks(ticks);
    yticklabels(Y(ticks));
    xticks([1,6,12,18,24]);
    set(gca, 'YLim', get(gca, 'YLim')+i);
    filename = sprintf('shots/img%04d.png', length(Y)-i);
    saveas(h, filename);
    disp(i)
end



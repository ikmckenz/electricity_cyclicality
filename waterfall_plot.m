clear; clc;

Z = double(cell2mat(struct2cell(load('data/z_values.mat'))));
Y = cell2mat(struct2cell(load('data/x_values.mat')));

% Flip both so the most recent data is at the top
Z = flipud(Z);
Y = flipud(Y);

% Animate the plot panning into view
for i=0:5:length(Y)
    h = waterfall(Z);
    ax = gca;
    set(h, 'EdgeColor', 'k');
    ticks = 1:1000:size(Y);
    % <= 2016a
    set(gca, 'YTick', ticks);
    set(gca, 'YTickLabel', Y(ticks, :));
    % >= 2016b
    %yticks(ticks);
    %yticklabels(Y(ticks));
    %xticks([1,6,12,18,24]);
    set(gca, 'YLim', get(gca, 'YLim')+i);
    filename = sprintf('shots/img%04d.png', length(Y)-i);
    saveas(h, filename);
    disp(i)
end


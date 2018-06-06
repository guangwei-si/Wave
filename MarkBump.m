function bumpMask = MarkBump(dataStack, mask)
[width, height, frames] = size(dataStack);

bumpMask = zeros(width, height, frames);

% % randomly pick some foreground pixels and visualize the data distribution.
% for i = 1:3
%     x = randi([1, width], 1);     y = randi([1, height], 1);
%     while mask(x, y) == 0
%         x = randi([1, width], 1);     y = randi([1, height], 1);
%     end
%     figure;   subplot(2,1,1); plot(1:frames, squeeze(dataStack(x, y, :))); 
%     title(['x=', num2str(x), ', y=', num2str(y),]);
%     subplot(2,1,2); histogram(squeeze(dataStack(x, y, :)));
% end

for i = 1:width
    for j = 1:height
        if mask(i, j) == 1
            trace = squeeze(dataStack(i, j, :));
            threshold = max([2 * (median(trace) - min(trace)) + median(trace), (max(trace)-median(trace))*0.33 + median(trace)]);
            traceMark = zeros(1,1,frames);
            traceMark(:,:,trace>threshold) = 1;
            bumpMask(i, j, :) = traceMark;
        end
    end
end

end

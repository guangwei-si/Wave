%set a test pixel
x = 200; y = 340;    

[width, height, frame] = size(dataStack);

trace = squeeze(maskBump(x, y, :)); %retrieve all the frames

burst = bwconncomp(trace); % find out all the bursts

t = burst.PixelIdxList{2}(1);
tRange = max(t - 8, 1 ): min(t + 8, frame); % define a range

signal = squeeze(dataStack(x, y, tRange)); % get the signal

winHalfSize = 5; %specify the range to map

dtM = zeros(2*winHalfSize + 1, 2*winHalfSize + 1); % define dt matrix

for dx = -winHalfSize:winHalfSize
    for dy = -winHalfSize:winHalfSize
        if ~(dx==0 && dy==0)
            newx = dx + x;  newy = dy + y;
            if maskFg(newx, newy) == 1
                signalCmp = squeeze(dataStack(newx, newy, tRange));
                d = finddelay(zscore(signal), zscore(signalCmp)); % find the time delay
                dtM(dx + winHalfSize + 1, dy+winHalfSize+1) = d;
            else
                dtM(dx + winHalfSize + 1, dy+winHalfSize+1) = NaN;
            end
        end
    end
end
%% show the dt matrix
figure; 
imagesc(dtM,'AlphaData',~isnan(dtM));
xticklabels(string(-winHalfSize:winHalfSize)); 
yticklabels(string(-winHalfSize:winHalfSize));colorbar;
title(['x=', num2str(x), ',y=', num2str(y), ',t=', num2str(t)]);

savefig(gcf, fullfile('Results', 'dtMatrixExample.fig'));
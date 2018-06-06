function mask = MarkForeground(dataStack, threshold)
%label each pixel as foreground (1) or background (0).
% thresholding the maxproejction - minprojection.

maxP = max(dataStack, [], 3); % max projection
minP = min(dataStack, [], 3); % min projection

diff = maxP- minP;  % differnece

mask = zeros(size(diff)); %initialize mask

mask(diff > threshold) = 1; % differences larger than a threshold, set to 1

% show the fused image
C = imfuse(maxP, mask); figure; imshow(C); 

end
function mask = MarkForeground(dataStack)
%label each pixel as foreground (1) or background (0).
% thresholding the maxproejction - minprojection.

maxP = max(dataStack, [], 3); % max projection
minP = min(dataStack, [], 3); % min projection
medianP = median(dataStack,  3);

diff = maxP- minP;  % differnece

mask = zeros(size(diff)); %initialize mask


threshold =  2*(medianP - minP) + medianP;

mask(diff > threshold) = 1; % differences larger than a threshold, set to 1

% show the fused image
C = imfuse(maxP, mask); figure; imshow(C); 

end
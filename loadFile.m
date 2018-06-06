function dataStack = LoadFile(fileName)

if nargin == 0 % if file name not specified
    fileName = fullfile('Data', 'sample.avi'); % sample file
end

[~, ~, ext] = fileparts(fileName);  % extract file type

if strcmp(ext, '.avi')  %if file type is avi
    v = VideoReader(fileName);
    dataStack = zeros(v.Height, v.Width, v.Duration * v.FrameRate); 
    i = 0;
    while hasFrame(v)
        i = i+1;
        if strcmp(v.VideoFormat, 'RGB24') 
            dataRGB = readFrame(v); %RGB 
            dataGray = rgb2gray(dataRGB);
            dataStack(:,:,i) = dataGray;
        end
    end
end
end
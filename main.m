SetParam;

dataStack = LoadFile(p.fileName);   %load the movie file

maskFg = MarkForeground(dataStack); % mark the foreground

maskBump = MarkBump(dataStack, maskFg); % mark the burst time point for each pixel


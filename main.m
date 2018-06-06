SetParam;

dataStack = LoadFile(p.fileName);   %load the movie file

maskFg = MarkForeground(dataStack); % make the foreground

maskBump = MarkBump(dataStack, maskFg);
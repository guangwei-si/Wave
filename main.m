SetParam;

dataStack = LoadFile(p.fileName);   %load the movie file

maskF = MarkForeg(dataStack, p.threshold); % make the foreground


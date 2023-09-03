function [xcross,ycross] = interception(x1,y1,x2,y2)
% Find intersections between two arrays y1 and y2

xstart = max(x1(1),x2(1));
xstop  = min(x1(end),x2(end));
x      = linspace(xstart,xstop,(xstop-xstart)*1000 + 1);
y1_int = interp1(x1,y1,x,'linear');
y2_int = interp1(x2,y2,x,'linear');

diff_vec = abs(y2_int-y1_int);
minDiff  = min(diff_vec);
minIndex = find(diff_vec == minDiff);

xcross = x(minIndex);
ycross = y1_int(minIndex);

end
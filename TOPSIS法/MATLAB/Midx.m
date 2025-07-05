% 将中间型变成极大型
function [Posx] = Midx(x, best)
    M = max(abs(x - best));
    Posx = 1 - abs(x - best) / M;
end
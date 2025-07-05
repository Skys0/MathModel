function [Posx] = Interx(x, a, b)
    Rx = size(x, 1);
    M = max([a-min(x), max(x)-b]);
    Posx = zeros(Rx, 1);
    for i = 1: Rx
        if x(i) < a
            Posx(i) = 1 - (a - x(i)) / M;
        elseif x(i) > b
            Posx(i) = 1 - (x(i) - b) / M;
        else
            Posx(i) = 1;
        end
    end
end
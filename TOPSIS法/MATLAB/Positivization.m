function [Posx] = Positivization(x, type, i)
    if type == 1   % 极小型
        Posx = Minx(x);
    elseif type == 2    % 中间型
        disp(['请给中间型' num2str(i) '输入一个最佳的值：']);
        best = input('');
        Posx = Midx(x, best);
    elseif type == 3    % 区间型
        disp(['请给区间型' num2str(i) '输入一个最佳的下界：']);
        a = input('');
        disp(['请给区间型' num2str(i) '输入一个最佳的上界：']);
        b = input('');
        Posx = Interx(x, a, b);
        
    end
end
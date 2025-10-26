classdef PUMP < dynamicprops
    properties
        % 基本参数
        i = 0;                      %泵浦光强（W/m^2）
        lambda = 0;                 %泵浦波长（m）
        w0 = 0;                     %泵浦光束半径（m）
    end

    methods
        function Init(obj, i, lambda, w0)
            obj.i = i;
            obj.lambda = lambda*1e-9;
            obj.w0 = w0*1e-6;
        end
    end
end
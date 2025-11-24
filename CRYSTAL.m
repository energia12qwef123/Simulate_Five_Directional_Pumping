classdef CRYSTAL < dynamicprops
    properties
        % 基本参数
        r = 0;                 %定义增益介质的半径（m）
        alpha = 0;               %定义增益介质吸收率 (m^-1)
    end

    methods
        function Init(obj, r, alpha)
            obj.r = r*1e-3;
            obj.alpha = alpha*100;
        end

        function I = Propagation(obj, pump, x2,y2,theta)
            x=x2*cosd(theta)+y2*sind(theta);
            y=-x2*sind(theta)+y2*cosd(theta);
            d=sqrt((obj.r).^2-x.^2)+y;
            wy=pump.w0.*sqrt(1+(pump.lambda.*y2./(pi.*pump.w0.^2)).^2);
            I=sqrt(2./pi)*(pump.i./wy).*exp(-(2*x.^2)./(wy.^2)-obj.alpha.*d);
        end
    end
end
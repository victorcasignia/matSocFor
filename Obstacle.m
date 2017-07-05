classdef Obstacle
	properties
        x1
        x2
        y1
        y2
        p1
        p2
        %parameters
        A = 2000;                 %interaction strength
        B = 0.08;                 %repulsive interaction
    end
     methods
        function obj = Obstacle(x1, y1, x2, y2)
        %definition if no parameters were inputted
            if nargin < 4
                obj.x1 = 0;
                obj.y1 = 0;
                obj.x2 = 0;
                obj.y2 = 0;
            else
                obj.x1 = x1;
                obj.y1 = y1;
                obj.x2 = x2;
                obj.y2 = y2;
            end
            obj.p1 = [x1 y1];
            obj.p2 = [x2 y2];
        end
    end
end
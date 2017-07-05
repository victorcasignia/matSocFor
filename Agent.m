%define an agent class

classdef Agent
   properties
      rad                       %r
      mass                      %m
      pos                       %x(t)
      vel                       %v(t)
      vel_init                  %v_0(t)
      %parameters defined here
      A = 2000;                 %interaction strength
      B = 0.08;                 %repulsive interaction
      k = 120000;               %elasticity constant
      kappa = 240000;           %relative tangential velocity
      tau = 0.5;                %relaxation time
      t_p = 0.1;                %timestep prediction
   end
   methods
     %constructor of agent. in this function, the agent variables are
     %initially defined
     function obj = Agent(pos)
        %definition if no parameters were inputted
        if nargin == 0
            %if position not defined, set agent at origin
            pos = [0 0];
        else
            obj.pos = pos;
        end
        %definition of default values
        %radius between .25m and .35m
        obj.rad = .25 + (.35-.25).*rand(1,1);
        %velocity is 0
        obj.vel = [0 0]
        %mass set to 80kg
        obj.mass = 80;
        %initial velocity from 1m/s to 1.5m/s
        obj.vel_init = 1 + (1.5-1).*rand(1,1);
     end
   end
end
%define an agent class

classdef Agent
   properties
      rad                       %r
      mass                      %m
      pos                       %x(t)
      vel                       %v(t)
      vel_init                  %v_0(t)
      vel_max
      speed_init
      destination               %destination
      %parameters defined here
      A = 2000;                 %interaction strength
      B = 0.08;                 %repulsive interaction
      tau = 0.5;                %relaxation time
      t_p = 0.1;                %timestep prediction
   end
   methods
     %constructor of agent. in this function, the agent variables are
     %initially defined
     %pos and des are both 2D vector
     function obj = Agent(pos, des)
        %definition if no parameters were inputted
        if nargin == 0
            %if position not defined, set agent at origin
            obj.pos = [0 0];
            obj.destination = [0 0];
        else
            obj.pos = pos;
            obj.destination = des;
        end
        %definition of default values
        %radius between .25m and .35m
        obj.rad = .25 + (.35-.25).*rand(1,1);
        %mass set to 80kg
        obj.mass = 80;
        %initial velocity from 1m/s to 1.5m/s (normal)
        obj.speed_init = 1 + (1.5-1).*rand(1,1);
        obj.vel_init = obj.speed_init*((obj.destination-obj.pos)/norm(obj.destination-obj.pos));
        %velocity is 0
        obj.vel = obj.vel_init;
        %max vel is equal to initial vel
        obj.vel_max = obj.vel;
     end
   end
end
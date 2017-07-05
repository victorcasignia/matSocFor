%define an agent class. this class has 4 values. 
%rad, mass, pos and vel

classdef Agent
   properties
      rad
      mass
      pos
      vel
      vel_init
      %parameters defined here
      %interaction strength
      A = 2000;
      %repulsive interaction
      B = 0.08;
      %elasticity constant
      k = 120000;
      %relative tangential velocity
      kappa = 240000;
      %relaxation time
      tau = 0.5;
      %
      
   end
   methods
     %constructor of agent. in this function, the agent variables are
     %initially defined
     function obj = Agent(pos)
        %definition if no parameters were inputted
        if nargin == 0
            %if position not defined, set agent at origin
            pos = [0,0];
        else
            obj.pos = pos;
        end
        %definition of default values
        %radius between .25m and .35m
        obj.rad = .25 + (.35-.25).*rand(1,1);
        %velocity is 0
        obj.vel = 0;
        %mass set to 80kg
        obj.mass = 80;
        %initial velocity from 1m/s to 1.5m/s
        obj.vel_init = 1 + (1.5-1).*rand(1,1);
     end
     %compute dv/dt with the social force model 
     function accelerate(allAgents)
         %sum of socForce
         for i = 1:length(allAgents)
         
         end
         %add components

     end
     %compute interagent force. parameters are input to the function
     function out = socForce()
     end
     %compute desired force. parameters are input to the function
     function out = desForce()
     end
     %compute obstacle force. parameters are input to the function
     function out = obsForce()
     end
     %compute physical force. parameters are input to the function
     function out = phyForce()
     end
     %compute group force. parameters are input to the function
     function out = groForce()
     end
   end
end
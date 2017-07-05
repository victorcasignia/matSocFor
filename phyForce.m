%compute physical force. input: two agent i, j
function out = phyForce(i, j)
    %pushing force
    r_ij = i.rad + j.rad;
    d_ij = norm(i.pos - j.pos);
    theta = max([0, r_ij]);
    n_ij = (i.pos - j.pos) / d_ij;
    k = 120000;               %elasticity constant
    
    p_force = k*theta*n_ij;
    
    %friction force
    kappa = 240000;           %relative tangential velocity
    t_ij = [-n_ij(2) n_ij(1)];
    delta_v = dot((j.vel - i.vel),t_ij);
    f_force = kappa*theta*delta_v*t_ij;
    
    out = p_force + f_force;
end
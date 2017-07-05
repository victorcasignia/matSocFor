
%compute social force. input: two agent i, j
function out = socForce(i, j)
    r_ij = i.rad + j.rad;
    x_ij = i.pos + (i.vel*j.t_p);
    x_ji = j.pos + (j.vel*i.t_p);
    d_prime = norm(x_ij - x_ji);
    n_prime = (x_ij - x_ji)/d_prime;
    out = i.A * exp((r_ij-d_prime)/i.B)*n_prime;
end
%compute desired force. parameters are input to the function
function out = desForce()
end
%compute obstacle force. parameters are input to the function
function out = obsForce()
end
%compute physical force. input: agent_j
function out = phyForce()
%pushing force
    d = abs(i.pos - j.pos);
end
%compute group force. parameters are input to the function
function out = groForce()
end
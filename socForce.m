%compute social force. input: two agent i, j
function out = socForce(i, j)
    r_ij = i.rad + j.rad;
    x_ij = i.pos + (i.vel*j.t_p);
    x_ji = j.pos + (j.vel*i.t_p);
    d_prime = norm(x_ij - x_ji);
    n_prime = (x_ij - x_ji)/d_prime;
    out = i.A * exp((r_ij-d_prime)/i.B)*n_prime;
end
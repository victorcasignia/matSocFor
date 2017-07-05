%compute desired force. input: agent i, wall b
function out = obsForce(i, b)
    predicted = i.pos + i.vel*i.t_p;
    
    %using the line to point distance formula
    d_prime_ib = abs(((b.y2-b.y1)*predicted(1)) - ((b.x2-b.x1)*predicted(2)) + (b.x2*b.y1) - (b.y2*b.x1));
    d_prime_ib = d_prime_ib/sqrt((b.y2-b.y1)^2 + (b.x2-b.x1)^2);

    %norm of vector pointing from line to predicted point
    n_prime_ib = predicted - ((b.p2-b.p1)/norm(b.p2-b.p1) * dot(predicted, (b.p2-b.p1)/norm(b.p2-b.p1)));
    n_prime_ib = n_prime_ib/norm(n_prime_ib);
    
    %distance from point to line
    d_ib = abs(((b.y2-b.y1)*i.pos(1)) - ((b.x2-b.x1)*i.pos(2)) + (b.x2*b.y1) - (b.y2*b.x1));
    d_ib = d_ib/sqrt((b.y2-b.y1)^2 + (b.x2-b.x1)^2);
    
    %norm of vector pointing from line to point
    n_ib = i.pos - ((b.p2-b.p1)/norm(b.p2-b.p1) * dot(i.pos, (b.p2-b.p1)/norm(b.p2-b.p1)));
    n_ib = n_ib/norm(n_ib);
    
    k = 120000;
    theta = max([0, i.rad - d_ib]);
    
    out = b.A * exp((i.rad - d_prime_ib)/b.B)*n_prime_ib + k*theta*n_ib;
end
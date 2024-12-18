
function D_d=calcD(K_d,M,D)
    %#codegen
    if size(K_d,1)>1
        K_d1=sqrtm(K_d);
        M1 = sqrtm(M);
    else
        K_d1=sqrt(K_d);
        M1 = sqrt(M);
    end
    % if inertia_shaping
    D_d_=K_d1*D*M1+M1*D*K_d1;
    
    % assert(max(max(abs(imag(D_d_))))==0, ...
    % 'sqrt_damping: Damping Matrix has imaginary parts');
    D_d=real(D_d_);
end

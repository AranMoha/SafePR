function PInv_out = pinv_mod(in, mat_weight, lambda_sing)
    lambda_sing_=0;
%     PInv_out = mat_weight*in' /(in*mat_weight*in');
    if abs(det(in*mat_weight*in'))<1e-3
        lambda_sing_=lambda_sing;
    end
    PInv_out = mat_weight*in' /(in*mat_weight*in'+lambda_sing_*eye(size(in,1)));
end
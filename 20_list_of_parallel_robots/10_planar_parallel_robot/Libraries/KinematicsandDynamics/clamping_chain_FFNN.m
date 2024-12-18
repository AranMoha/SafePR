
function [predprob,predchain] = ...
    clamping_chain_FFNN(FMext_est_MobPlat_KS0,ffnn_clamping_chain_param, distances)
    %sel_features = ['FMext_est_MobPlat_KS0_1','FMext_est_MobPlat_KS0_2','FMext_est_MobPlat_KS0_3', 
    %                'Tauext_est_KS0_1','Tauext_est_KS0_2','Tauext_est_KS0_3', 
    %              	 'distances_1', 'distances_2', 'distances_3',
    %                'angles_1','angles_2','angles_3']
    weights_InpHL1 = ffnn_clamping_chain_param.weights_InpHL1;
    baises_InpHL1 = ffnn_clamping_chain_param.baises_InpHL1;
    
    weights_HL12 = ffnn_clamping_chain_param.weights_HL12;
    baises_HL12 = ffnn_clamping_chain_param.baises_HL12;
    
    weights_HL23 = ffnn_clamping_chain_param.weights_HL23;
    baises_HL23 = ffnn_clamping_chain_param.baises_HL23;
    
    weights_HL34 = ffnn_clamping_chain_param.weights_HL34;
    baises_HL34 = ffnn_clamping_chain_param.baises_HL34;
    
    weights_HL45 = ffnn_clamping_chain_param.weights_HL45;
    baises_HL45 = ffnn_clamping_chain_param.baises_HL45;
    
    
    weights_HL5Out = ffnn_clamping_chain_param.weights_HL5Out;
    baises_HL5Out = ffnn_clamping_chain_param.baises_HL5Out;

    x_ffnn =[FMext_est_MobPlat_KS0(1); FMext_est_MobPlat_KS0(2); FMext_est_MobPlat_KS0(3);
             distances(1); distances(2); distances(3)];
    % Datenvorverarbeitung
    x_ffnn_sc = (x_ffnn-ffnn_clamping_chain_param.sc_X_mean)./ffnn_clamping_chain_param.sc_X_stddev;
    % Input Layer zum 1. Hidden Layer
    h1 = tanh(weights_InpHL1*x_ffnn_sc + baises_InpHL1);
    % 1. Hidden Layer zum 2. 
    h2 = tanh(weights_HL12*h1+ baises_HL12);
    % 2. Hidden Layer zum 3. 
    h3 = tanh(weights_HL23*h2 + baises_HL23);
    % 3. Hidden Layer zum 4. 
    h4 = tanh(weights_HL34*h3 + baises_HL34);
    % 4. Hidden Layer zum 5. 
    h5 = tanh(weights_HL45*h4 + baises_HL45);
    % 4. Hidden Layer zum Output Layer
    outl = Calcsoftmax(weights_HL5Out*h5 + baises_HL5Out);

    [~,predchain]=max(outl);
    predprob = outl;
end


function g = Calcsoftmax(z)
    dim = 1;
    s = ones(1, ndims(z));
    s(dim) = size(z, dim);
    maxz = max(z, [], dim);
    expz = exp(z-repmat(maxz, s));
    g = expz ./ repmat(sum(expz, dim), s);
end
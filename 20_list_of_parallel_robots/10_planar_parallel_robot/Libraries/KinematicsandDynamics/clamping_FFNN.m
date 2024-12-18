function [predprob_max,predcontact,predprob] = clamping_FFNN(FMext_est_MobPlat_KS0,ffnn_clamping_param)
    weights_InpHL1 = ffnn_clamping_param.weights_InpHL1;
    baises_InpHL1 = ffnn_clamping_param.baises_InpHL1;
    
    weights_HL12 = ffnn_clamping_param.weights_HL12;
    baises_HL12 = ffnn_clamping_param.baises_HL12;
    
    weights_HL23 = ffnn_clamping_param.weights_HL23;
    baises_HL23 = ffnn_clamping_param.baises_HL23;
    
    weights_HL34 = ffnn_clamping_param.weights_HL34;
    baises_HL34 = ffnn_clamping_param.baises_HL34;
    
    weights_HL45 = ffnn_clamping_param.weights_HL45;
    baises_HL45 = ffnn_clamping_param.baises_HL45;    
    
    weights_HL5Out = ffnn_clamping_param.weights_HL5Out;
    baises_HL5Out = ffnn_clamping_param.baises_HL5Out;

    x_ffnn =[FMext_est_MobPlat_KS0(1); FMext_est_MobPlat_KS0(2); FMext_est_MobPlat_KS0(3)];
    % Datenvorverarbeitung
    x_ffnn_sc = (x_ffnn-ffnn_clamping_param.sc_X_mean)./ffnn_clamping_param.sc_X_stddev;
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
    % 5. Hidden Layer zum Output Layer
    out = weights_HL5Out*h5 + baises_HL5Out;

    predcontact= round(1/(1+exp(-out)));
    p1 = 1/(1+exp(-out));
    p2 = 1-p1;
    predprob = [p1, p2];
%     predprob = 1/(1+exp(-out));    
    predprob_max = max([p1,p2]);
%     predprob = 4*p1*p1-4*p1+1;

end
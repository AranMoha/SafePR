function tau_rp = tau_rp_3RRR(qja_rad, a_rp, w_rp, phi_rp)
    tau_rp=zeros(3,1);
    
    for i=1:3
       tau_rp(i,1) = a_rp(i)*sin( w_rp(i)*(qja_rad(i)-phi_rp(i))); 
    end
end

%%
% close all
% % a_rp = [1.58000000000000,1.55532605795418, 1.49371441939454];
% a_rp = [1.58000000000000,1.55532605795418, 1.49371441939454];
% w_rp = [168; 168; 180.1];
% % phi_rp = [0.000726886095203191 ;...
% %          -0.00963407525338565  ; ...
% %          -0.00510409634688980 ];
% phi_rp = [0.000726886095203191 - pi/3;...
%          -0.00963407525338565  + pi/3; ...
%          -0.00510409634688980  + pi];
% tau_rp = zeros(length(data_.t),3); 
% for i=1:length(data_.t)
%     qja_rad = pi/180*data_.Q_ist_grad(i,[1 4 7]);
% %     tau_rp(i,:) = tau_rp_3RRR(qja_rad, a_rp, w_rp, phi_rp);
% 
%        tau_rp(i,1) = a_rp(1)*sin( w_rp(1)*(qja_rad(1)-phi_rp(1))); 
%        tau_rp(i,2) = a_rp(2)*sin( w_rp(2)*(qja_rad(2)-phi_rp(2))); 
%        tau_rp(i,3) = a_rp(3)*sin( w_rp(3)*(qja_rad(3)-phi_rp(3))); 
%        
% end
% figure;
% plot(data_.t, tau_rp(:,1)); hold on; plot(data_.t, data_.tauQa_ist_Nm(:,1)); grid on;
% % figure;
% % plot(data_.t, tau_rp(:,2)); hold on; plot(data_.t, data_.tauQa_ist_Nm(:,2));
% % figure;
% % plot(data_.t, tau_rp(:,3)); hold on; plot(data_.t, data_.tauQa_ist_Nm(:,3));
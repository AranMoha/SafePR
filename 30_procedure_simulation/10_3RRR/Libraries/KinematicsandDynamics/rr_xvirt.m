function [q_xtr_virt, q_ytr_virt, q_zrot_virt, ...
          x_xtr_virt, x_ytr_virt, x_zrot_virt] = rr_xvirt(xphiEE, param)

% Berechnung der nächsten theoretischen Enedeffektor Lage
x_xtr_virt = xphiEE;
x_ytr_virt = xphiEE;
x_zrot_virt = xphiEE;

x_xtr_virt(1) = x_xtr_virt(1) + param.delta_xphiEE_m;
x_ytr_virt(2) = x_ytr_virt(2) + param.delta_xphiEE_m;
x_zrot_virt(3) = x_zrot_virt(3) + param.delta_xphiEE_rad;

q_xtr_virt = calcqtotal_fik(x_xtr_virt, param);
q_ytr_virt = calcqtotal_fik(x_ytr_virt, param);
q_zrot_virt = calcqtotal_fik(x_zrot_virt, param);

end





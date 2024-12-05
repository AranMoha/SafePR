function y_omegaUKFreturn = y_omegaUKF(xE, dxE, Rot_SE)
  omega_imu_T = [0 0 0;];
  omega_imu_T(1,1) = dxE(4) * (cos(xE(6)) * Rot_SE(1,1) - sin(xE(6)) * Rot_SE(1,2)) * cos(xE(5)) + cos(xE(6)) * dxE(5) * Rot_SE(1,2) + sin(xE(6)) * dxE(5) * Rot_SE(1,1) + Rot_SE(1,3) * (sin(xE(5)) * dxE(4) + dxE(6));
  omega_imu_T(1,2) = dxE(4) * (cos(xE(6)) * Rot_SE(2,1) - sin(xE(6)) * Rot_SE(2,2)) * cos(xE(5)) + cos(xE(6)) * dxE(5) * Rot_SE(2,2) + sin(xE(6)) * dxE(5) * Rot_SE(2,1) + Rot_SE(2,3) * (sin(xE(5)) * dxE(4) + dxE(6));
  omega_imu_T(1,3) = dxE(4) * (cos(xE(6)) * Rot_SE(3,1) - sin(xE(6)) * Rot_SE(3,2)) * cos(xE(5)) + cos(xE(6)) * dxE(5) * Rot_SE(3,2) + sin(xE(6)) * dxE(5) * Rot_SE(3,1) + Rot_SE(3,3) * (sin(xE(5)) * dxE(4) + dxE(6));
  y_omegaUKFreturn = omega_imu_T;

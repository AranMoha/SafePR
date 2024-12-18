function y = AddPosOrient(x1, x2)
    y = zeros(6,1);
    y(1:3) = x1(1:3) + x2(1:3);

    R_Eul1 = CalcRot_Eul(x1(4:6));
    R_Eul2 = CalcRot_Eul(x2(4:6));

    R_Eul_12 = R_Eul1*R_Eul2;

    y(4) = atan2(-R_Eul_12(2,3), R_Eul_12(3,3));
    y(6) = atan2(-R_Eul_12(1,2), R_Eul_12(1,1));
    y(5) = atan2(R_Eul_12(1,3), R_Eul_12(1,1)*cos(y(6)) - R_Eul_12(1,2)*sin(y(6)));   
end
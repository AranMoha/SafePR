function R_Eul = CalcRot_Eul(phi)
    R_Eul = zeros(3,3);

    phix = phi(1);
    phiy = phi(2);
    phiz = phi(3);

    R_Eul = [cos(phiy)*cos(phiz)                                    -cos(phiy)*sin(phiz)                                    sin(phiy);
             cos(phix)*sin(phiz)+sin(phix)*sin(phiy)*cos(phiz)       cos(phix)*cos(phiz)-sin(phix)*sin(phiy)*sin(phiz)     -sin(phix)*cos(phiy);
             sin(phix)*sin(phiz)-cos(phix)*sin(phiy)*cos(phiz)       sin(phix)*cos(phiz)+cos(phix)*sin(phiy)*sin(phiz)      cos(phix)*cos(phiy)];
end
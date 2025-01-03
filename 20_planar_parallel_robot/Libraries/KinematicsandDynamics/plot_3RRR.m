function plot_3RRR(r_fixPlat_j, l_all_id, qa, qp, xEE, psi_j, fs)

% r_mobPlat_j = [r_BasisPla_MobPla(2); r_BasisPla_MobPla(2); r_BasisPla_MobPla(2)]; beta_j = [0;120; 240]*pi/180;
% l_1i  = [0.58152 0.62002];
% l_2i  = [0.58121 0.61964];
% l_3i  = [0.58215 0.61975];
% l_all_id = [l_1i, l_2i, l_3i];
% r_fixPlat_j = [0.6877; 0.6922; 0.6666]; psi_j =[90.0000; 210.7631; 330.4901]*pi/180; % gemessen
% cnt = 1;
% xEE_ist_m_rad = data_.xEE_ist_m_rad(cnt,:);
% qa_ist_rad = data_.Q_ist_grad(cnt, [1,4,7])*pi/180;
% qp_ist_rad = data_.Q_ist_grad(cnt, [2,5,8])*pi/180;
% qp2_ist_rad = data_.Q_ist_grad(cnt, [2,5,8])*pi/180;
l_1i = l_all_id([1,2]);
l_2i = l_all_id([3,4]);
l_3i = l_all_id([5,6]);
% Direkte Kinematik der ersten seriellen Kette mit Vektor von KS0 zu KS_Gj        
r_0G1_KS0  = [sin(psi_j(1));                -cos(psi_j(1))]*r_fixPlat_j(1);% Inertial zu Basisgelenk 1
r_G1F1_KS0 = [cos(psi_j(1) + qa(1));         sin(psi_j(1) + qa(1))]*l_1i(1); % Basisgelenk1 zu Elle 1
r_F1P1_KS0 = [cos(psi_j(1) + qa(1) + qp(1)); sin(psi_j(1) + qa(1) + qp(1))]*l_1i(2); % Elle 1 zu Koppelgelenk 1
r_0F1_KS0 = r_0G1_KS0 + r_G1F1_KS0;
r_0P1_KS0 = r_0F1_KS0 + r_F1P1_KS0;

% Direkte Kinematik der zweiten seriellen Kette mit Vektor von KS0 zu KS_Gj        
r_0G2_KS0 = [sin(psi_j(2));                -cos(psi_j(2))]*r_fixPlat_j(2); % Inertial zu Basisgelenk 2
r_G2F2_KS0 = [cos(psi_j(2) + qa(2));         sin(psi_j(2) + qa(2))]*l_2i(1); % Basisgelenk 2 zu Elle 2
r_F2P2_KS0 = [cos(psi_j(2) + qa(2) + qp(2)); sin(psi_j(2) + qa(2) + qp(2))]*l_2i(2); % Elle 2 zu Koppelgelenk 2. Ist auskommentiert, da Sensor am passiven Gelenk defekt
r_0F2_KS0 = r_0G2_KS0 + r_G2F2_KS0;
r_0P2_KS0 = r_0F2_KS0 + r_F2P2_KS0;

% Direkte Kinematik der dritten seriellen Kette mit Vektor von KS0 zu KS_Gj         
r_0G3_KS0 = [sin(psi_j(3));                -cos(psi_j(3))]*r_fixPlat_j(3); % Inertial zu Basisgelenk 3
r_G3F3_KS0 = [cos(psi_j(3) + qa(3));         sin(psi_j(3) + qa(3))]*l_3i(1); % Basisgelenk 3 zu Elle 3
r_F3P3_KS0 = [cos(psi_j(3) + qa(3) + qp(3)); sin(psi_j(3) + qa(3) + qp(3))]*l_3i(2); % Elle 3 zu Koppelgelenk 3
r_0F3_KS0 = r_0G3_KS0 + r_G3F3_KS0;
r_0P3_KS0 = r_0F3_KS0 + r_F3P3_KS0;

%%
zlevel=0;

axis([-1 0.8 -0.8 0.8 zlevel-0.2 zlevel+0.2])
xlabel('$x$ in $\mathrm{m}$', 'Interpreter', 'latex', 'FontSize',fs); hold on; grid on;
ylabel('$y$ in $\mathrm{m}$', 'Interpreter', 'latex', 'FontSize',fs); hold on; grid on;
% title("Current time: " + round(i/1000) + " until " +dp_end/1000)
view(2)
grid on;
hold on;
% Plot Circle
[m_circle, r_circle] = circle_3points_2D(r_0P1_KS0, r_0P2_KS0, r_0P3_KS0);
% [~,X,Y,Z] = circle3([m_circle zlevel], r_circle, 100, 'k-', 2.5, [0 0 0]./255);
teta=-pi:0.01:pi;
X=m_circle(1)+r_circle*cos(teta);
Y=m_circle(2)+r_circle*sin(teta);
Z=zeros(1,numel(X));

fill3(X, Y, Z, [0.9 0.9 0.9], 'LineStyle', 'none');hold on;
%  plot(pos_Pi_KS0_serie(1,1), pos_Pi_KS0_serie(2,1),'x'); hold on;
% plot(pos_Pi_KS0_serie(1,2), pos_Pi_KS0_serie(2,2),'x')
% plot(pos_Pi_KS0_serie(1,3), pos_Pi_KS0_serie(2,3),'x')

leg11 = [r_0G1_KS0(1), r_0G1_KS0(2); 
        r_0F1_KS0(1), r_0F1_KS0(2)];
plot3(leg11(:,1), leg11(:,2), zlevel*ones(size(leg11,1)), 'Color', [0.5 0.5 0.5 0.5],'Linewidth',5);
hold on;

leg21 = [r_0G2_KS0(1), r_0G2_KS0(2); 
        r_0F2_KS0(1), r_0F2_KS0(2)];
plot3(leg21(:,1), leg21(:,2), zlevel*ones(size(leg21,1)), 'Color', [0.5 0.5 0.5 0.5],'Linewidth',5);
hold on;

leg31 = [r_0G3_KS0(1), r_0G3_KS0(2); 
        r_0F3_KS0(1), r_0F3_KS0(2)];
plot3(leg31(:,1), leg31(:,2), zlevel*ones(size(leg31,1)), 'Color', [0.5 0.5 0.5 0.5],'Linewidth',5);
hold on;

%         plot3(pos_Gi_KS0(1,chain), pos_Gi_KS0(2,chain), 2, 'ko', 'MarkerEdgeColor','k', 'MarkerSize',20,'Linewidth',1.5, 'MarkerFaceColor','#D95319');


leg12 = [r_0F1_KS0(1), r_0F1_KS0(2);
        r_0P1_KS0(1), r_0P1_KS0(2)];
plot3(leg12(:,1), leg12(:,2), zlevel*ones(size(leg12,1)), 'Color', [0.5 0.5 0.5 0.5],'Linewidth',5);hold on;

leg22 = [r_0F2_KS0(1), r_0F2_KS0(2);
        r_0P2_KS0(1), r_0P2_KS0(2)];
plot3(leg22(:,1), leg22(:,2), zlevel*ones(size(leg22,1)), 'Color', [0.5 0.5 0.5 0.5],'Linewidth',5);hold on;

leg32 = [r_0F3_KS0(1), r_0F3_KS0(2);
        r_0P3_KS0(1), r_0P3_KS0(2)];
plot3(leg32(:,1), leg32(:,2), zlevel*ones(size(leg32,1)), 'Color', [0.5 0.5 0.5 0.5],'Linewidth',5);hold on;


plot3(r_0G1_KS0(1), r_0G1_KS0(2), zlevel+0.1, 'ko', 'MarkerEdgeColor','k', 'MarkerSize',25,'Linewidth',1.5, 'MarkerFaceColor','#929591');hold on;
plot3(r_0G2_KS0(1), r_0G2_KS0(2), zlevel+0.1, 'ko', 'MarkerEdgeColor','k', 'MarkerSize',25,'Linewidth',1.5, 'MarkerFaceColor','#929591');hold on;
plot3(r_0G3_KS0(1), r_0G3_KS0(2), zlevel+0.1, 'ko', 'MarkerEdgeColor','k', 'MarkerSize',25,'Linewidth',1.5, 'MarkerFaceColor','#929591');hold on;

plot3(r_0F1_KS0(1), r_0F1_KS0(2), zlevel+0.1, 'ko', 'MarkerEdgeColor','k', 'MarkerSize',10,'Linewidth',1.5, 'MarkerFaceColor','#EDB120');hold on;
plot3(r_0F2_KS0(1), r_0F2_KS0(2), zlevel+0.1, 'ko', 'MarkerEdgeColor','k', 'MarkerSize',10,'Linewidth',1.5, 'MarkerFaceColor','#EDB120');hold on;
plot3(r_0F3_KS0(1), r_0F3_KS0(2), zlevel+0.1, 'ko', 'MarkerEdgeColor','k', 'MarkerSize',10,'Linewidth',1.5, 'MarkerFaceColor','#EDB120');hold on;
plot3(r_0P1_KS0(1), r_0P1_KS0(2), zlevel+0.1, 'ko', 'MarkerEdgeColor','k', 'MarkerSize',10,'Linewidth',1.5, 'MarkerFaceColor','#EDB120');hold on;
plot3(r_0P2_KS0(1), r_0P2_KS0(2), zlevel+0.1, 'ko', 'MarkerEdgeColor','k', 'MarkerSize',10,'Linewidth',1.5, 'MarkerFaceColor','#EDB120');hold on;
plot3(r_0P3_KS0(1), r_0P3_KS0(2), zlevel+0.1, 'ko', 'MarkerEdgeColor','k', 'MarkerSize',10,'Linewidth',1.5, 'MarkerFaceColor','#EDB120');hold on;
%         leg22 = [pos_Mi_KS0_serie(1,chain), pos_Mi_KS0_serie(2,chain);
%                 pos_Mi_KS0_serie(1,chain)+3*(pos_Pi_KS0_serie(1,chain)-pos_Mi_KS0_serie(1,chain)), pos_Mi_KS0_serie(2,chain)+3*(pos_Pi_KS0_serie(2,chain)-pos_Mi_KS0_serie(2,chain))];
%         plot3(leg22(:,1), leg22(:,2), zlevel*ones(size(leg22,1)), '--k','Linewidth',2);
tG1=text(-0.15, -0.02,['$\left(\mathrm{CS}\right)_{0}$'], 'Interpreter', 'latex', 'FontSize',fs);
plotEEAxis([0;0;0], zlevel+0.1)


tG1=text(0.45, -0.075,['1. Chain'], 'Interpreter', 'latex', 'FontSize',fs);
tG2=text(-0.55, 0.675,['2. Chain'], 'Interpreter', 'latex', 'FontSize',fs);
tG3=text(-0.65, -0.55,['3. Chain'], 'Interpreter', 'latex', 'FontSize',fs);

% tG1=text(0.8, 0,['$\left(\mathrm{CS}\right)_{A1}$'], 'Interpreter', 'latex', 'FontSize',fs);
% plotEEAxis([r_0G1_KS0(1); r_0G1_KS0(2); psi_j(1)], zlevel+0.1)
% plotEEAxis([r_0F1_KS0(1); r_0F1_KS0(2); psi_j(1) + qa(1) + qp(1)], zlevel+0.1)

% tG2=text(-0.55, 0.7,['$\left(\mathrm{CS}\right)_{A2}$'], 'Interpreter', 'latex', 'FontSize',fs);
% plotEEAxis([r_0G2_KS0(1); r_0G2_KS0(2); psi_j(2)], zlevel+0.1)
% plotEEAxis([r_0F2_KS0(1); r_0F2_KS0(2); psi_j(2) + qa(2) + qp(2)], zlevel+0.1)
% 
% tG3=text(-0.55, -0.65,['$\left(\mathrm{CS}\right)_{A3}$'], 'Interpreter', 'latex', 'FontSize',fs);
% plotEEAxis([r_0G3_KS0(1); r_0G3_KS0(2); psi_j(3)], zlevel+0.1)
% plotEEAxis([r_0F3_KS0(1); r_0F3_KS0(2); psi_j(3) + qa(3) + qp(3)], zlevel+0.1)

% tF1=text(r_0F1_KS0(1)-0.1, r_0F1_KS0(2)+0.1,['$\left(\mathrm{CS}\right)_{F1}$'], 'Interpreter', 'latex', 'FontSize',fs);
% tF2=text(r_0F2_KS0(1)-0.23, r_0F2_KS0(2),['$\left(\mathrm{CS}\right)_{F2}$'], 'Interpreter', 'latex', 'FontSize',fs);
% tF3=text(r_0F3_KS0(1)-0.1, r_0F3_KS0(2)-0.1,['$\left(\mathrm{CS}\right)_{F3}$'], 'Interpreter', 'latex', 'FontSize',fs);

tG1=text(xEE(1)+0.01, xEE(2)-0.05,['$\left(\mathrm{CS}\right)_\mathrm{MP}$'], 'Interpreter', 'latex', 'FontSize',fs);
plotEEAxis(xEE, zlevel+0.1)
end
%%
function [m_circle, r_cirlce] = circle_3points_2D(P1, P2, P3)
% -------------------------------------------------------------------------
% Eing�nge: P1, P2, P3:     Drei Punkte, durch die der Kreis verlaufen soll    
    %Kreismittelpunkt
    m_circle = [-(-P3(1) ^ 2 * P1(2) + P3(1) ^ 2 * P2(2) + P3(2) ^ 2 * P2(2) + P3(2) * P1(1) ^ 2 - P2(2) * P1(1) ^ 2 - P3(2) * P2(1) ^ 2 - P3(2) ^ 2 * P1(2) + P3(2) * P1(2) ^ 2 - P3(2) * P2(2) ^ 2 + P2(2) ^ 2 * P1(2) - P2(2) * P1(2) ^ 2 + P2(1) ^ 2 * P1(2)) / (P2(1) * P3(2) - P2(1) * P1(2) + P3(1) * P1(2) - P3(1) * P2(2) + P1(1) * P2(2) - P1(1) * P3(2)) / 0.2e1 (P2(1) * P3(2) ^ 2 - P2(1) * P1(2) ^ 2 + P2(1) * P3(1) ^ 2 + P1(1) * P2(1) ^ 2 - P2(1) * P1(1) ^ 2 + P1(1) * P2(2) ^ 2 - P3(1) * P2(1) ^ 2 + P3(1) * P1(1) ^ 2 + P3(1) * P1(2) ^ 2 - P3(1) * P2(2) ^ 2 - P1(1) * P3(2) ^ 2 - P1(1) * P3(1) ^ 2) / (P2(1) * P3(2) - P2(1) * P1(2) + P3(1) * P1(2) - P3(1) * P2(2) + P1(1) * P2(2) - P1(1) * P3(2)) / 0.2e1];

    %Kreisradius
    r_cirlce = sqrt(m_circle(1) ^ 2 + m_circle(2) ^ 2 + (-P2(1) * P3(2) ^ 2 * P1(2) + P1(1) * P3(2) ^ 2 * P2(2) + P3(2) * P2(1) * P1(2) ^ 2 - P3(2) * P1(1) * P2(1) ^ 2 + P3(2) * P2(1) * P1(1) ^ 2 - P3(2) * P1(1) * P2(2) ^ 2 - P2(2) * P3(1) * P1(1) ^ 2 - P2(2) * P3(1) * P1(2) ^ 2 + P2(2) * P1(1) * P3(1) ^ 2 + P2(2) ^ 2 * P3(1) * P1(2) - P3(1) ^ 2 * P2(1) * P1(2) + P2(1) ^ 2 * P3(1) * P1(2)) / (P2(1) * P3(2) - P2(1) * P1(2) + P3(1) * P1(2) - P3(1) * P2(2) + P1(1) * P2(2) - P1(1) * P3(2)));
end

function plotEEAxis(xEE, zlevel)
    
    % Plot Axis
    % x
    fill3([xEE(1) xEE(1)+cos(xEE(3))*0.1], [xEE(2) xEE(2)+sin(xEE(3))*0.1], [zlevel zlevel], [1 0 0], 'EdgeColor', [1 0 0], 'LineWidth',2)
    Xx = [xEE(1)+cos(xEE(3))*0.1-sin(xEE(3))*0.01 xEE(1)+cos(xEE(3))*0.1+cos(xEE(3))*0.03 xEE(1)+cos(xEE(3))*0.1+sin(xEE(3))*0.01];
    Yx = [xEE(2)+sin(xEE(3))*0.1+cos(xEE(3))*0.01 xEE(2)+sin(xEE(3))*0.1+sin(xEE(3))*0.03 xEE(2)+sin(xEE(3))*0.1-cos(xEE(3))*0.01];
    Zx = [zlevel zlevel zlevel];
    C = [1 0 0];
    fill3(Xx,Yx,Zx,C,'EdgeColor', C,'LineWidth',2)
    
    % y
    fill3([xEE(1) xEE(1)-sin(xEE(3))*0.1], [xEE(2) xEE(2)+cos(xEE(3))*0.1], [zlevel zlevel], [0.4660 0.6740 0.1880]	, 'EdgeColor', [0.4660 0.6740 0.1880], 'LineWidth',2)
    Xy = [xEE(1)-sin(xEE(3))*0.1-cos(xEE(3))*0.01 xEE(1)-sin(xEE(3))*0.1-sin(xEE(3))*0.03 xEE(1)-sin(xEE(3))*0.1+cos(xEE(3))*0.01];
    Yy = [xEE(2)+cos(xEE(3))*0.1-sin(xEE(3))*0.01 xEE(2)+cos(xEE(3))*0.1+cos(xEE(3))*0.03 xEE(2)+cos(xEE(3))*0.1+sin(xEE(3))*0.01];
    Zy = [zlevel zlevel zlevel];
    C = [0.4660 0.6740 0.1880]	;
    fill3(Xy,Yy,Zy,C,'EdgeColor', C, 'LineWidth',1)
    
    % z
    fill3([xEE(1) xEE(1)], [xEE(2) xEE(2)], [zlevel zlevel+0.05], [0 0 1], 'EdgeColor', 'b', 'LineWidth',1)
    X = [xEE(1)+cos(xEE(3))*0.01 xEE(1) xEE(1)-cos(xEE(3))*0.01];
    Y = [xEE(2)-sin(xEE(3))*0.01 xEE(2) xEE(2)+sin(xEE(3))*0.01];
    Z = [zlevel+0.05 zlevel+0.08 zlevel+0.05];
    C = [0 0 1];
    fill3(X,Y,Z,C, 'EdgeColor', 'b', 'LineWidth',1)    
    
    plot3(xEE(1),xEE(2), zlevel,'ko','MarkerSize',5,'MarkerEdgeColor','k','MarkerFaceColor','k');
end
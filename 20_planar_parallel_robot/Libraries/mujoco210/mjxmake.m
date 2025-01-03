% clear
cd(fileparts(which('mjxmake')));

if exist('mjx')==3
	mjx('exit');
end
clear mjx;

% compile
% if isunix
% 	mex -v -output mjx -D_NIX -I../../../mujoco200_linux/include/ mjx.cpp -L../../../mujoco200_linux/bin/ -lmujoco200 -lGL -lglew libglfw.so.3 
% else
% 	mex -v -output mjx -DWIN32 -D_WIN32 -I..\..\..\mujoco210_win64\include\ mjx.cpp -L..\..\..\mujoco200_win64\bin\ -lmujoco200 -lglfw3
% end

mex -v -output mjx -DWIN32 -D_WIN32 -IC:\Users\root\Desktop\haley_ws\MuJoCo_Aran\mujoco210\include\ mjx.cpp -LC:\Users\root\Desktop\haley_ws\MuJoCo_Aran\mujoco210\bin\ -lmujoco210 -lglfw3 %-lmujoco210nogl -lglfw3static
%% Constants
X = [0 1; 1 0]; Z = [1 0; 0 -1]; Y = 1i * X * Z;
%% Intro
plotBlockSphere;
%% s2
vec0 = [ 1; 0 ];
vec1 = [ 0; 1];
alpha = sqrt(1/4);
beta = sqrt(3/4);
psi = @(t) alpha*vec0 + exp(-1i*t)*beta*vec1;

s_cycle = psi(0);
q_cycle = psi(pi/2);
h_cycle = psi(pi);
f_cycle = psi(2*pi);

vec = plotBlochVec(q_cycle, 'blue');
pause;
delete(vec);
vec = plotBlochVec(h_cycle, 'blue');
pause;
delete(vec);
vec = plotBlochVec(f_cycle, 'blue');
pause;
delete(vec);
%% s3
omega = 1;
T2 = 10*pi/omega;
T1 = 5*pi/omega;
M0 = 1;
M1 = 1;
Mt = @(t) [ M1*cos(omega*t)*exp(-t/T2) -M1*sin(omega*t)*exp(-t/T2) ...
    M0*(1-exp(-t/T1)) ];

for t = [0, 1, 4, 10, 20]
    M = Mt(t*pi);
    vec = line([0 M(1)], [0 M(2)], [0 M(3)], ...
        'LineWidth', 2, 'Marker', 'o', 'Color', 'blue');
    vec_X = line([0 M(1)], [0 0], [0 0], ...
        'LineWidth', 2, 'Marker', 'o', 'Color', 'cyan');
    title(['Magnetization vector and X measurement at t=', num2str(t), '\pi']);
    pause;
    delete(vec);
    delete(vec_X);
end
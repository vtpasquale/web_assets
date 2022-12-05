% Anthony Ricciardi
% December 2022
clear all; close all; clc

%% User data
% Mesh
nElements = 20;
barLength = 1;

% Properties
A = 0.01; % bar area
rho = 4.14499E-4; % Ti density
c = 46.368; % Ti specific heat
k = 0.00116666; % Ti conductivity

% Initial and boundary conditions
nNodes = nElements+1;
Tf0 = 70*ones(nNodes-1,1); % initial temperature values
Ts = 165; % fixed temperature at one end


%% Shape functions and derivatives
N     = @(xi) [1-xi,xi];
dNdXi = [-1,1];
dNdX  = @(L) (1./L)*dNdXi;

% Geometry
nodeLocations = linspace(0,barLength,nNodes);
gaussPointLocations = 0.5*(nodeLocations(2:end)+nodeLocations(1:end-1));
elementLengths = diff(nodeLocations);
elementGlobalDof = [1:nNodes-1;2:nNodes];

% Assemble
K = zeros(nNodes);
C = zeros(nNodes);
p  = zeros(nNodes,1);
Ne = N(0.5); % Shape function values at single Gauss point (same values for all elements at xi = 0.5)
for i = 1:nElements
    Le = elementLengths(i);
    dof = elementGlobalDof(:,i);
    dNdXe = dNdX( Le ); % Shape function derivative values for element length
    ke = Le*A * dNdXe.'*k*dNdXe; % Single-point Gauss quadrature
    ce = Le*A * Ne.'*c*rho*Ne; % Single-point Gauss quadrature
    K(dof,dof) = K(dof,dof) + ke;
    C(dof,dof) = C(dof,dof) + ce;
end

% Partition
sSet = nNodes;
fSet = 1:nNodes-1;
Kff = K(fSet,fSet);
Cff = C(fSet,fSet);
Kfs = K(fSet,sSet);
pf = p(fSet) - Kfs*Ts;

%% Physical Coordinate Solution
% Steady state
Tss = zeros(nNodes,1);
Tss(fSet) = Kff\pf;
Tss(sSet) = Ts;
% plot(nodeLocations,Tss,'.-')
% ylim([min(Tss)-10 max(Tss)+10])
% title('Steady-State Solution')

% Time hisotory
fun = @(t,Tf) Cff\(-Kff*Tf - Kfs*Ts);
[t,T] = ode45(fun,[0,1],Tf0);
% plot(nodeLocations,[T(end,:),Ts],'.-')
% title('Transient Solution')

%% Eigenvalues
[v,d] = eig(Kff,-Cff);
[~,ind] = sort(diag(d),'descend');
v=v(:,ind);
d=d(ind,ind);
vPlot=[v;zeros(1,size(v,2))];
lambda = diag(d); % flip sign here (rather that at eig) for preferred result ordering
figure(1)
plot(nodeLocations,vPlot(:,1:6))
title('Eigenvectors 1-6')

%% Modal solution
Km = diag(diag(v.'*Kff*v));
Cm = diag(diag(v.'*Cff*v));
pm = v.'*(-Kfs*Ts);

% Initial
eta_0 = v\Tf0;

% Steady state
eta_ss = v\Tss(fSet); %-Km\pm;

% Initial dynamic
eta_dy0 = eta_0 - eta_ss; 

% Solve time history using integration
funm = @(t,Tmm) Cm\(-Km*Tmm + pm);
[tm,eta_ti] = ode45(funm,[0,1], eta_0 );

% Solve time history using analytic expression
ta = 1;
eta = eta_dy0.*exp(lambda*ta) + eta_ss;

%% Nastran results at 1 sec
nas = [0	70.81191
0.05	70.88551
0.1	71.11401
0.15	71.52065
0.2	72.14405
0.25	73.03811
0.3	74.27119
0.35	75.92457
0.4	78.08973
0.45	80.8642
0.5	84.34589
0.55	88.62597
0.6	93.78069
0.65	99.86275
0.7	106.8931
0.75	114.8539
0.8	123.6842
0.85	133.2785
0.9	143.4893
0.95	154.133
1	165];

%% Plot results
figure(2)
plot(nodeLocations, [T(end,:).'         ; Ts],'.',...
     nodeLocations, [v*(eta_ti(end,:).'); Ts],'o',...
     nodeLocations, [v*eta              ; Ts],'-',...
     nas(:,1)     ,  nas(:,2)                ,'--')
grid('on')
legend('Direct Integration','Modal Integration','Modal Time-Analytic','Nastran','location','northwest')
title('Reponse at 1 second')
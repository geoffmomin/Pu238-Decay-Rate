% This MATLAB script plots the neutron concentration trend for U235 and
% Pu238 for the first 6 months after nuclear reactor startup. The following
% assumptions were made:
% 1. It was assumed that the decay of U235 was negligible as its decay 
%    constant is considerably small. Half-life of 7.038E8 years.
% 2. Since the fission cross-section of Pu238 is 17.4E-24 cm2, which is 
%    an order of magnitude smaller than the cross-section of U235, it was 
%    assumed negligible.
% 3. All of the U235 that absorbs the neutrons become Pu238. Obviously, 
%    this is not the case as U235 gains a deuteron to become Np237 which
%    then captures a neutron to become Pu238.
% *********************************Updates*********************************
% March 22, 2016 - 0.1 - Release
%
% Copyright 2016 Geoffrey Momin, B.Eng Nuclear Engineering Student
%
% Licensed under the Apache License, Version 2.0 (the "License");
% you may not use this file except in compliance with the License.
% You may obtain a copy of the License at
% 
%        http://www.apache.org/licenses/LICENSE-2.0
% 
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
% See the License for the specific language governing permissions and
% limitations under the License.

% Given values
flux = 4E14;
D = 0.7; %fuel density cm

% Obtained values
U235_fission = 582.6E-24;
U235_absorb = 582.6E-24 + 98.8E-24;
Pu238_fission = 17.9E-24;
Np237_capture = 175.9E-24;
t = 0:6;
time = 0:6*30.44*24*3600;
rho_U235 = 18.811; % all densities in g/cc
rho_Pu238 = 19.333;
rho_Np237 = 20.454;
A = 6.022E23;
M_U235 = 235.043923062;
M_Np237 = 237.048173444;
M_Pu238 = 238.049559894;

% Property Calculations
V = ((D^2)/4)*pi*1; %assuming 1 cm length
enrichment = [0.2 0.711 1.9 20 80];

% ################## 0.2% U235 ##################
% U235 over 6 months
p_U235 = enrichment(1)/100;
N = 143 * ((p_U235 * rho_U235 * A)/(M_U235)); % number of neutrons
Nt1 = N * exp(U235_absorb * flux * time * -1);


% Pu238 over 6 months
NU_absorb = N * exp(U235_absorb * flux * time * -1);
Nt_Pu1 = NU_absorb - (NU_absorb.*exp(2.51E-10 * time * -1));


% ################## 0.711% U235 ##################
% U235 over 6 months
p_U235 = enrichment(2)/100;
N = 143 * ((p_U235 * rho_U235 * A)/(M_U235)); % number of neutrons
Nt2 = N * exp(U235_absorb * flux * time * -1);


% Pu238 over 6 months
NU_absorb = N * exp(U235_absorb * flux * time * -1);
Nt_Pu2 = NU_absorb - (NU_absorb.*exp(2.51E-10 * time * -1));


% ################## 1.9% U235 ##################
% U235 over 6 months
p_U235 = enrichment(3)/100;
N = 143 * ((p_U235 * rho_U235 * A)/(M_U235)); % number of neutrons
Nt3 = N * exp(U235_absorb * flux * time * -1);


% Pu238 over 6 months
NU_absorb = N * exp(U235_absorb * flux * time * -1);
Nt_Pu3 = NU_absorb - (NU_absorb.*exp(2.51E-10 * time * -1));


% ################## 20% U235 ##################
% U235 over 6 months
p_U235 = enrichment(4)/100;
N = 143 * ((p_U235 * rho_U235 * A)/(M_U235)); % number of neutrons
Nt4 = N * exp(U235_absorb * flux * time * -1);


% Pu238 over 6 months
NU_absorb = N * exp(U235_absorb * flux * time * -1);
Nt_Pu4 = NU_absorb - (NU_absorb.*exp(2.51E-10 * time * -1));


% ################## 80% U235 ##################
% U235 over 6 months
p_U235 = enrichment(5)/100;
N = 143 * ((p_U235 * rho_U235 * A)/(M_U235)); % number of neutrons
Nt5 = N * exp(U235_absorb * flux * time * -1);


% Pu238 over 6 months
NU_absorb = N * exp(U235_absorb * flux * time * -1);
Nt_Pu5 = NU_absorb - (NU_absorb.*exp(2.51E-10 * time * -1));

% ################ Graphing ##################

figure
ax1 = subplot(2,1,1);
ax2 = subplot(2,1,2);
plot(ax1,time,Nt1,time,Nt2,time,Nt3,time,Nt4,time,Nt5);
plot(ax2,time,Nt_Pu1,time,Nt_Pu2,time,Nt_Pu3,time,Nt_Pu4,time,Nt_Pu5);
title(ax1,'Concentration of Nuclides over time');
xlabel('Time (Seconds)');
ylabel('Nuclides');

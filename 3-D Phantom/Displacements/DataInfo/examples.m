%%
comp_folder = '0mm_no_inc_lumpy';
%% Get sum of reaction forces on probe nodes
load([comp_folder,'./reaction_forces.mat']); % fea_rf
load('./DataInfo/node_locations.mat'); %probe_nodes, phantom_nodes

% Just get the sum of the axial (col 3) reaction forces along the probe nodes
c = [sum(fea_rf(probe_nodes(:,1),3,1)),sum(fea_rf(probe_nodes(:,1),3,2)),sum(fea_rf(probe_nodes(:,1),3,3))];
%% Pull out u_x, u_y and u_z as well as x, y and z for phantom nodes
load([comp_folder,'./fea_displacements.mat']); % fea_rf
load('./DataInfo/node_locations.mat'); %probe_nodes, phantom_nodes
% all displacement and position data are in mm

% x-y-z in ABAQUS axes (see info.pptx) (undeformed coords)
x = phantom_nodes(:,2);
y = phantom_nodes(:,3);
z = phantom_nodes(:,4);

% 3 components of displacements located at position x, y and z
u_x = squeeze(fea_displacements(phantom_nodes(:,1),2,:)); % last dim is the load step
u_y = squeeze(fea_displacements(phantom_nodes(:,1),3,:));
u_z = squeeze(fea_displacements(phantom_nodes(:,1),4,:));

% Data is not in a uniform 3D gridding. Using a scatter plot to show axial
% displacements:

% Scatter plot (permute axis to get corrent orientation in MATLAB)
figure;
scatter3(x,z,y,2,u_y(:,3),'o','filled');
axis square
% axes labels are back in abaqus orientation
xlabel('X');ylabel('Z');zlabel('Y');
c = colorbar;c.Label.String = 'u_y at step 3 (mm)';
title('Axial (Y) displacements');set(gca,'Fontsize',14);
%% View volumetric Young's modulus map:
load('./DataInfo/e_map.mat')
e_map = permute(e_map,[2,3,1]);
volumeViewer(e_map)
% The axis for the e_map only is:
% x = linspace(-25,25,100);y=x;z=x;


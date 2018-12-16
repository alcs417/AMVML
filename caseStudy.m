clc;              
clear;            % clear all workspace variables
close all;        % close all windows
  
currentFolder = pwd;              
addpath(genpath(currentFolder));

load('datasets/miR_sim.mat');
load('datasets/disease_sim.mat');
load('datasets/miR_disease.mat');

% set the diagonal elements to 0
go_sim_matrix(logical(eye(size(go_sim_matrix)))) = 0;
seq_sim_matrix(logical(eye(size(seq_sim_matrix)))) = 0;
miR_sim_matrix(logical(eye(size(miR_sim_matrix)))) = 0;
disease_sim_matrix(logical(eye(size(disease_sim_matrix)))) = 0;

% construct a cell for convenience
A(1) = {go_sim_matrix};
A(2) = {seq_sim_matrix};
A(3) = {miR_sim_matrix};

D(1) = {disease_sim_matrix};

predRes = GetCaseStudy(A, D, miR_disease_matrix);

save('output/case_study.mat', 'predRes');

fprintf('Case study process completed.');

% fdr_SPARK() - compute corrected p-value based on Benjamini-Hochberg procedure with a false discovery rate
% I found that the MATLAB internal fdr function (mafdr.m) works badly with input matrix with 2 or more dimensions, or input matrix with zeros.
% This function (fdr_SPARK.m) works perfectly with those input matrices. 
% Just be aware which parameter you have to use ('pdep' / 'dep')
% 
% Usage:
%   >> p_fdr = fdr_SPARK(pvals, fdrType);
%
% Inputs:
%   pvals   - vector or array of p-values
%   fdrType - ['pdep'|'dep'] Dependency of test statistics. 
%       Independent / positive dependency -> 'pdep' (default)
%       Otherwise -> 'dep'
%
% Outputs:
%   p_fdr    - corrected p-value
% 
% Author: Seonghun Park, Machine Learning Group, Technische Universität Berlin |
% Intelligent Neuroengineering (i-neuro) Lab., Department of Electronic Engineering, Korea University
% 2021 - Based on a function in EEGLAB by Arnaud Delorme from SCCN
%
% Reference: Multiple Testing Corrections (2003) Silicon Genetics 
% 
% Copyright (C) 2022 Seonghun Park, s.park7532@gmail.com


function p_fdr = fdr_SPARK(pvals, fdrType)

if nargin < 2
    fdrType = 'pdep'; 
end
if isempty(pvals), p_fdr = []; return; end

N = length(find(pvals ~= 0));
idx = linspace(N, 1, N)';
cVN = sum(1./(1:N));
[p, origin_idx] = sort(pvals(:), 'descend');
p = p(1:N); origin_idx = origin_idx(1:N);

p_fdr = pvals;
if strcmpi(fdrType, 'pdep')
    p_corrected = p*N./idx; % test statistics are independent, or positively dependent 
else
    p_corrected = p*N./idx*cVN;  % test statistics are arbitrary dependent, or negatively dependent
end

p_fdr(origin_idx) = p_corrected;









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

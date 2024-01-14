I found that the MATLAB internal fdr function (mafdr.m) works badly with input matrix with 2 or more dimensions, or input matrix with zeros (empty element, not p=0).
This function (fdr_SPARK.m) works perfectly with those input matrices. 

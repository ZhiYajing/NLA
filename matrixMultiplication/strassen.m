function C = strassen(A,B,nmin)
% C = Strass(A,B,nmin)
% This computes the matrix-matrix product C = A*B (via the Strassen Method) where
% A is an n-by-n matrix, B is a n-by-n matrix and n is a power of two. Conventional
% matrix multiplication is used if n<nmin where nmin is a positive integer.
[n n] = size(A);
if n <= nmin
    C=simple(A,B,n);
   % C = A*B;
else
    m = n/2; u = 1:m; v = m+1:n;
    P1 = strassen(A(u,u)+A(v,v),B(u,u)+B(v,v),nmin);
    P2 = strassen(A(v,u)+A(v,v),B(u,u),nmin);
    P3 = strassen(A(u,u),B(u,v)-B(v,v),nmin);
    P4 = strassen(A(v,v),B(v,u)-B(u,u),nmin);
    P5 = strassen(A(u,u)+A(u,v),B(v,v),nmin);
    P6 = strassen(A(v,u)-A(u,u),B(u,u) + B(u,v),nmin);
    P7 = strassen(A(u,v)-A(v,v),B(v,u)+B(v,v),nmin);
    C = [ P1+P4-P5+P7 P3+P5; P2+P4 P1+P3-P2+P6];
end
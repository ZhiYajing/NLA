nmin=8;
a=512;
A=rand(a);
B=rand(a);

tic;D=simple(A,B,a); toc
tic;C1=strassen(A,B,1);toc
tic;C2=strassen(A,B,2);toc
tic;C3=strassen(A,B,4);toc
tic;C4=strassen(A,B,8);toc
tic;C5=strassen(A,B,16);toc
tic;C6=strassen(A,B,32);toc
tic;C7=strassen(A,B,64);toc
tic;C8=strassen(A,B,128);toc
tic;C8=strassen(A,B,256);toc

tic;
A*B;
toc

tic;
for i=1:a
    for j=1:a
        for k=1:a
            E(i,j)=E(i,j)+A(i,k)*B(k,j);
        end;
    end;
end;
toc

tic;E=simple(A,B,a);toc
tic;D=strassen(A,B,nmin);toc

tic;
for i =1:a
    for j=1:a
        F(i,j)=A(i,:)*B(:,j);
    end;
end;
toc;

tic;
for i=1:a
    G(i,:)=A(i,:)*B;
end;
toc;


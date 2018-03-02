function E=simple(A,B,a)
%[a a]=size(A);
E=zeros(a);
for i=1:a
    for j=1:a
        for k=1:a
            E(i,j)=E(i,j)+A(i,k)*B(k,j);
        end;
    end;
end;

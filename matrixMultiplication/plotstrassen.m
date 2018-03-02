% Plots the times taken to compute the matrix multiplication for sizes nxn
%	where n = 1, 2, 4, 8, 16, 32, 64, 128
%	Only plots times of the STRASSEN ALGORITHM
function plotstrassen()
	
	% Allocate memory space
    a=256;
A=rand(a);
B=rand(a);
	j=1;
	format long e;
standardT=zeros(1,8);
strassenT = zeros(1,8);
x = 2.^[1:7];
y=[1:7];
t11=cputime;
simple(A,B,a);
t12=cputime;
standardT(1,:)=t12-t11;
	for i = x(1:end)
		t1 = cputime;
		% Strassen multiplication algorithm
		strassen(A,B,i);
		t2 = cputime;
		strassenT(j) = t2-t1;
		j = j + 1;
    end
    strassenT
    standardT
	figure
	plot (y, strassenT, '-k',y, standardT, '-r')
	legend('Strassen','standard', 'Location','northwest')
	title('Time Plot of Strassen Multiplication Algorithm')

end
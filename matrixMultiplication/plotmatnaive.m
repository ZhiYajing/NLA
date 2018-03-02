% Plots the times taken to compute the matrix multiplication for sizes nxn
%	where n = 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192
%	Only plots times of NAIVE and MATLAB multiplications.
function plotmatnaive()
	
	
	naiveT = zeros(1,5);
	matlabT = zeros(1,5);
    strassenT = zeros(1,5);
	x = 2.^[0:4];
	j = 1;
	format long e;

	for i = x(1:end)
		M1 = rand(i,i);
		M2 = rand(i,i);
        
        h = @() strassen(M1,M2,1);
        g = @() simple(M1,M2,x);
        %f = @() M1*M2;
      	naiveT(j) =timeit(g);
      	%matlabT(j) = timeit(f);
        strassenT(j)=timeit(h);
      	j = j + 1;
    end
    naiveT
    matlabT
    strassenT
    
    figure
    plot (x, naiveT, '-b',x,strassenT,'-g')
    legend('naive','strass', 'Location','northwest')
    title('Time Plot of Naive strassen Multiplications')

end
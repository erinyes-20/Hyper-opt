
function [f, gf, x_true, A, b] = simple_quad(n, is_ones)
    % is_ones parameter tests whether we want true solution of all ones or random vector
    % simple quadratic function to eval optim methods
    
    B = rand(n,n);
    %get a random symmetric matrix
    B = 0.5*(B + B');
    [V,D] = eig(B);
    %make its n eigs > 0 by picking from uniform pd [1,n^2]
    Dp = randi(n^2,n,1);
    A = V * diag(Dp) * V';

    if ~is_ones 
        %prepare a col vector b for use in the quadratic functional
        b = rand(n,1);        
        %get the true soln
        x_true = A\b;
    else 
        x_true = ones(n,1);
        b = A*x_true;
    end
    
    gf = @(x) A * x - b;
    f = @(x) 0.5 * x' * A * x - b' * x;
     
end






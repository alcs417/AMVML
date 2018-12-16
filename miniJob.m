function [S] = miniJob(viewWeight, mvMatrix, F, lambda)

    num = size(mvMatrix{1}, 1);
    viewNum = size(viewWeight, 2);
    
    S = zeros(num); % S is the optimal matrix to be learned         
    distd = L2_distance_1(F', F');
    for i = 1:num
        a0 = zeros(1, num);
        for v = 1:viewNum
            temp = mvMatrix{v};
            a0 = a0 + viewWeight(1, v) * temp(i, :);
        end
           
        idxa0 = find(a0 > 0);
        % idxa0 = 1:num;
        ai = a0(idxa0);
        di = distd(i, idxa0);         
        ad = (ai - 0.5 * lambda * di) / sum(viewWeight);
        S(i, idxa0) = EProjSimplex(ad);
    end
       
end


   
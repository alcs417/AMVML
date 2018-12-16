function [F] = MultiViewPrediction(AM, AD, Y)
% AD£ºthe multi-view disease-disease similarity matrix
% AM: the multi-view miRNA-miRNA similarity matrix
% Y : the ground truth (the known miRNA-disease associations)
% F : the result predicted by our method

    AMview = size(AM, 2);
    ADview = size(AD, 2);
    
    AMweight = 1 / AMview * ones(1, AMview);
    ADweight = 1 / ADview * ones(1, ADview);
    
    alpha = 0.0001;  
    beta = 0.0001;
    gamma = 1;

    NITER = 15;
    thresh = 10^-12;      % Iterative terminating condition
       
    for iter = 1:NITER
        
        % update SM, SD and F;
        [SM, SD, F] = alternativeUpdate(AMweight, AM, ADweight, AD, Y, ...
                            alpha, beta, gamma);
        
        % update view weights and calculate obj;
        obj = 0;
        for v = 1:AMview
            curValue = norm(SM - AM{v}, 'fro');
            AMweight(1, v) = 0.5 / curValue;
            obj = obj + curValue;
        end
        
        for v = 1:ADview
            curValue = norm(SD - AD{v}, 'fro');
            ADweight(1, v) = 0.5 / curValue;
            obj = obj + curValue;
        end
        
        obj = obj + norm(F - Y, 'fro');
        Obj(iter) = obj;
        
        if(iter > 1 && abs(Obj(iter - 1) - Obj(iter)) < thresh)
            fprintf('Iteration stops at %d step.\n', iter);
            break;
        end
    end

end


   
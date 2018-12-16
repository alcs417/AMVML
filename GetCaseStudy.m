function [F] = GetCaseStudy(AM, AD, Y)
    
    % compute the Gaussian Interaction Profile
    [KD, KM] = GaussianKernel(Y', 1, 1);
        
    KM(logical(eye(size(KM)))) = 0;
    KD(logical(eye(size(KD)))) = 0;
    AM(size(AM, 2) + 1) = {KM};
    AD(size(AD, 2) + 1) = {KD};
        
    F = MultiViewPrediction(AM, AD, Y);
    
end
function [SM, SD, F] = alternativeUpdate(AMweight, AM, ADweight, AD, Y, ...
                                 alpha, beta, gamma)

    NITER = 50;
    thresh = 10^-10;
    
    F_old = Y;
%     F = zeros(size(Y));
    F = Y;
    SM = zeros(size(AM{1}));
    SD = zeros(size(AD{1}));
    
    for iter = 1:NITER
        
        SM = miniJob(AMweight, AM, F, alpha);
        SD = miniJob(ADweight, AD, F', beta);
        
        % fix SM and SD, update F
        SM0 = SM - diag(diag(SM));
        SM1 = (SM0 + SM0') / 2; % in case the similarity matrix is not symmetric
        DM = diag(sum(SM1));
%         LSM = DM - SM1;
        idM = eye(size(SM1, 1));
        SM2 = diag(1 ./ diag(sqrtm(DM)));
        LSM = idM - SM2 * SM1 * SM2;
        
        SD0 = SD - diag(diag(SD));
        SD1 = (SD0 + SD0') / 2; % in case the similarity matrix is not symmetric
        DD = diag(sum(SD1));
%         LSM = DM - SM1;
        idD = eye(size(SD1, 1));
        SD2 = diag(1 ./ diag(sqrtm(DD)));
        LSD = idD - SD2 * SD1 * SD2;
        
        F = sylvester(2 * alpha * LSM + gamma * idM, 2 * beta * LSD, gamma * Y);
        
        diff = abs(sum(sum(abs(F) - abs(F_old))));
        if diff < thresh
            break;
        end
        
        F_old = F;
        
    end


end
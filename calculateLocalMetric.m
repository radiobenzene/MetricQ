% Function to calculate local metric for each patch
% Input:
%   patch - specific patch taken from an image
% Output:
%   coherence - local metric based on eigenanalysis
function Q_metric = calculateLocalMetric(patch)
    % Calculating gradient for each patch
    [gx, gy] = gradient(patch);
    gx = gx(:);
    gy = gy(:);
    G = [gx, gy];
    
    % Calculating SVD values here
    svd_value = svd(G);
    s1 = svd_value(1);
    s2 = svd_value(2);

    % Specifying epsilon value
    epsilon_value = 0.00000005;
    
    R = (s1 - s2) / (s1 + s2 + epsilon_value);

    Q_metric = s1 * R;
end

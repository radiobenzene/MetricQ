% Function to calculate local coherence for each patch here
% Input:
%   patch - specific patch taken from an image
% Output:
%   coherence - local coherence based on eigenanalysis
function coherence = calculateLocalCoherence(patch)
    % Calculating gradient here
    [gx, gy] = gradient(patch);

    gx = gx(:);
    gy = gy(:);
    G = [gx, gy];
    
    % Calculating SVD values
    svd_value = svd(G' * G);

    % Specifying epsilon value
    epsilon_val = 0.0000000005;
    
    s1 = svd_value(1);
    s2 = svd_value(2);

    R = (s1 - s2) / (s1 + s2 + epsilon_val);

    coherence = R;
end

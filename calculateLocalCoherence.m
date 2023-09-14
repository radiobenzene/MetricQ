% Function to calculate local coherence for each patch here
function coherence = calculateLocalCoherence(patch)
    % Calculating gradient here
    [gx, gy] = gradient(patch);
    gx = gx(:);
    gy = gy(:);
    G = [gx, gy];
    
    %Calculating SVD values
    svd_value = svd(G' * G);
    s1 = svd_value(1);
    s2 = svd_value(2);

    R = (s1 - s2) / (s1 + s2);

    coherence = R;
end
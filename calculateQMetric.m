% Function to calculate metric Q
% Input:
%   img - input image
%   delta - input delta value
% Output:
%   Q_metric - Metric Q value
function Q_metric = calculateQMetric(img, delta)
    % Initializing patch size as 8 * 8
    patchSize = [8 8];

    % Calculating dimensiosn of the image
    [H, W] = size(img);
    changed = [H W];

    % Converting image to double
    img = im2double(img);
    
    num_chunks = changed ./ patchSize;
    
    rows = patchSize(1) * ones(num_chunks(1), 1);
    cols = patchSize(2)* ones(num_chunks(2), 1);
    
    % Dividing image into patches
    patches = mat2cell(img, rows, cols);
    
    % Initializing local coherence
    local_coherence = zeros(size(patches));
    
    % Generating threshold based on formula
    threshold = getThreshold(delta, patchSize(1));
    
    % Calculating local coherence based on formula
    for i = 1:numel(patches)
        local_coherence(i) = calculateLocalCoherence(patches{i});
    end
    
    % Defining type of patches - anisotropic or isotropic
    anisotropic_patches = (local_coherence > threshold);
    
    % Initializing local metric for each patch
    local_metric = zeros(size(anisotropic_patches));
    
    % Calculating local metric for each patch
    for i = 1:numel(anisotropic_patches)
        if (anisotropic_patches(i) == 1)
            local_metric(i) = calculateLocalMetric(patches{i});
        end
    end
    
    summed_value = sum(local_metric);
    
    Q_metric = sum(summed_value);
    Q_metric = Q_metric / numel(summed_value);
    
end
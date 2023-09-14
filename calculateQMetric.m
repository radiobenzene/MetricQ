function Q_metric = calculateQMetric(img, delta)
    patchSize = [8 8];
    [H, W] = size(img);
    changed = [H W];
    img = im2double(img);
    
    num_chunks = changed ./ patchSize;
    
    rows = patchSize(1) * ones(num_chunks(1), 1);
    cols = patchSize(2)* ones(num_chunks(2), 1);
    
    patches = mat2cell(img, rows, cols);
    
    local_coherence = zeros(size(patches));
    
    % Generate threshold based on formula
    threshold = getThreshold(delta, patchSize(1));
    
    % Generate the local coherence values for each patch
    for i = 1:numel(patches)
        local_coherence(i) = calculateLocalCoherence(patches{i});
    end
    
    % Calculating 'anisotropic' patches here
    anisotropic_patches = (local_coherence > threshold);
    
    % Calculating the local metric for each anisotropic patch
    local_metric = zeros(size(anisotropic_patches));
    
    for i = 1:numel(anisotropic_patches)
        if (anisotropic_patches(i) == 1)
            local_metric(i) = calculateLocalMetric(patches{i});
        end
    end
    
    matrix = sparse(local_metric); 
    summed_value = sum(local_metric);
    
    Q_metric = sum(summed_value);
    Q_metric = Q_metric / numel(summed_value);
    
end
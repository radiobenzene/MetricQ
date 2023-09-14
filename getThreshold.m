% Function to calculate threshold tau
function tau = getThreshold(delta, N)
    power_val = (N ^ 2) - 1;
    k_val = nthroot(delta, power_val);

    numerator = sqrt(1 - k_val);
    denominator = sqrt(k_val + 1);

    tau = numerator / denominator;
    
end
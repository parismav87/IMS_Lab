function [weights] = weight_extraction(candidate_histogram, target_histogram, pixel_bins)
    weights = zeros(size(pixel_bins,1),size(pixel_bins,2));

    for i = 1:1:size(pixel_bins,1)
        for j = 1:1:size(pixel_bins,2)
            weights(i,j) = target_histogram(pixel_bins(i,j,1), pixel_bins(i,j,2)) / candidate_histogram(pixel_bins(i,j,1), pixel_bins(i,j,2));
        end
    end
  
    weights(isnan(weights)) = 0;
    weights(isinf(weights)) = 0;
end


function classify_and_show(model, category, image)
% Loads an image from a given category and classifies it using the provided
% model. Then it shows the image with a green/red frame depending on whether
% the class has been correctly inferred or not.
    im = imread(['data/caltech-101/101_ObjectCategories/', category, '/', image]);
    
    %% Standarize image
    im = im2single(im) ;
    if size(im,1) > 480, im = imresize(im, [480 NaN]) ; end
    
    %% Classify
    
    category_ = model.classify(model, im);
    
    %% Show with an adequate frame
    imshow(im)
    color = 'rg';
    color = color(1 + strcmp(category, category_));
    rectangle('Position', [1, 1, size(im, 2), size(im, 1)], 'EdgeColor', color, 'LineWidth', 4)
    tl = title(['Real: ', category, ', inferred: ', category_]);
    set(tl, 'interpreter', 'none')
end
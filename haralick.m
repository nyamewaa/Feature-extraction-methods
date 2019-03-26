function feat = haralick (window)
glcms = graycomatrix(window);
stats = graycoprops(glcms);
feat=struct2array(stats);

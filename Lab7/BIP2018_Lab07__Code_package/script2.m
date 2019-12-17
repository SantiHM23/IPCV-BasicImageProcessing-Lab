I = imread('input/cat.png');
I = mat2gray(I);

h = {'average', 'gaussian', 'motion'};
n = {    'off',    'white',   'pink'};
r = {       89,        369,      649};
c = {      391,        671,      951};

M = imread('script2.png');
M = mat2gray(M);
M(r{1}:r{1}+255, 58:58+255) = I;

% inverse filter
for a = 1:3
    for b=1:3
        [yy, hh, nn] = degradation(I, h{a}, n{b});
        if b == 1 && a==3
            % dampening the very hughe ringing artefact. The center is the
            % sum of the surrounding elements
            hh(4,6) = 0;
            hh(4,6) = sum(hh(:));
            hh = hh / sum(hh(:));
        end
        xx_tilde = restoration(yy, hh, 'inverse');
        
        M(r{b}:r{b}+255,  c{a}:c{a}+255) = yy;
        M(r{b}:r{b}+255,  c{a}+892:c{a}+892+255) = xx_tilde;
    end
end
figure(2); imshow(M); title('Inverse filter results');


% CLS filter
for a = 1:3
    for b=1:3
        [yy, hh, nn] = degradation(I, h{a}, n{b});
        alpha = 0.03;
        cc = -ones(3); cc(2,2)=5; cc=cc/sum(cc(:));
        if b == 1 && a==3
            % dampening the very hughe ringing artefact. The center is the
            % sum of the surrounding elements
            hh(4,6) = 0;
            hh(4,6) = sum(hh(:));
            hh = hh / sum(hh(:));
        end
        xx_tilde = restoration(yy, hh, 'CLS', alpha, cc);
        
        M(r{b}:r{b}+255,  c{a}:c{a}+255) = yy;
        M(r{b}:r{b}+255,  c{a}+892:c{a}+892+255) = xx_tilde;
    end
end
figure(3); imshow(M); title('CLS filter results');
% Wiener filter
for a = 1:3
    for b=1:3
        [yy, hh, nn] = degradation(I, h{a}, n{b});
        if b == 1 && a==3
            % dampening the very hughe ringing artefact. The center is the
            % sum of the surrounding elements
            hh(4,6) = 0;
            hh(4,6) = sum(hh(:));
            hh = hh / sum(hh(:));
        end
        xx_tilde = restoration(yy, hh, 'wiener', nn);
        
        M(r{b}:r{b}+255,  c{a}:c{a}+255) = yy;
        M(r{b}:r{b}+255,  c{a}+892:c{a}+892+255) = xx_tilde;
    end
end
figure(4); imshow(M); title('Wiener filter results');
% Wiener filter assuming white noise
for a = 1:3
    for b=1:3
        [yy, hh, nn] = degradation(I, h{a}, n{b});
        var_noise = var(nn(:));
        if b == 1 && a==3
            % dampening the very hughe ringing artefact. The center is the
            % sum of the surrounding elements
            hh(4,6) = 0;
            hh(4,6) = sum(hh(:));
            hh = hh / sum(hh(:));
        end
        xx_tilde = restoration(yy, hh, 'wiener-white', var_noise);
        
        M(r{b}:r{b}+255,  c{a}:c{a}+255) = yy;
        M(r{b}:r{b}+255,  c{a}+892:c{a}+892+255) = xx_tilde;
    end
end
figure(5); imshow(M); title('Wiener filter results assuming white noise');
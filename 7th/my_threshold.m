function level = my_threshold(img, type)
% Find Threshold 
% img       : GrayScale Image     dimension (height x width)
% type      : kinds of threshold  {'within', 'between'}
% thres_img : threshold image     dimension (height x width)
% level     : threshold value     type( uint8 )
[pdf, cdf] = my_histogram(img);

if strcmp(type, 'within')
    % Within variance
    level = 0;
    qw = inf;
    for k=0:254
        q1 = cdf(k+1);
        q2 = 1-q1;
        m1 = sum((0:k).*pdf(1:k+1))/q1;
        m2 = sum((k+1:255).*pdf(k+2:256))/q2;
        v1 = sum((0:k).^2.*pdf(1:k+1))/q1- m1^2;
        v2 = sum((k+1:255).^2.*pdf(k+2:256))/q2- m2^2;
        q = q1*v1+q2*v2;
        if qw > q
            qw = q;
            level = k;
        end
    end
else
    % Between variance
    level = 0;
    qb = 0;
    for k=0:254
        q1 = cdf(k+1);
        q2 = 1-q1;
        m1 = sum((0:k).*pdf(1:k+1))/q1;
        m2 = sum((k+1:255).*pdf(k+2:256))/q2;
        mg = q1*m1+q2*m2;
        q = q1*(m1-mg)^2+q2*(m2-mg)^2;
        if qb < q
            qb = q;
            level = k;
        end
    end
end
thres_img = uint8(img > level)*255;
end

function pnts = fingertips(im,n,cent)
pnts = zeros(n,2);
for i=1:n
    [r, c] = find(bwlabel(im)==i);
    mx = 0;   
    for j=1:size(r)
    d = ( r(j) - cent(1) ) * ( r(j)-cent(1) ) + ( c(j)-cent(2) ) * ( c(j)-cent(2) );
    if d > mx        
        mx = d;
       pnts(i,:)= [r(j) c(j)];
    end    
    end
    
end
end
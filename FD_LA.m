maxIteration = 100;
mx = 20;
ny = 20;
V = zeros(mx,ny);
for index = 1:maxIteration
    for i =1:mx
        for j=1:ny
            if j == 1
                V(:,j)=1;       %left
            elseif j == ny
                V(:,j)=1;       % right
            elseif i == 1
                V(i,j) = 0;   %top
            elseif i == mx
                V(i,j) = 0;   %bottom
            else
                V(i,j) = (V(i,j-1)+V(i,j+1)+V(i+1,j)+V(i-1,j))/4;
            end 
        end
    end
    
    figure(1)
    surf(V);
    pause(0.01);
    grid on;
    
    [Ex,Ey] = gradient(V);
    figure(2)
    surf(Ex);
    
    figure(3)
    surf(Ey);
    
    figure(4)
    quiver(Ex,Ey);
    
    B = imboxfilt(V,3);
    figure (5)
    surf(B);

end


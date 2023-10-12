function maxx = maxfinder(A)
    maxx = A;
    while(length(maxx) > 1)
        maxx = max(maxx);
    end
end
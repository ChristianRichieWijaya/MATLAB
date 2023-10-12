function minn = minfinder(A)
    minn = A;
    while(length(minn) > 1)
        minn = min(minn);
    end
end
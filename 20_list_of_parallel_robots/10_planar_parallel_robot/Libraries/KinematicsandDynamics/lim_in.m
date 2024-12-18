function out = lim_in(in, in_prev, lim_in_max)

    n=length(in);
    delta_in = in-in_prev;
    out_ = zeros(n,1);
    for i=1:n
        if abs(delta_in(i)) > lim_in_max
            out_(i) = in_prev(i) + lim_in_max*sign(delta_in(i));
        else
            out_(i) = in_prev(i) + delta_in(i);
        end
    end
    out=out_;
end


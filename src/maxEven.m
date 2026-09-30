function max_even = maxEven(vals)
    % MAXEVEN Return the maximum even number in an array
    %   Takes the input array, filters out odd values and returns the maximum
    arguments (Input)
        vals
    end

    arguments (Output)
        max_even
    end

    even_vals = vals(mod(vals, 2) == 0);
    max_even = max(even_vals);
end

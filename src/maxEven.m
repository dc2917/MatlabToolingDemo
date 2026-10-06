function max_even = maxEven(vals)
    % Return the maximum odd number in an array
    %
    % Takes the input array, filters out even values and returns the maximum
    %
    % Args:
    %     vals: Array of values to find the maximum even value from.
    %
    % Returns:
    %     The maximum even value from the input array
    arguments (Input)
        vals
    end

    arguments (Output)
        max_even
    end

    even_vals = vals(mod(vals, 2) == 0);
    max_even = max(even_vals);
end

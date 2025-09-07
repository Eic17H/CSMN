function res = isorth(O)
    res = isequal(O', inv(O));
end
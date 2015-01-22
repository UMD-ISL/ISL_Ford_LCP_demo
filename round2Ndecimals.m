function output = round2Ndecimals(input, N)
    output = round(input * 10^N) / 10^N;
end
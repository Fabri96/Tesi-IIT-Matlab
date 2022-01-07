% Entropy: Returns entropy (in bits) of each column of 'X'
% by Will Dwinnell
%
% H = Entropy(X)
%
% H = row vector of calculated entropies (in bits)
% X = data to be analyzed
%
% Example: Measure sample entropy of observations of variables with
%   1, 2, 3 and 4 bits of entropy.
%
% Note: Estimated entropy values are slightly less than true, due to
% finite sample size.
%
% X = ceil(repmat([2 4 8 16],[1e3,1]) .* rand(1e3,4));
% Entropy(X)
%
% Last modified: Nov-12-2006

function H = Entropy(X)

% Establish size of data



% Housekeeping


    % Assemble observed alphabet
    Alphabet = unique(X(:));
	
    % Housekeeping
    Frequency = zeros(length(Alphabet),1);
	
    % Calculate sample frequencies
    for symbol = 1:length(Alphabet)
        Frequency(symbol) = sum(abs(Alphabet(symbol)-X)<0.1);
    end
	
    % Calculate sample class probabilities
    P = Frequency / sum(Frequency);
	
    % Calculate entropy in bits
    % Note: floating point underflow is never an issue since we are
    %   dealing only with the observed alphabet
    H = -sum(P .* log2(P));
end


% God bless Claude Shannon.

% EOF



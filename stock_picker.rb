
def stock_picker(prices)
    tracker = prices.reduce({low: prices[0], high: 0, delta: 0, index: 0, temp_low_index: 0, low_index: 0, high_index: 0}) do |track, price|
        if price <= track[:low]
            %% Start over %
            track[:low] = price
            track[:high] = price
            track[:temp_low_index] = track[:index]
        end
        if price > track[:high]
            track[:high] = price
            if track[:high] - track[:low] > track[:delta]
                %% Set new delta %
                track[:delta] = track[:high] - track[:low]
                track[:high_index] = track[:index]
                track[:low_index] = track[:temp_low_index]
            end
        end
        track[:index] += 1
        track
    end
    [tracker[:low_index], tracker[:high_index]]
end

high_low = stock_picker([50, 10, 4, 5, 7, 9, 3, 20, 1])
p high_low
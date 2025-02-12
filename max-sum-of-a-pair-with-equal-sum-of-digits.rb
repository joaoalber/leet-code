# @param {Integer[]} nums
# @return {Integer}
def maximum_sum(nums)
    digit_sums = {}

    # O(n log m)
    nums.each do |n|
        # O(log m) - divides per 10 each time to get a digit
        key = n.digits.sum

        if digit_sums[key]
            digit_sums[key] << n     
        else
            digit_sums[key] = [n]
        end
    end

    # O(n)
    matchings = digit_sums.map do |_k, v|
        if v.size > 1
            v.max(2).sum
        end
    end.compact

    matchings.empty? ? -1 : matchings.max
end

# O(2n log m) == O(n log m)

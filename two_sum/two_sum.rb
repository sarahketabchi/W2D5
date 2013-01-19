class Array
  def two_sum
    two_sums = []

    count.times do |i1|
      count.times do |i2|
        next if i1 >= i2

        two_sums << [self[i1], self[i2]] if self[i1] == -self[i2]
      end
    end

    two_sums
  end
end
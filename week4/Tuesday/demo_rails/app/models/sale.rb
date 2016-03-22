class Sale

  class << self
    def this_month
      [2,3,45,56,7,123,13533,4367657,2,6,7,8,32543,353456,1].sort.reverse
    end

    def max
      this_month.max
    end

    def min
      this_month.min
    end

    def average
      total/length
    end

    def total
      this_month.inject(:+)
    end

    def length
      this_month.length.to_f
    end
  end

end

# frozen_string_literal: true

module Nmax
  class Arr
    attr_reader :numbers

    def initialize
      @numbers = []
    end

    def find_max_numbers(num)
      return 'No numbers present in current stream.' if numbers.empty?

      numbers.uniq!.sort.last(num)
    end
  end
end

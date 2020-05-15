# frozen_string_literal: true

require 'nmax/arr'
require 'nmax/version'

module Nmax
  class App
    def initialize(io, arg)
      @io = io
      @arg = arg.to_i
      @arr = Arr.new
    end

    def call
      return "Can't read from current stream." if io.tty?
      if arg.zero?
        return 'Specified nmax parameter via: cat data.txt | nmax 100'
      end

      io.each_line do |line|
        line.scan(/\d{1,1000}/m) { |digit| arr.numbers << digit.to_i }
      end

      arr.find_max_numbers(arg)
    end

    private

    attr_reader :io, :arg, :arr
  end
end

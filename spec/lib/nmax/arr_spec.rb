# frozen_string_literal: true

RSpec.describe Nmax::Arr do
  describe 'Nmax::Arr is initialized' do
    subject { described_class }

    it { is_expected.to respond_to(:new) }
  end

  describe '.new' do
    subject(:arr) { described_class.new }

    it { is_expected.to be_an_instance_of(described_class) }

    it 'Should create an empty array' do
      expect(subject.numbers).to eq([])
    end
  end

  describe '#find_max_numbers' do
    let(:arg) { 3 }
    let(:instance) { described_class.new }

    it 'should return last 3 el of array' do
      instance.numbers << 1
      5.times { |i| instance.numbers << i }

      expect(instance.find_max_numbers(arg)).to match_array([2, 3, 4])
    end
  end
end

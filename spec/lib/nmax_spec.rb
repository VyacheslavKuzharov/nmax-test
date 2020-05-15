# frozen_string_literal: true

RSpec.describe Nmax::App do
  it 'has a version number' do
    expect(Nmax::VERSION).not_to be nil
  end

  describe 'Nmax::App is initialized' do
    subject { described_class }

    it { is_expected.to respond_to(:new) }
  end

  describe '.new' do
    subject(:result) { described_class.new(io, arg) }

    let(:io) { nil }
    let(:arg) { nil }

    it { is_expected.to be_an_instance_of(described_class) }

    it 'Should create an Arr' do
      expect(Nmax::Arr).to receive(:new)
      subject
    end
  end

  describe 'instance' do
    subject { described_class.new(io, arg) }

    let(:io) { nil }
    let(:arg) { nil }

    it { is_expected.to respond_to(:call) }
  end

  describe '#call' do
    let(:arg) { 2 }
    let(:instance) { described_class.new(io, arg) }
    subject { instance.call }

    context 'io is blank' do
      let(:io) { STDIN }

      it 'should return an error' do
        expect(subject).to match("Can't read from current stream.")
      end
    end

    context 'arg is blank' do
      let(:io) { StringIO.new('test') }
      let(:arg) { nil }

      it 'should return an error' do
        expect(subject).to match('Specified nmax parameter via: cat data.txt | nmax 100')
      end
    end

    context 'happy path' do
      let(:io) { StringIO.new('session,1,1,Firefox 12,118,2017-02-27') }
      let(:arg) { 3 }

      it 'should return an error' do
        expect(subject).to match_array([27, 118, 2017])
      end
    end
  end
end

# frozen_string_literal: true

require 'spec_helper'

describe Ocman::Permission do
  describe '.new' do
    it 'raises an ArgumentError when no permissions are passed' do
      expect { described_class.new([]) }.to raise_error(ArgumentError)
    end

    it 'defaults to :all' do
      expect(described_class.new.to_i).to eq(31)
    end

    it 'creates the correct permission integer from passed arguments' do # rubocop:disable RSpec/ExampleLength
      aggregate_failures do
        expect(described_class.new([:read]).to_i).to eq(1)
        expect(described_class.new([:read, :delete, :share]).to_i).to eq(25)
        expect(described_class.new([:create, :share, :all]).to_i).to eq(31)
        expect(described_class.new([:all]).to_i).to eq(31)
      end
    end
  end

  describe '.read' do
    subject { described_class.read.to_i }

    it { is_expected.to eq(1) }
  end

  describe '.update' do
    subject { described_class.update.to_i }

    it { is_expected.to eq(2) }
  end

  describe '.create' do
    subject { described_class.create.to_i }

    it { is_expected.to eq(4) }
  end

  describe '.delete' do
    subject { described_class.delete.to_i }

    it { is_expected.to eq(8) }
  end

  describe '.share' do
    subject { described_class.share.to_i }

    it { is_expected.to eq(16) }
  end

  describe '.all' do
    subject { described_class.all.to_i }

    it { is_expected.to eq(31) }
  end

  describe '+' do
    it 'adds permissions correctly' do
      aggregate_failures do
        expect((described_class.create + described_class.delete).to_i).to eq(12)
        expect((described_class.new([:delete, :update]) + described_class.all).to_i).to eq(31)
        expect((described_class.new([:read, :update]) + described_class.new([:read, :delete])).to_i).to eq(11)
      end
    end
  end

  describe '-' do
    it 'adds permissions correctly' do
      aggregate_failures do
        expect((described_class.all - described_class.delete).to_i).to eq(23)
        expect((described_class.new([:read, :update]) - described_class.new([:read, :create, :delete])).to_i).to eq(2)
      end
    end
  end
end

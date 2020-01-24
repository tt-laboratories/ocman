# frozen_string_literal: true

require 'spec_helper'

describe Ocman::Folder do
  let(:dav) { instance_double(Ocman::Dav, mkdir: true, ls: true) }

  before do
    allow(Ocman::Dav).to receive(:new).and_return(dav)
  end

  describe '.create' do
    it 'creates the folder via Ocman::Dav' do
      Ocman::Folder.create('/foobar')
      expect(dav).to have_received(:mkdir).with('/foobar')
    end
  end

  describe '.list' do
    let(:path) { '/foobar' }
    let(:options) { { recursive: true } }

    it 'calls ls on Ocman::Dav' do
      Ocman::Folder.list(path)
      expect(dav).to have_received(:ls).with(path, {})
    end

    it 'gives options to Ocman::Dav' do
      Ocman::Folder.list(path, options)
      expect(dav).to have_received(:ls).with(path, options)
    end
  end
end

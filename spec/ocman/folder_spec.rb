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

  describe '.create_recursive' do
    before do
      allow(Ocman::Folder).to receive(:wait_for_folder).and_return(true)
      allow(Ocman::Folder).to receive(:list).with('foo').and_return(true)
      allow(Ocman::Folder).to receive(:list).with('foo/bar').and_return(false)
    end

    it 'creates subfolder first' do
      allow(Ocman::Folder).to receive(:list).and_return(false)
      Ocman::Folder.create_recursive('foo/bar')
      expect(dav).to have_received(:mkdir).with('foo')
    end

    it 'skips subfolder if it exists' do
      Ocman::Folder.create_recursive('foo/bar')
      expect(dav).not_to have_received(:mkdir).with('foo')
    end

    it 'creates target folder' do
      Ocman::Folder.create_recursive('foo/bar')
      expect(dav).to have_received(:mkdir).with('foo/bar')
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

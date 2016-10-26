require 'spec_helper'

describe Ocman::Folder do
  describe :create_folder do
    it 'should call mkdir on foo' do
      expect_any_instance_of(Ocman::Dav).to receive(:mkdir).and_return(true)
      Ocman::Folder.create('/foobar')
    end
  end

  describe :list do
    let(:path) { '/foobar' }
    let(:options) { { recursive: true }}
    it 'should call ls on Ocman::Dav' do
      expect_any_instance_of(Ocman::Dav).to receive(:ls).with(path, {}).and_return(true)
      Ocman::Folder.list(path)
    end

    it 'should give options to Ocman::Dav' do
      expect_any_instance_of(Ocman::Dav).to receive(:ls).with(path, options).and_return(true)
      Ocman::Folder.list(path, options)
    end
  end
end

require 'spec_helper'

describe Ocman::Folder do
  describe :create_folder do
    it 'should call mkdir on foo' do
      expect_any_instance_of(Ocman::Dav).to receive(:mkdir).and_return(true)
      Ocman::Folder.create_folder('/foobar')
    end
  end

  describe :list do
    it 'should call ls on Ocman::Dav' do
      expect_any_instance_of(Ocman::Dav).to receive(:ls).and_return(true)
      Ocman::Folder.list('/foobar')
    end
  end
end

require "spec_helper"

describe Reader do
  describe 'Techcrunch' do
    let(:techcrunch) do
      Reader::Techcrunch('http://techcrunch.com/2012/12/23/internet-silence-speaks-louder-than-words/')
    end

    it 'has the right class name' do
      techcrunch.class.should eql Reader::Techcrunch
    end

    it 'has a title' do
      techcrunch.title.should eql "Internet Silence Speaks Louder Than\u00A0Words"
    end

    it 'has a text body' do
      techcrunch.body.should include "Major websites around the web blacked out"
      techcrunch.body.should include "a holiday break and subsequent chaos of a new Congress."
    end
  end
end
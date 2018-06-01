require 'rails_helper'

RSpec.describe Page, :type => :model do
  describe 'Callbacks' do 
  	it "expects to set content attribute before save" do 
  		subject = Page.new(url: 'http://www.example.com')
      subject.send(:url_accessible?)
  		subject.save
  		expect(subject.reload.content).not_to be_nil
  	end
  end

  describe "Attributes" do 
  	it { is_expected.to have_attribute :url }
  	it { is_expected.to have_attribute :content }
  end

  describe 'Validations' do 
  	it { is_expected.to validate_presence_of(:url) }
  	it "expects url is not valid or accesible" do 
  		subject = Page.new(url: 'htttp://www.badurl.com')
      subject.send(:url_accessible?)
  		expect(subject.errors.messages[:url][0]).to include "is not valid"
  	end
  end
end

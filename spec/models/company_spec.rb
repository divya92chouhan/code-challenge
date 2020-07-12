require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:valid_email) { 'codechallenge@getmainstreet.com' }
  let(:invalid_email) { 'codechallenge@test.com' }
  let(:valid_zipcode) { '99571' }

  subject { create(:company) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  context 'when the email address is valid' do
    it 'allows the input' do
      subject.email = valid_email
      expect(subject).to be_valid
    end

    it 'allows nil' do
      subject.email = nil
      expect(subject).to be_valid
    end
  end

  context 'when the email address is invalid' do
    it 'not allow the input' do
      subject.email = invalid_email
      expect(subject).not_to be_valid
    end
  end

  context 'when the zip code is valid' do
    it 'allows the input' do
      subject.zip_code = valid_zipcode
      expect(subject).to be_valid
    end

    it 'auto fill city' do
      expect(subject.city).to match('Cold Bay')
    end
    
    it 'auto fill state' do
      expect(subject.state).to match('Alaska')
    end
  end
end

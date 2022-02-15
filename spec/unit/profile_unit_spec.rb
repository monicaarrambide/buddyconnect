require 'rails_helper'


RSpec.describe Post, type: :model do
 subject do
  described_class.new(profileId: 1234578, userID: 12345678, year: 'second year', picture: 'url', contactInfo: 'christinayahoo')
 end


 it 'is valid with valid attributes' do
   expect(subject).to be_valid
 end


 it 'is not valid without a profileid' do
   subject.profileId = nil
   expect(subject).not_to be_valid
 end


 it 'is not valid without a user id' do
   subject.userId = nil
   expect(subject).not_to be_valid
end


 it 'is not valid without a year' do
   subject.year = nil
   expect(subject).not_to be_valid
end


 it 'is not valid without a picture' do
   subject.picture = nil
   expect(subject).not_to be_valid
 end



 it 'is not valid without a contactinfo' do
   subject.contactInfo = nil
   expect(subject).not_to be_valid
 end

  
  
end



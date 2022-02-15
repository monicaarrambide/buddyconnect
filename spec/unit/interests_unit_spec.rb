# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Interest, type: :model do
  subject do
    described_class.new(interestsId: 12345678, userId: 12345678, careerInterest: "sports", hobbies: "football", favMovieGenres: "sports", numberPrereqs: 1, expectations: "none" )

  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a id' do
    subject.interestsId = nil
    expect(subject).not_to be_valid
  end
  it 'is not valid without any interests' do
    subject.careerInterest = nil
    expect(subject).not_to be_valid
  end
  it 'is not valid without a user id' do
    subject.userId = nil
    expect(subject).not_to be_valid
  end
  it 'is not valid without hobbies' do
    subject.hobbies = nil
    expect(subject).not_to be_valid
  end
  it 'is not valid without a movie genres' do
    subject.favMovieGenres = nil
    expect(subject).not_to be_valid
  end
  it 'is not valid without prereqs' do
    subject.numberPrereqs = nil
    expect(subject).not_to be_valid
  end
  it 'is not valid without expectations' do
    subject.expectations = nil
    expect(subject).not_to be_valid
  end
end

#:interestsId, :userId, :careerInterest, :hobbies, :favMovieGenres, :numberPrereqs, :expectations
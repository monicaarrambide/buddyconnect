# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do
    described_class.new(groupId: 12345678, leaderInt: 12345678 )

  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a group id' do
    subject.groupId = nil
    expect(subject).not_to be_valid
  end


end

#:interestsId, :userId, :careerInterest, :hobbies, :favMovieGenres, :numberPrereqs, :expectations 
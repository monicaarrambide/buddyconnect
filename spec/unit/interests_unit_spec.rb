# frozen_string_literal: true

# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe(Interest, type: :model) do
  subject do
    described_class.new(userId: 12_345_678, phone: '12345678',
                        nationality: 'Native American', state: 'Texas', community: 'Rise',
                        numPrereqs: 1, scholarship: 'none', faveMovieGenre: 'Action', potentialRoles: 'leader',
                        numWorkExp: 1, usedTech: 'Rails', projects: 'Canadian wombat photography',
                        extracurric: 'Photography', pastWorkExp: 'Amazon'
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to(be_valid)
  end

  it 'is not valid without a user id' do
    subject.userId = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without a phone #' do
    subject.phone = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without a nationality' do
    subject.nationality = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without state' do
    subject.state = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without a community' do
    subject.community = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without prereqs' do
    subject.numPrereqs = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without scholarship' do
    subject.scholarship = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without movie genre' do
    subject.faveMovieGenre = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without potential roles' do
    subject.potentialRoles = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without work experience amount' do
    subject.numWorkExp = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without used tech' do
    subject.usedTech = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without projects' do
    subject.projects = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without extracurriculars' do
    subject.extracurric = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without past work experience' do
    subject.pastWorkExp = nil
    expect(subject).not_to(be_valid)
  end
end

# :interestsId, :userId, :careerInterest, :hobbies, :favMovieGenres, :numberPrereqs, :expectations

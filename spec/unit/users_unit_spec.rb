# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(User, type: :model) do
  subject do
    described_class.new(studentId: 123_456_789, isOfficer: false, isAdmin: false, fullName: 'Jimbo Fisher', avatarUrl: 'url', tamuEmail: 'jf@tamu.edu', dateOfBirth: '1965-10-09', gradAssistance: false)
  end

  it 'is valid with valid attributes' do
    expect(subject).to(be_valid)
  end

  it 'is not valid without a studentId' do
    subject.studentId = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without isOfficer' do
    subject.isOfficer = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without isAdmin' do
    subject.isAdmin = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without a fullName' do
    subject.fullName = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without a avatarUrl' do
    subject.avatarUrl = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without a tamuEmail' do
    subject.tamuEmail = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without a dateOfBirth' do
    subject.dateOfBirth = nil
    expect(subject).not_to(be_valid)
  end

  it 'is not valid without gradAssistance' do
    subject.gradAssistance = nil
    expect(subject).not_to(be_valid)
  end
end

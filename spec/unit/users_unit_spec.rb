require 'rails_helper'

RSpec.describe User, type: :model do
    subject do
        described_class.new(studentId: 123456789, isOfficer: false, isAdmin: false, firstName: 'Jimbo', lastName: 'Fisher', tamuEmail:'jf@tamu.edu', dateOfBirth: '1965-10-09')
    end

    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end

    it 'is not valid without a studentId' do
        subject.studentId = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without isOfficer' do
        subject.isOfficer = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without isAdmin' do
        subject.isAdmin = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without a firstName' do
        subject.firstName = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without a lastName' do
        subject.lastName = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without a tamuEmail' do
        subject.tamuEmail = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without a dateOfBirth' do
        subject.dateOfBirth = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without gradAssistance' do
        subject.gradAssistance = nil
        expect(subject).not_to be_valid
    end

end
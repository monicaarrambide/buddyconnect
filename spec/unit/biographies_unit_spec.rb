require 'rails_helper'

RSpec.describe Biography, type: :model do
    subject do
        described_class.new(userId: 1, description: "test description")
    end

    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end

    it 'is not valid without a postid' do
        subject.userId = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without a posterid' do
        subject.description = nil
        expect(subject).not_to be_valid
    end

end
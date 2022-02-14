require 'rails_helper'

RSpec.describe Comment, type: :model do
    subject do
        described_class.new(commentId: 2468, postId: 123456789, posterId: 12345, commentDate: '2022-02-02', message: 'What it do')
    end

    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end

    it 'is not valid without a postid' do
        subject.commentId = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without a posterid' do
        subject.posterId = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without a title' do
        subject.postId = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without a body' do
        subject.comment = nil
        expect(subject).not_to be_valid
    end

end
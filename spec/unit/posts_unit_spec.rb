require 'rails_helper'

RSpec.describe Post, type: :model do
    subject do
        described_class.new(postId: 2468, posterId: 123456789, postDate: '2022-02-02', title: 'Hi', body: 'Hello everyone!')
    end

    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end

    it 'is not valid without a postid' do
        subject.postId = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without a posterid' do
        subject.posterId = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without a title' do
        subject.title = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without a body' do
        subject.body = nil
        expect(subject).not_to be_valid
    end

end
        
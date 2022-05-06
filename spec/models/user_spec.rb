require 'rails_helper'

RSpec.describe 'User', type: :model do
  context 'User Model' do
    subject { User.new(name: 'Zeeshan', posts_counter: 0) }
    before { subject.save }

    it 'User does not have errors if name is not nil and post_counter > 0' do
      expect(subject).to be_valid
    end

    it 'Name should not be nil' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'Posts_counter is greater than or equal to 0' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end
  end
end

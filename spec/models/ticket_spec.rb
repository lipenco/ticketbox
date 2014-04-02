require 'spec_helper'

describe Ticket do
  let(:subject) { FactoryGirl.build(:ticket) }

  describe 'attributes' do
    it 'has a date' do
      expect(subject.date).to eq(Date.today)
    end
  end
end

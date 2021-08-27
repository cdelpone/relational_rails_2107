require 'rails_helper'

describe Distillery, type: :model do
  describe 'validations' do
    it { should have_many(:scotches) }
    # it { should validate_presence_of(:name) }
  end

  describe 'instance methods' do
  end
end

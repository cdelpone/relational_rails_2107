require 'rails_helper'

describe Distillery, type: :model do
  describe 'validations' do
    it { should have_many(:scotches) }
  end
end

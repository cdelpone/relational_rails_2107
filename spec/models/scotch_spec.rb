require 'rails_helper'

describe Scotch, type: :model do
  describe 'relationships' do
    it { should belong_to(:distillery) }
  end
end

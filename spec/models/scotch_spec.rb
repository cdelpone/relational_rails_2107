require 'rails_helper'
# rspec spec/models/scotch_spec.rb
describe Scotch, type: :model do
  before :each do
    # @distillery_6 = Distillery.create!({
    #                             name: "Laphroaig",
    #                             established: 1815,
    #                             scotland_location: true,
    #                             updated_at: '2021-08-26 00:06:30 UTC',
    #                             created_at: '2021-08-26 00:06:30 UTC',
    #                             id: 6
    #                             })
    # @distillery_1 = Distillery.create!({
    #                             name: "Ardbeg",
    #                             established: 1815,
    #                             scotland_location: true,
    #                             updated_at: '2021-08-26 01:20:17 UTC',
    #                             created_at: '2021-08-25 16:34:12 UTC',
    #                             id: 1
    #                             })
    @distillery_7 = Distillery.create!({
                                name: "Bowmore",
                                established: 1779,
                                scotland_location: true,
                                updated_at: '2021-08-26 01:11:07 UTC',
                                created_at: '2021-08-26 01:11:07 UTC',
                                id: 7
                                })
    # @scotch_1 = Scotch.create!({
    #                             name: "An OA",
    #                             single_malt: true,
    #                             year: 15,
    #                             updated_at: '2021-08-26 18:00:40 UTC',
    #                             created_at: '2021-08-26 18:00:40 UTC',
    #                             distillery_id: 1,
    #                             id: 1
    #                             })
    @scotch_2 = Scotch.create!({
                                name: "Bowmore 10 yr",
                                single_malt: true,
                                year: 10,
                                updated_at: '2021-08-26 20:10:37 UTC',
                                created_at: '2021-08-26 20:10:37 UTC',
                                distillery_id: 7,
                                id: 2
                                })
    # @scotch_3 = Scotch.create!({
    #                             name: "Bowmore 12 yr",
    #                             single_malt: false,
    #                             year: 12,
    #                             updated_at: '2021-08-26 21:34:25 UTC',
    #                             created_at: '2021-08-26 21:34:25 UTC',
    #                             distillery_id: 7,
    #                             id: 3
    #                             })
  end

  describe 'relationships' do
    it { should belong_to(:distillery) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :single_malt }
    it { should validate_presence_of :year }
  end

  describe 'class methods' do
  end

  describe 'instance methods' do
  end
end

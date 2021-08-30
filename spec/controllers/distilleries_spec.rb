require 'rails_helper'
# rspec spec/controllers/distilleries_spec.rb
RSpec.describe DistilleriesController, type: :controller do
  describe 'routes' do
    describe 'GET #index' do
      # different ways to test routes
      it { should route(:get, '/distilleries').to(action: :index) }
      it { should route(:get, '/distilleries').to(controller: :distilleries, action: :index) }
      it { should route(:get, '/distilleries').to('distilleries#index') }
    end

    it 'routes' do
      expect(get("/")).to route_to("welcome#index")

      expect(get('/distilleries')).to route_to('distilleries#index')
      expect(get('/distilleries/new')).to route_to('distilleries#new')
      expect(post('/distilleries')).to route_to('distilleries#create')
      expect(get('/distilleries/:id')).to route_to('distilleries#show')
      expect(get('/distilleries/:id/edit')).to route_to('distilleries#edit')
      expect(patch('/distilleries/:id')).to route_to('distilleries#update')
      expect(delete('/distilleries/:id')).to route_to('distilleries#destroy')

      expect(get('/distilleries/:distillery_id/scotches')).to route_to('distilleries_scotches#index')
    end

    describe 'GET #show' do
      it { should route(:get, '/distilleries/#{distillery.id}').to(action: :show, id: 'distillery.id') }
    end
  end
  describe 'redirects' do
    before { post :create }
    it { should redirect_to('/distilleries') }
    # before { get :show }
    # it { should redirect_to('/distilleries') }
    # it { should redirect_to(action: :index) }
  end
  describe 'unavailable routes' do
  expect(:delete => "/accounts/37").not_to be_routable
end

# describe 'Routing', type: :routing do
#   it do
#     should route(:get, '/distilleries').
#     to(controller: :distilleries, action: :index)
#   end

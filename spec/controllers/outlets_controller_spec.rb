require 'rails_helper'

RSpec.describe OutletsController do
  describe 'GET outlets/index' do
    let(:params) {
      {
        outlet: {
          type_of_service: ["HAIRCUT"],
          price_range: "RM 50 - 100"
        }
      }
    }
    let!(:outlets) { create(:outlet) }

    it 'shows list of outlets matching search criteria' do
      get :index
      outlet = Outlet.first
      expect(outlet.type_of_service).to include(params[:outlet][:type_of_service].join())
      expect(outlet.price_range).to eq(params[:outlet][:price_range])
    end
  end
end

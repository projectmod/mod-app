require 'rails_helper'

RSpec.describe Merchants::StepsController do
  describe 'GET /merchants/outlets/:outlet_id/steps/outlet_info' do
    let!(:user) { create(:user) }
    let!(:user_outlet) { user.create_outlet(business_registration: "a1b2c3") }
    let(:params) {
      {
        name: Faker::Company.name,
        area: Faker::Address.city,
        address: Faker::Address.street_address,
        phone_number: "+60123323415",
        working_hours_attributes: { "0": { days: "Monday", _destroy: false, time: "9 to 5pm"} }
      }
    }

    it 'saves outlet info to the database' do
      put :update, outlet_id: user.outlet.id, outlet: params, id: 'outlet_info'

      outlet = Outlet.first
      expect(outlet.name).to eq(params[:name])
      expect(outlet.area).to eq(params[:area])
      expect(outlet.address).to eq(params[:address])
      expect(outlet.working_hours.first.days).to eq(params[:working_hours_attributes][:"0"][:days])
      expect(outlet.working_hours.first.time).to eq(params[:working_hours_attributes][:"0"][:time])
    end
  end

  describe 'GET /merchants/outlets/:outlet_id/steps/services' do
    let!(:user) { create(:user) }
    let!(:user_outlet) { user.create_outlet(business_registration: "a1b2c3") }
    let(:params) {
      {
        name: Faker::Company.name,
        area: Faker::Address.city,
        address: Faker::Address.street_address,
        phone_number: "+60123323415",
        working_hours_attributes: { "0": { days: "Monday", _destroy: false, time: "9 to 5pm"} },
        type_of_service: ["HAIRCUT", "BLOWOUT"],
        price_range: "RM 50 - 100"
      }
    }

    it 'saves outlet services and budget to the database' do
      put :update, outlet_id: user.outlet.id, outlet: params, id: 'services'

      outlet = Outlet.first
      expect(outlet.type_of_service).to eq(params[:type_of_service].join(', '))
      expect(outlet.price_range).to eq(params[:price_range])
    end
  end
end

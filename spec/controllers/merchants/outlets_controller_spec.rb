# require 'rails_helper'
#
# RSpec.describe Merchants::OutletsController do
#   describe 'PUT /merchants/outlets/:outlet_id/steps/outlet_info' do
#     let(:password) { Faker::Internet.password }
#     let(:params) {
#       {
#         user: {
#           name: Faker::Company.name,
#           email: Faker::Internet.email,
#           password: password,
#           password_confirmation: password,
#           phone_number: "127167787",
#           business_registration: "Faker1234"
#         }
#       }
#     }
#     let!(:outlets) { create(:outlet, steps: :outlet_info) }
#
#     it 'saves outlet info to the database' do
#       binding.pry
#       put :update, params
#       outlet = Outlet.first
#       expect(outlet.name).to eq(params[:outlet][:name])
#       expect(outlet.area).to eq(params[:outlet][:area])
#       expect(outlet.address).to eq(params[:outlet][:address])
#       # expect(outlet.working_hours).to eq(params[:outlet][:working_hours])
#     end
#   end
# end

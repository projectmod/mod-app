require 'rails_helper'

describe Merchants::UsersController do
  describe 'POST /merchants/users' do
    let(:password) { Faker::Internet.password }
    let(:params) {
      {
        user: {
          name: Faker::Company.name,
          email: Faker::Internet.email,
          password: password,
          password_confirmation: password,
          phone_number: "127167787",
          business_registration: "Faker1234"
        }
      }
    }

    it 'creates a new merchant user' do
      post :create, params
      user = User.first
      expect(user.name).to eq(params[:user][:name])
      expect(user.email).to eq(params[:user][:email])
      expect(user.outlet.business_registration).to eq(params[:user][:business_registration])
      expect(user.role).to eq("merchant")
    end
  end
end

require 'rails_helper'

describe UsersController do
  describe 'POST /users' do
    let(:password) { Faker::Internet.password }
    let(:params) {
      {
        user: {
          name: Faker::Name.name,
          email: Faker::Internet.email,
          password: password,
          password_confirmation: password
        }
      }
    }

    it 'creates a new user' do
      post :create, params
      user = User.first
      expect(user.name).to eq(params[:user][:name])
      expect(user.email).to eq(params[:user][:email])
    end
  end

  describe 'PUT /users/:id/update_phone_number' do
    before(:each) do
      @params = {
        phone_number: "123123123"
      }
      @user = create(:user)

      login_user
    end

    it 'saves user phone number' do
      post :update_phone_number, id: @user.id, user: @params
      user = User.first
      expect(user.phone_number).to eq(@params[:phone_number])
    end
  end

  describe 'POST /users/:id/activate' do
    before(:each) do
      @params = {
        verification_code: "123456"
      }
      @user = create(:user, verification_code: "123456")

      login_user
    end

    it 'activates the user if verification code matches' do
      post :activate, id: @user.id, phone: @params
      user = User.first
      expect(user.verification_code).to eq(@params[:verification_code])
      expect(user.activated).to eq(true)
    end
  end
end

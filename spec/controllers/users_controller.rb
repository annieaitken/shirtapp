require 'rails_helper'

describe UsersController, :type => :controller do

	before do
	# @user = User.create!(email: "annie@annit.com", password: "1234")
	@user = FactoryGirl.create(:user)
	@user2 = User.create!(email: "rory@annit.com", password: "12345")
	end

	describe "GET #show" do


		context "User logged in" do
			before do
			sign_in @user
			end

			it "loads correct details" do
				get :show, id: @user.id
				expect(response).to have_http_status(200)
				expect(assigns.(user:)).to eq @user
			end

		end

		context "User not logged in" do
			it "redirects to login" do
			get :show, id: @user.id
			expect(response).to redirect_to(root_path)


		end

		context "User logs in and tries to access user2 show page" do
			before do
				sign_in @user
			end

			it "trys to access user2 showpage" do
				get :show, is: @user2.id
				expect(response).to redirect_to(root_path)
			end

			it "brings up a HTTP 302 error" do
				get :show, id: @user2.id
				expect(response).to have_http_status(302)
			end
		end

	end
end
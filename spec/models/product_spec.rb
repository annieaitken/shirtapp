require 'rails_helper'

describe Product do 
	context "when a product has comments" do
		before do
			@product = Product.create!(name: "Cut-Out Sweater")
			@user = User.create!(email: "annie@annit.com", password: "password")
			@product.comments.create!(rating: 1, user: @user, body: "Awful shirt!")
			@product.comments.create!(rating: 3, user: @user, body: "Cute but scratchy!")
			@product.comments.create!(rating: 5, user: @user, body: "Amazing! So nice for day and night!")
		end

		it "returns the average rating of all comments" do
			expect(@product.average_rating). to eq 3
		end

		it "validates" do
			expect(Product.new(description: "Nice bike")).not_to be_valid
		end


end
	end

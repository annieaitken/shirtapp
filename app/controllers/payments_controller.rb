class PaymentsController < ApplicationController

	def create
	@product = Product.find(params[:product_id])
	@user = current_user

  	token = params[:stripeToken]
  	# Create the charge on Stripe's servers - this will charge the user's card
  begin
    charge = Stripe::Charge.create(
      :amount => (@product.price * 100).to_i,
      :currency => "usd",
      :source => token,
      :description => params[:stripeEmail],
      format.html { redirect_to @product, notice: 'Thank you for your purchase.' }
	  format.json { render :show, status: :ok, location: @product }
    )

      if charge.paid
      	Order.create(product_id: @product.id, user_id: @user_id, total: @product.price)
      end

  rescue Stripe::CardError => e
    # The card has been declined


  end
end



end



class CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.create!(cart_item_params)
    @cart = @cart_item.cart
    @pharmacy = @cart.pharmacy
    @prescription = @cart.prescription
    @drugs = @prescription.prescription_items
    @cart_items = @cart.cart_items
    @final_price = 0
    @cart_items.each do |cart_item|
      @final_price += cart_item.item.price * cart_item.quantity
    end
    # redirect_to prescription_pharmacy_path(@cart_item.prescription, @cart_item.pharmacy)
    render json: {
      html: render_to_string(partial: 'pharmacies/checkout_card', locals: {
        prescription: @prescription,
        drugs: @drugs,
        cart_items: @cart_items,
        final_price: @final_price,
        cart: @cart,
        pharmacy: @pharmacy
        },
        layout: false,
        formats: :html ),
      cartItemsCount: @cart.cart_items.count
      }.to_json
  end

  def update # cette methode doit être revue après l'ajout de "quantity"
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to prescription_pharmacy_path(@cart_item.prescription, @cart_item.pharmacy)
    else
      redirect_to prescription_pharmacy_path(@cart_item.prescription, @cart_item.pharmacy), status: :unprocessable_entity
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to prescription_pharmacy_path(@cart_item.prescription, @cart_item.pharmacy)
  end

  private

  def cart_item_params
    params.permit(:cart_id, :item_id, :quantity) #quantity risque d'etre nesté pour cart_item (faire le require)
  end
end

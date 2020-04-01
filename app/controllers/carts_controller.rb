class CartsController < ApplicationController
  def show
  end

  def add_part

    # add product from price list
    if params[:product_id].present?

      @product = Product.find(params[:product_id])

      unless @cart.line_items.find_by(product_id: @product.id)
        @new_cart_partname = @cart.line_items.new(
            name: @product.name,
            number: @product.number,
            product_id: @product.id,
            price: @product.price,
            amount: params[:amount].presence || 1
        )
        @new_cart_partname.save
      end

    # add partname from catalog
    else

      @partname = Partname.find_by!(ID: params[:id])
      @model = Model.find(params[:model])
      @grouptree = Grouptree.find_by(IDMODEL: @model.id, GROUPNO: params[:grouptree])

      unless @cart.line_items.find_by(PARTNAMEID: @partname.ID)
        @new_cart_partname = @cart.line_items.new(
            name: @partname.NAME,
            number: @partname.NUMBER,
            PARTNAMEID: @partname.ID,
            IDMODEL: @model.ID,
            IDGROUP: @grouptree.GROUPNO,
            price: @partname.info.price,
            amount: params[:amount].presence || 1
        )
        @new_cart_partname.save
      end

    end
  end

  def remove_part
    @cart.line_items.find(params[:id]).destroy
  end

  def change_amount
    @li = @cart.line_items.find(params[:li])

    if params[:v].present?
      new_amount = params[:v].to_i
    end

    @li.update_column(:amount, new_amount) if new_amount > 0
  end
end

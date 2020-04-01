class FormsController < ApplicationController
  def sto
    @sto = Form::Sto.new(form_sto_params)
    Notify.new_sto(@sto).deliver_later if @sto.save
  end

  def carwash
    @carwash = Form::Carwash.new(form_carwash_params)
    Notify.new_carwash(@carwash).deliver_later if @carwash.save
  end

  def rental
    @rental = Form::Rental.new(form_rental_params)
    Notify.new_rental(@rental).deliver_later if @rental.save
  end

  private

  def form_sto_params
    params.require(:form_sto).permit(:name, :phone, :type_of_work, :convenient_date)
  end

  def form_carwash_params
    params.require(:form_carwash).permit(:name, :amount, :phone, :fio)
  end

  def form_rental_params
    params.require(:form_rental).permit(:name, :phone, :email, :message)
  end
end

class PagesController < ApplicationController
  def show
    @page = Page.active.find_by!(slug: params[:id])
  end

  def company
    @page = Page.find_by!(slug: 'company')
  end

  def employees
    @employees = Employee.all
  end

  def sto
    @sto = Form::Sto.new
  end

  def carwash
    @carwash = Form::Carwash.new
  end

  def rental
    @rental = Form::Rental.new
  end
end

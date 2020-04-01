class Notify < ApplicationMailer

  default to: ['salesgruzovik72@gmail.com', 'ill25@list.ru', 'serwhite@mail.ru']

  def new_sto(form)
    @form = form

    mail subject: 'Новая заявка: СТО'
  end

  def new_carwash(form)
    @form = form

    mail subject: 'Новая заявка: Автомойка'
  end

  def new_rental(form)
    @form = form

    mail subject: 'Новая заявка: Аренда коммерческой недвижимости'
  end

  def new_order(order)
    @order = order

    mail subject: 'Новый заказ с сайта'
  end

  def new_order_to_user(order)
    @order = order

    mail to: @order.email, subject: 'Заказ сформирован'
  end
end

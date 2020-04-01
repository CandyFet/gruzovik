class Order < ActiveRecord::Base
  PERSONS = {
      entity: 'Юридическое лицо',
      individual: 'Физическое лицо'
  }

  DELIVERIES = {
      pickup: 'Самовывоз',
      region: 'Доставка по Тюмени',
      other: 'Доставка в регионы РФ'
  }

  PAYMENTS = {
      bill: 'По выставленному счету',
      cash: 'Наличными при получении',
  }

  mount_uploader :file, FileUploader

  has_one :cart, dependent: :destroy

  validates :name, :phone, presence: true
  validates :person, presence: true, inclusion: { in: PERSONS.keys.map(&:to_s) }
  validates :delivery, presence: true, inclusion: { in: DELIVERIES.keys.map(&:to_s) }
  validates :payment, presence: true, inclusion: { in: PAYMENTS.keys.map(&:to_s) }
  validates :company, presence: true, if: "person == 'entity'"
  validates_format_of :email, with: Devise::email_regexp, allow_blank: true


end

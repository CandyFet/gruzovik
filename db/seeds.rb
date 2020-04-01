# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Rails.env.development?
  User.create(email: 'admin@mail.com', password: 'password', is_admin: true, confirmed_at: Time.now)
end

MainText.create do |t|
  t.name = 'Телефон'
  t.slug = 'phone'
  t.content = '<p>+7 (3452) 679-320</p>'
end

MainText.create do |t|
  t.name = 'Адрес'
  t.slug = 'address'
  t.content = '<p>Федюнинского, 19</p>'
end

Page.create do |t|
  t.name = 'О компании'
  t.slug = 'company'
  t.is_page = false
end

# if PartnameInfo.all.blank?
#
#   Partname.find_each do |partname|
#     partname.create_info
#   end
#
# end

[
    ['СТО - телефон', 'sto_phone'],
    ['СТО - адрес', 'sto_address'],
    ['Автомойка - телефон', 'carwash_phone'],
    ['Автомойка - адрес', 'carwash_address'],
    ['Аренда - телефон', 'rental_phone'],
    ['Аренда - адрес', 'rental_address']
].each do |text|
  MainText.create(name: text[0], slug: text[1])
end

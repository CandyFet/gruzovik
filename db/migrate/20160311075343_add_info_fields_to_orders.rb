class AddInfoFieldsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :company, :string, after: :name
    add_column :orders, :post, :string, after: :company
    add_column :orders, :company_details, :string, after: :post
    add_column :orders, :email, :string, after: :company_details
    add_column :orders, :phone, :string, after: :email
    add_column :orders, :comments, :text, after: :phone
  end
end

class ProductsController < ApplicationController

  before_action :get_records, only: [:show, :part]

  def show
    @menu = 'catalog'
    @types = Typeauto.all
    @partpictures = @grouptree.partpictures.by_model(@model).order_by(params[:order])
    @categories = Category.roots
  end

  def price
    @product = Product.find(params[:id])
    @products_similar = @product.get_similars

    partnames = Partname.where(NUMBER: @product.number)#.where.not(ID: @partname.ID)
    @partpictures = Partpicture.includes(:partname, :model).where(PARTNAMEID: partnames.ids)

    get_categories
  end

  def part
    @partname = Partname.find(params[:part])

    partnames = Partname.where(NUMBER: @partname.NUMBER)#.where.not(ID: @partname.ID)
    @partpictures = Partpicture.includes(:partname, :model).where(PARTNAMEID: partnames.ids)

    partnames_similar = @partname.get_similars
    @partpictures_similar = Partpicture.includes(:partname, :model).where(PARTNAMEID: partnames_similar.ids)
  end

  private

  def get_categories
    @lastcategory = @product.category
    @subcategory = @lastcategory.parent if @lastcategory.parent_id
    @category = @subcategory.parent if @subcategory && @subcategory.parent_id

    case @lastcategory.ancestor_ids.count
      when 0
        @category = @lastcategory
        @subcategory = nil
        @lastcategory = nil
      when 1
        @category = @subcategory
        @subcategory = @lastcategory
        @lastcategory = nil
    end
  end

  def get_records
    @model = Model.find(params[:id].split('-').first)
    @type = @model.typeauto
    @mark = @model.mark
    @grouptree = @model.grouptrees.find(params[:id].split('-').last)
  end
end

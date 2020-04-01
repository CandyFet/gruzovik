class CatalogController < ApplicationController

  before_action :get_types_and_categories, only: [:index, :mark, :model, :price]

  def index
    @menu = 'catalog'
  end

  def mark
    @type = Typeauto.find(params[:type])
    @mark = Mark.find(params[:mark])
    @menu = 'catalog'
  end

  def model
    @model = Model.find(params[:model])
    @type = @model.typeauto
    @mark = @model.mark
    @menu = 'catalog'
  end

  def price
    @menu = 'price'

    if params[:category].present?
      @category = Category.find(params[:category])
      get_image_and_description(@category)

      if @category.present? && params[:subcategory].present?
        @subcategory = @category.children.find(params[:subcategory])
        get_image_and_description(@subcategory)

        if @subcategory.present? && params[:lastcategory].present?
          @lastcategory = @subcategory.children.find(params[:lastcategory])
          get_image_and_description(@lastcategory)
        end
      end
    end

    if params[:promotion].present?
      @products = Product.promotion(params[:promotion]).order_by(params[:order]).page(params[:page]).per(20)
      @promotion = Promotion.find_by(slug: params[:promotion])
    else
      @products = get_products
    end
  end

  def part
    @model = Model.find(params[:model])
    @parts = Grouptree.where(IDMODEL: params[:model], PARENT: params[:group])
  end

  private

  def get_image_and_description(category)
    @category_image = category.image if category.image?
    @category_description = category.description if category.description?
    @category_description_bottom = category.description_bottom if category.description_bottom?
  end

  def get_types_and_categories
    @types = Typeauto.all
    @categories = Category.roots
  end

  def get_products
    if @lastcategory.present?
      products = @lastcategory.products
    elsif @subcategory.present?
      products = Product.by_category(@subcategory)
    elsif @category.present?
      products = Product.by_category(@category)
    else
      products = Product.all
    end
    @products = products.order_by(params[:order]).page(params[:page]).per(20)
  end
end

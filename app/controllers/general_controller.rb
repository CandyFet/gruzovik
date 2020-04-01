class GeneralController < ApplicationController
  def index
    @products = Product.where(is_new: true).reorder('RAND()').limit(15)
    @promotion = Promotion.where(on_main: true).take
  end

  def search
    params[:where] ||= 'catalog'

    @types = Typeauto.all
    @categories = Category.roots

    if params[:where] == 'catalog'

      @mark_search = Mark.find_by(ID: params[:q_mark])

      if @mark_search.present?
        @models_search = Model.by_mark(@mark_search)
        # @grouptrees_search = Grouptree.select(:GROUPNAME).root_groups.by_model(models_search).distinct(:GROUPNAME)
      end

      partpictures = Partpicture.includes(:partname)

      if params[:q].present?
        partpictures = partpictures.joins(:partname).where('partname.NAME LIKE ? OR partname.NUMBER = ?', "%#{params[:q]}%", params[:q])
      end

      if @mark_search.present?
        partpictures = partpictures.includes(:model).where(IDMODEL: @models_search)

        if params[:q_model].present?
          partpictures = partpictures.where(IDMODEL: params[:q_model])

          if params[:q_group].present?
            groups_root = Grouptree.root_groups.where(IDMODEL: params[:q_model], GROUPNO: params[:q_group])
            groups_second_level = Grouptree.where(IDMODEL: params[:q_model], PARENT: groups_root)
            groups_third_level = Grouptree.where(IDMODEL: params[:q_model], PARENT: groups_second_level)
            partpictures = partpictures.where(IDGROUP: groups_third_level)

            @groups_search = Grouptree.select(:IDMODEL, :GROUPNO, :GROUPNAME).root_groups.by_model(params[:q_model]).distinct(:GROUPNAME)
          end

        end
      end

      @partpictures = partpictures.order_by(params[:order]).page(params[:page]).per(20)

      @cart_line_items = @cart.line_items.pluck(:PARTNAMEID)
    else

      products = Product.all

      if params[:q_category].present?

        category = Category.find_by(id: params[:q_category])

        if category.present?
          @subcategories_search = category.children
          products = Product.by_category(category)
        end
      end

      if params[:q_subcategory].present?
        subcategory = Category.find_by(id: params[:q_subcategory])

        if subcategory.present?
          @lastcategories_search = subcategory.children
          products = Product.by_category(subcategory)
        end
      end

      if params[:q_lastcategory].present?
        lastcategory = Category.find_by(id: params[:q_lastcategory])
        products = Product.by_category(lastcategory)
      end

      if params[:q].present?
        products = products.where('name LIKE ? OR number = ?', "%#{params[:q]}%", params[:q])
      end

      @products = products.order_by(params[:order]).page(params[:page]).per(20)
    end
  end

  def search_mark
    mark = Mark.find_by(ID: params[:mark])

    @models = mark.present? ? Model.by_mark(mark) : Model.none
  end

  def search_model
    model = Model.find_by(ID: params[:model])

    @groups = Grouptree.select(:IDMODEL, :GROUPNO, :GROUPNAME).root_groups.by_model(model).distinct(:GROUPNAME) if model.present?
  end

  def search_price_subcategory
    category = Category.find_by(id: params[:category])

    @subcategories = category.present? ? category.children : Category.none
  end

  def search_price_lastcategory
    subcategory = Category.find_by(id: params[:subcategory])
    @lastcategories = subcategory.children if subcategory.present?
  end

end



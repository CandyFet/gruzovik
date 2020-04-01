RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  config.authorize_with do
    redirect_to main_app.root_url unless current_user.try(:is_admin?)
  end

  config.excluded_models = %w(Ckeditor::Asset Ckeditor::Picture Ckeditor::AttachmentFile)

  config.label_methods << :NAMESHORT
  config.label_methods << :GROUPNAME
  config.label_methods << :NAME

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app do
      controller do
        proc do
          if @object.class == Page
            if @object.is_page?
              redirect_to main_app.page_path(@object.slug)
            else
              redirect_to "/#{@object.slug}"
            end
          end
        end
      end
    end

    nestable
    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model Employee do
    nestable_list true

    edit do
      exclude_fields :position
    end
  end

  config.model News do
    edit do
      field :name
      field :slug do
        required false
      end
      include_all_fields
      field :content, :ck_editor
    end
  end

  config.model NewsImage do
    parent News
  end

  config.model MainText do
    edit do
      include_all_fields
      field :content, :ck_editor
    end
  end

  config.model Page do
    edit do
      include_all_fields
      field :content, :ck_editor
    end
  end

  config.model Form::Sto do
    navigation_label 'Формы'
  end

  config.model Form::Carwash do
    navigation_label 'Формы'
  end

  config.model Form::Rental do
    navigation_label 'Формы'
  end

  config.model Model do
    parent Mark

    show do
      field :ID
      field :NAMESHORT
      field :NAMEFULL
      field :typeauto
      field :mark
      field :grouptrees
      field :partpictures
      include_all_fields
      exclude_fields :ENAMESHORT, :ENAMEFULL
    end
    list do
      field :ID
      field :NAMESHORT
      field :NAMEFULL
      field :typeauto
      field :mark
      field :grouptrees
      field :partpictures
      include_all_fields
      exclude_fields :ENAMESHORT, :ENAMEFULL
    end
    edit do
      field :ID
      field :NAMESHORT
      field :NAMEFULL
      field :typeauto
      field :mark
      field :grouptrees
      field :partpictures
      include_all_fields
      exclude_fields :ENAMESHORT, :ENAMEFULL
    end
  end

  config.model Mark do
    navigation_label 'Автокаталог'
    nestable_list position_field: :SORTORDER

    show do
      field :ID
      field :NAMESHORT
      field :NAMEFULL
      field :models
      field :partnames
      include_all_fields
      exclude_fields :ENAMESHORT, :ENAMEFULL
    end
    list do
      field :ID
      field :NAMESHORT
      field :NAMEFULL
      field :models
      field :partnames
      include_all_fields
      exclude_fields :ENAMESHORT, :ENAMEFULL, :partnames
    end
    edit do
      field :ID
      field :NAMESHORT
      field :NAMEFULL
      field :models
      field :partnames
      include_all_fields
      exclude_fields :ENAMESHORT, :ENAMEFULL
    end
  end

  config.model Typeauto do
    navigation_label 'Автокаталог'
    nestable_list true

    show do
      field :id
      field :name
      field :models
      include_all_fields
    end
    list do
      field :id
      field :name
      field :models
      include_all_fields
    end
    edit do
      field :name
      field :models
      include_all_fields
      exclude_fields :position
    end
  end

  config.model Grouptree do
    parent Model

    show do
      field :GROUPNO
      field :GROUPNAME
      field :model
      field :parent_group
      field :children_groups
      field :partpictures
      include_all_fields
      exclude_fields :GROUPNAMEEN
    end
    list do
      field :GROUPNO
      field :GROUPNAME
      field :model
      field :parent_group
      field :children_groups
      field :partpictures
      include_all_fields
      exclude_fields :GROUPNAMEEN
    end
    edit do
      field :GROUPNAME
      field :model
      field :parent_group
      field :children_groups
      field :partpictures
      include_all_fields
      exclude_fields :GROUPNAMEEN
    end
  end

  config.model Partpicture do
    parent Model

    edit do
      field :ID
      field :model
      field :grouptree
      field :partname
      field :rectangles
      include_all_fields
    end
    list do
      field :ID
      field :model
      field :grouptree
      field :partname
      field :rectangles
      include_all_fields
    end
    edit do
      field :ID
      field :model
      field :grouptree
      field :partname
      field :rectangles
      include_all_fields
    end
  end

  config.model Partname do
    parent Mark

    show do
      field :ID
      field :NAME
      field :mark
      field :partpictures
      include_all_fields
    end
    list do
      field :ID
      field :NAME
      field :mark
      field :partpictures
      include_all_fields
    end
    edit do
      field :ID
      field :NAME
      field :mark
      field :partpictures
      include_all_fields
    end
  end

  config.model Rectangle do
    navigation_label 'Автокаталог'

    show do
      field :ID
      field :partpictures
      field :DX
      field :DY
      include_all_fields
    end
    list do
      field :ID
      field :partpictures
      field :DX
      field :DY
      include_all_fields
    end
    edit do
      field :ID
      field :partpictures
      field :DX
      field :DY
      include_all_fields
    end
  end

  config.model Pplr do
    navigation_label 'Автокаталог'
  end

  config.model Cart do
    parent Order
  end

  config.model LineItem do
    parent Cart
  end

  config.model Order do
    navigation_label 'Заказы'

    show do
      field :name
      field :file
      field :person, :enum do
        enum do
          Order::PERSONS.invert
        end
      end
      field :delivery, :enum do
        enum do
          Order::DELIVERIES.invert
        end
      end
      field :payment, :enum do
        enum do
          Order::PAYMENTS.invert
        end
      end
      include_all_fields
    end
    list do
      field :id
      field :name
      field :person, :enum do
        enum do
          Order::PERSONS.invert
        end
      end
      field :delivery, :enum do
        enum do
          Order::DELIVERIES.invert
        end
      end
      field :payment, :enum do
        enum do
          Order::PAYMENTS.invert
        end
      end
      include_all_fields
    end
    edit do
      field :name
      field :person, :enum do
        enum do
          Order::PERSONS.invert
        end
      end
      field :delivery, :enum do
        enum do
          Order::DELIVERIES.invert
        end
      end
      field :payment, :enum do
        enum do
          Order::PAYMENTS.invert
        end
      end
      include_all_fields
    end
  end

  config.model PartnameInfo do
    parent Partname
  end

  config.model Category do
    navigation_label 'Прайс лист'
    nestable_tree({position_field: :position, max_depth: 5})

    edit do
      include_all_fields
      field :uid do
        read_only true
      end
      include_all_fields
      field :description, :ck_editor
      field :description_bottom, :ck_editor
      exclude_fields :position, :ancestry
    end
  end

  config.model Product do
    parent Category

    edit do
      include_all_fields
      field :uid do
        read_only true
      end
    end
  end

  config.model Promotion do

    edit do
      include_all_fields
      field :content, :ck_editor
    end

  end

end

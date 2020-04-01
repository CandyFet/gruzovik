namespace :products do
  LOG = Logger.new('log/import.log')

  FILES_DIR = Rails.env.development? ? '/Users/white/rails/mashoptorg/webdata/' : '/var/www/production.mashoptorg/shared/1c/webdata/'

  task structure: :environment do
    LOG.info '-' * 30
    LOG.info "START STRUCTURE FILE EXPORT TASK AT #{DateTime.now}"

    require 'csv'

    root_id = 'f1687486-54a9-11dd-9565-00151752eae5'

    categories_root_count = 0
    categories_sub_count = 0
    categories_skipped_count = 0
    products_count = 0
    products_skipped_count = 0

    csv_text = File.read("#{FILES_DIR}structure.csv")
    csv = CSV.parse(csv_text.gsub('""', ''), headers: true, col_sep: ';')
    csv.each_with_index do |row, i|
      columns = row

      next if columns.count < 4

      field_id = columns[0]
      field_parent_id = columns[1]
      field_name = columns[2]
      field_group = columns[3] =~ /Да/ ? true : false

      if field_parent_id.present?

        # if it category
        if field_group

          if field_parent_id == root_id

            category = Category.find_or_initialize_by(uid: field_id)
            category.name = field_name
            category.save
            categories_root_count += 1

          else

            parent_category = Category.find_by(uid: field_parent_id)

            if parent_category.present?

              new_category = Category.find_or_initialize_by(uid: field_id)
              new_category.name = field_name
              new_category.parent = parent_category
              new_category.save
              categories_sub_count += 1
            else
              categories_skipped_count += 1
            end

          end

        # if it product
        else

          category = Category.find_by(uid: field_parent_id)

          if category.present?

            product = Product.find_or_initialize_by(uid: field_id)
            product.name = field_name
            product.category = category
            product.save

          else
            products_skipped_count += 1
          end

        end

      end

    end

    LOG.info "CATEGORIES ROOT [PROCESSED]: #{categories_root_count}"
    LOG.info "CATEGORIES SUB [PROCESSED]: #{categories_sub_count}"
    LOG.info "CATEGORIES SKIPPED [PROCESSED]: #{categories_skipped_count}"
    LOG.info "PRODUCTS [PROCESSED]: #{products_count}"
    LOG.info "PRODUCTS SKIPPED [PROCESSED]: #{products_skipped_count}"
    LOG.info "END STRUCTURE FILE EXPORT TASK AT #{DateTime.now}"

  end

  task price_import_file: :environment do
    LOG.info '-' * 30
    LOG.info "START PRICE IMPORT FILE EXPORT TASK AT #{DateTime.now}"

    require 'csv'

    products_imported_count = 0
    products_count = 0
    products_not_imported_count = 0

    csv_text = File.read("#{FILES_DIR}export.csv")
    csv = CSV.parse(csv_text.gsub('""', ''), headers: false, col_sep: ';')
    csv.each_with_index do |row, i|

      if row.present? && i > 0

        columns = row
        products_count += 1

        next if columns[0].blank?

        # product_name = columns[0].gsub(/\(.*/, '').gsub("'", '').gsub('"', '').try(:strip)
        product_name = columns[0].gsub("'", '').gsub('"', '').try(:strip)
        product_number = columns[1]
        product_mark = columns[2]
        product_group = columns[3]
        product_image = columns[4]
        product_description = columns[5]
        product_width = columns[6]
        product_height = columns[7]
        product_length = columns[8]
        product_residue = columns[9]
        product_price = columns[10]
        product_similars = columns[11]
        product_uid = columns[12]

        if product_uid.present?

          product_db = Product.find_by(uid: product_uid)

          # if product exists in database
          if product_db.present?

            product_db.update(
                name: product_name,
                number: product_number,
                price: product_price.presence || 0,
                residue: product_residue,
                description: product_description,
                width: product_width,
                height: product_height,
                length: product_length,
                similars: product_similars,
                # file_name: file
            )
            products_imported_count += 1


            # if product do not exists in database
          else

            products_not_imported_count += 1

          end

        end
      end
    end

    LOG.info "Products in file #{products_count}, was imported #{products_imported_count}"
    LOG.info "Products in file #{products_count}, was not imported #{products_not_imported_count}"
    LOG.info "END PRICE IMPORT FILE EXPORT TASK AT #{DateTime.now}"
  end

  task price_import: :environment do

    require 'csv'

    Dir.entries("#{FILES_DIR}export").each do |file|
      if file.include?('.csv')

        # next unless file.include?('МАЗ')

        puts "Begin import from file #{file} at #{Time.now}"
        products_imported_count = 0
        products_count = 0
        products_not_imported_count = 0

        csv_text = File.read("#{FILES_DIR}export/#{file}")
        csv = CSV.parse(csv_text.gsub('""', ''), headers: false, col_sep: ';')
        csv.each_with_index do |row, i|

          if row.present? && i > 0

            columns = row
            products_count += 1

            next if columns[0].blank?

            # product_name = columns[0].gsub(/\(.*/, '').gsub("'", '').gsub('"', '').try(:strip)
            product_name = columns[0].gsub("'", '').gsub('"', '').try(:strip)
            product_number = columns[1]
            product_mark = columns[2]
            product_group = columns[3]
            product_image = columns[4]
            product_description = columns[5]
            product_width = columns[6]
            product_height = columns[7]
            product_length = columns[8]
            product_residue = columns[9]
            product_price = columns[10]
            product_similars = columns[11]
            product_uid = columns[12]

            if product_uid.present?

              product_db = Product.find_by(uid: product_uid)

              # if product exists in database
              if product_db.present?

                product_db.update(
                    name: product_name,
                    number: product_number,
                    price: product_price.presence || 0,
                    residue: product_residue,
                    description: product_description,
                    width: product_width,
                    height: product_height,
                    length: product_length,
                    similars: product_similars,
                    file_name: file
                )
                products_imported_count += 1


                # if product do not exists in database
              else

                products_not_imported_count += 1

              end

            end
          end
        end

        puts "Products in file #{products_count}, was imported #{products_imported_count} at #{Time.now}"
        puts "Products in file #{products_count}, was not imported #{products_not_imported_count} at #{Time.now}"

      end
    end

  end

  task import_file: :environment do
    LOG.info '-' * 30
    LOG.info "START IMPORT FILE EXPORT TASK AT #{DateTime.now}"

    require 'csv'

    products_count = 0
    products_not_imported_count = 0
    products_imported_count = 0

    csv_text = File.read("#{FILES_DIR}export.csv")
    csv = CSV.parse(csv_text, quote_char: "\x00", headers: false, col_sep: ';')
    csv.each_with_index do |row, i|

      if row.present? && i > 0

        columns = row
        products_count += 1

        next if columns[0].blank?

        product_name = columns[0].gsub(/\(.*/, '').gsub("'", '').gsub('"', '').try(:strip)
        product_number = columns[1]
        product_mark = columns[2]
        product_group = columns[3]
        product_image = columns[4]
        product_description = columns[5]
        product_width = columns[6]
        product_height = columns[7]
        product_length = columns[8]
        product_residue = columns[9]
        product_price = columns[10]
        product_similars = columns[11]
        product_uid = columns[12]

        if product_uid.present? && product_number.present?

          partnames_db = Partname.where(NUMBER: product_number)

          # if partnames exists in database
          if partnames_db.any?

            partnames_db.each do |partname|

              partname.info.update_columns(
                  name: product_name,
                  uid: product_uid,
                  price: product_price.presence || 0,
                  residue: product_residue,
                  description: product_description,
                  width: product_width,
                  height: product_height,
                  length: product_length,
                  similars: product_similars,
                  # file_name: file
              )
              partname.info.touch
              products_imported_count += 1

            end

            # if partnames do not exists in database
          else

            products_not_imported_count += 1

          end

        end
      end
    end

    LOG.info "Products in file #{products_count}, was imported #{products_imported_count}"
    LOG.info "Products in file #{products_count}, was not imported #{products_not_imported_count}"
    LOG.info "END IMPORT FILE EXPORT TASK AT #{DateTime.now}"

  end

  task import: :environment do

    require 'csv'

    Dir.entries("#{FILES_DIR}export").each do |file|
      if file.include?('.csv')

        puts "Begin import from file #{file} at #{Time.now}"
        products_count = 0
        products_imported_count = 0

        csv_text = File.read("#{FILES_DIR}export/#{file}")
        csv = CSV.parse(csv_text, quote_char: "\x00", headers: false, col_sep: ';')
        csv.each_with_index do |row, i|

          if row.present? && i > 0

            columns = row
            products_count += 1

            next if columns[0].blank?

            product_name = columns[0].gsub(/\(.*/, '').gsub("'", '').gsub('"', '').try(:strip)
            product_number = columns[1]
            product_mark = columns[2]
            product_group = columns[3]
            product_image = columns[4]
            product_description = columns[5]
            product_width = columns[6]
            product_height = columns[7]
            product_length = columns[8]
            product_residue = columns[9]
            product_price = columns[10]
            product_similars = columns[11]
            product_uid = columns[12]

            if product_uid.present? && product_number.present?

              partnames_db = Partname.where(NUMBER: product_number)

              # if partnames exists in database
              if partnames_db.any?

                partnames_db.each do |partname|

                  partname.info.update_columns(
                      name: product_name,
                      uid: product_uid,
                      price: product_price.presence || 0,
                      residue: product_residue,
                      description: product_description,
                      width: product_width,
                      height: product_height,
                      length: product_length,
                      similars: product_similars,
                      file_name: file
                  )
                  partname.info.touch
                  products_imported_count += 1

                end

                # if partnames do not exists in database
              else

              end

            end
          end
        end

        puts "Products in file #{products_count}, was imported #{products_imported_count} at #{Time.now}"

      end
    end

  end

  task images: :environment do

    require 'csv'

    Dir.entries("#{FILES_DIR}export").each do |file|
      if file.include?('.csv')

        csv_text = File.read("#{FILES_DIR}export/#{file}")
        csv = CSV.parse(csv_text, quote_char: "\x00", headers: true, col_sep: ';')
        csv.each_with_index do |row, i|

          if row.present?

            columns = row[0].split(';')

            product_image = columns[4]
            product_uid = columns[12]

            if product_image.present? && product_uid.present?

              PartnameInfo.where(uid: product_uid).each do |partname_info|

                File.open("#{FILES_DIR}images/#{product_image}") do |f|
                  partname_info.image = f
                end
                partname_info.save

              end

            end

          end
        end

      end
    end
  end

  task images_file: :environment do
    LOG.info '-' * 30
    LOG.info "START IMAGES FILE EXPORT TASK AT #{DateTime.now}"

    count_all = 0
    count_products = 0

    require 'csv'

    csv_text = File.read("#{FILES_DIR}export.csv")
    csv = CSV.parse(csv_text, quote_char: "\x00", headers: true, col_sep: ';')
    csv.each_with_index do |row, i|

      if row.present?

        product_image = row[4]
        product_uid = row[12]

        if product_image.present? && product_uid.present?

          count_all += 1

          PartnameInfo.where(uid: product_uid).each do |partname_info|

            count_products += 1

            File.open("#{FILES_DIR}images/#{product_image}") do |f|
              partname_info.image = f
            end
            partname_info.save

          end

        end

      end
    end

    LOG.info "COUNT ALL: #{count_all}"
    LOG.info "COUNT PRODUCTS UPDATED: #{count_products}"
    LOG.info "END IMAGES FILE EXPORT TASK AT #{DateTime.now}"

  end

  task product_images_file: :environment do
    LOG.info '-' * 30
    LOG.info "START PRODUCT IMAGES FILE EXPORT TASK AT #{DateTime.now}"

    count_all = 0
    count_products = 0

    require 'csv'

    csv_text = File.read("#{FILES_DIR}export.csv")
    csv = CSV.parse(csv_text, quote_char: "\x00", headers: true, col_sep: ';')
    csv.each_with_index do |row, i|

      if row.present?

        product_image = row[4]
        product_uid = row[12]

        if product_image.present? && product_uid.present?

          count_all += 1

          Product.where(uid: product_uid).each do |product|

            count_products += 1

            File.open("#{FILES_DIR}images/#{product_image}") do |f|
              product.image = f
            end
            product.save

          end

        end

      end
    end

    LOG.info "COUNT ALL: #{count_all}"
    LOG.info "COUNT PRODUCTS UPDATED: #{count_products}"
    LOG.info "END PRODUCT IMAGES FILE EXPORT TASK AT #{DateTime.now}"

  end

end

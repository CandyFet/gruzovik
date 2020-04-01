module CatalogHelper

  def model_image_path(model)
    "#{'/' if model.PATHICON[0] != '/'}#{Russian::translit(model.PATHICON[0..-5].mb_chars.downcase.gsub(' ', '_'))}.png"
  end

  def model_drawing_image_path(part)
    "/data/#{@model.PATHIMAGE.mb_chars.downcase}#{'/' if @model.PATHIMAGE[-1] != '/'}#{Russian::translit(part.PICTUREINDEX.mb_chars.downcase.gsub(' ', '_'))}.gif"
  end

end

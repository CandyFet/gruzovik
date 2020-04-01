class PromotionsController < ApplicationController
  def index
    @promotions = Promotion.limit(3)
  end
end

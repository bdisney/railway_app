class Carriage < ActiveRecord::Base
  belongs_to :train

  CATEGORIES = { coupe: 'Coupe', economy: 'Econom-class'}.freeze

  validates :train_id, presence: true
  validates :category, inclusion: { in: %w( coupe economy ) }
  validates :top_seats, :bottom_seats, numericality: { only_integer: true, greater_than: 0 }

  def self.categories 
    CATEGORIES.invert
  end

  def category_label
    CATEGORIES.fetch(category.to_sym)
  end
end
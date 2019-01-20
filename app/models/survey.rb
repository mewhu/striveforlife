class Survey < ApplicationRecord
  has_many  :endgrades, dependent: :destroy
  accepts_nested_attributes_for :endgrades
  # accepts_nested_attributes_for :endgrades, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end

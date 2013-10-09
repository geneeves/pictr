class Album < ActiveRecord::Base

  validates :name, :presence => true

  has_many :photos, :inverse_of => :album
  belongs_to :user

  accepts_nested_attributes_for :photos, allow_destroy: true

end

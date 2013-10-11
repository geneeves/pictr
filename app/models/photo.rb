class Photo < ActiveRecord::Base


  validates :name, :presence => true
  validates :album, :presence => true

  belongs_to :album

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>"}, :default_url => "/images/:style/missing.png"

end

class Page < ActiveRecord::Base

  belongs_to :subject
  has_many :sections

end

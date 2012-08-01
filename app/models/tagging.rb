class Tagging < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :article
  belongs_to :tag
end

# Bio model is used for Adding Bio to user
class Bio < ApplicationRecord
  belongs_to :user
  validates_presence_of :Bio
end

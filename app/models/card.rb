class Card < ApplicationRecord
  self.inheritance_column = :_type_disabled
  self.inheritance_column = :my_type_column

  validates :title, presence: true
  attr_accessor :title
  attr_accessor :content

  end
  
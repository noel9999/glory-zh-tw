class Dictionary < ActiveRecord::Base
  belongs_to :sixbook_category, :foreign_key => :six_cat_id
  has_one :sixbook, :foreign_key => :dic_id
  has_one :game, :foreign_key => :dic_id
  scope :newest, lambda{ order("id DESC") }
  validates_presence_of :word, :six_cat_id
end

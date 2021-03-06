# == Schema Information
#
# Table name: options
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  o_class    :integer
#  o_item     :integer
#  note       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Option < ActiveRecord::Base
  has_many :questions, through: :debtors
  has_many :debtors, foreign_key: :option_id, class_name: "QuestionOptionMembership"
  scope :newest, lambda{ order("id DESC") }
  scope :category, lambda { |a| where(:o_class => a) }
  validates_presence_of :content, :o_class

  attr_accessor :option_code, :question_id

  OPTION_CLASS_LABEL = ["六書", "文人作品", "不分類"]  
  OPTION_CLASS_VALUE = [1,2,99]
  OPTION_CLASS_COLLECTION = OPTION_CLASS_LABEL.zip(OPTION_CLASS_VALUE)
  OPTION_CLASS_HASH = OPTION_CLASS_COLLECTION.
  reduce({}) do |result, array|
    result[array.last] = array.first
    result
  end
end

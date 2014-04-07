class Transaction < ActiveRecord::Base
  has_many :children, class_name: "Transaction", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Transaction"
  belongs_to :budget

  validates :date, :amount, presence: true
  validates :budget, presence: true, if: "not parent_id.nil?"
  
end

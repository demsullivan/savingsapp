class SavingsTransaction < ActiveRecord::Base
  self.table_name = 'transactions'

  has_many :children, class_name: "SavingsTransaction", foreign_key: "parent_id"
  belongs_to :parent, class_name: "SavingsTransaction"
  belongs_to :budget

  validates :date, :amount, presence: true
  validates :budget, presence: true, if: "not parent_id.nil?"


  before_validation do |txn|
    txn.date = Date.today if txn.date.nil?
  end

  def self.new_from_profile(amount, profile)
    parent = SavingsTransaction.new(:amount => amount)
    parent.save
    profile.contribution_rates.each do |rate|
      child_amount = amount * (rate.rate/100)
      txn = parent.children.create(:amount => child_amount, :budget => rate.budget)
    end
    return parent
  end
      
end

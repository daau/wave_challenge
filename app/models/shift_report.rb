class ShiftReport < ApplicationRecord
  has_many :shifts, dependent: :destroy

  validates :report_id, uniqueness: true, presence: true  
end

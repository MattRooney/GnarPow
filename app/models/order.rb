class Order < ActiveRecord::Base
  belongs_to :user

  validates :current_status, presence: true,
            inclusion: { in: %w(completed ordered paid canceled) }
end

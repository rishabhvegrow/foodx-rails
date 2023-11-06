class CartItem < ApplicationRecord
    belongs_to :user

    scope :checked_out, -> { where(is_checked_out: true) }

    validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
    alidates :price, presence: true, numericality: { greater_than: 0 }

    before_save :calculate_total_price

    def calculate_total_price
        self.total_price = quantity * price
    end

end

require 'pry'
class CashRegister
    attr_accessor :total, :last_transaction
    attr_reader :items, :discount
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.last_transaction = price * quantity
        self.total += price * quantity
        quantity.times {@items << title}
    end

    def apply_discount
        if self.discount != 0
            @total = ((1.0 - self.discount.to_f/100.00) * self.total.to_f).to_i
            "After the discount, the total comes to $#{@total}."
        else 
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end
end
require 'pry'

class CashRegister
    attr_accessor :total
    attr_reader :discount
    
    def initialize discount=0
        @total = 0.0
        @items = []
        @discount = discount
    end

    def add_item title, price, quantity=1
        for item in 1..quantity do
            @total = @total + price
            @items << [title, price, quantity]
        end
    end

    def apply_discount
        if @discount == 0
            "There is no discount to apply."
        else
            @total = ((100 - @discount)/100.to_f * @total).to_i
            "After the discount, the total comes to $#{total}."
        end
    end

    def items
        @items.map {|item| item[0]}
    end

    def void_last_transaction
        for item in 1..@items[-1][2] do
            @total -= @items[-1][1]
        end
        @items.pop
    end


end
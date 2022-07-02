class OrdersController < ApplicationController
  def success
  end
  
  def bought
    @booked_appointments = current_user.bought_orders
  end

  def sold
    @sold_appointments = current_user.sold_orders
  end
end

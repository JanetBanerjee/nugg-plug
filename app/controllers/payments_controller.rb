class PaymentsController < ApplicationController

  def create
    @tier = Payment.new(params.required(Payment).permit(:user_id, :sub_tier))
  end
end

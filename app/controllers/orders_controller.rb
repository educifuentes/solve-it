class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    services_technician = ServicesTechnician.find(params[:service_technician_id])
    order = Order.create!(
      services_technician: services_technician,
      user: current_user,
      status: "pending",
      amount: services_technician.price
    )

    session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      customer_email: current_user.email,
      line_items: [{
        name: services_technician.service.name,
        amount: services_technician.price_cents,
        currency: "usd",
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end
end

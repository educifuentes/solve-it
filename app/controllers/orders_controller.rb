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

    # create zoom meeting
    zoom_client = initialize_zoom_client
    zoom_user_id = zoom_user_id(zoom_client)

    zoom_client.meeting_create(
      user_id: zoom_user_id,
      start_time: DateTime.now,
      topic: services_technician.service.name,
      duration: 30
    )

    meeting_url = zoom_client.meeting_list(user_id: zoom_user_id)["meetings"].last["join_url"]
    order.update(meeting_url: meeting_url)

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  private

  def initialize_zoom_client
    Zoom.new
  end

  def zoom_user_id(zoom_client)
    user_list = zoom_client.user_list
    return user_list['users'][0]['id']
  end

end

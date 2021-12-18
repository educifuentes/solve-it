require 'zoom_rb'
require 'json'
# require_relative "/.env"

Zoom.configure do |c|
  c.api_key = ENV["ZOOM_US_API_KEY"]
  c.api_secret = ENV["ZOOM_US_API_SECRET"]
end

# For Testing
# Starting a new zoom client
# zoom_client = Zoom.new

# # Getting the user list
# user_list = zoom_client.user_list

# # Grabing the desired user's id
# zoom_user_id = user_list['users'][0]['id']
# # puts "Zoom.us user_id = #{zoom_user_id}"

# # Creating a meeting with the selected user's id
# zoom_client.meeting_create(user_id: zoom_user_id, start_time: DateTime.now)

# # Getting the list of meetings that belong to a certain user
# pp zoom_client.meeting_list(user_id: zoom_user_id)["meetings"].last["join_url"]

# # pp zoom_client.meeting_list(user_id: zoom_user_id)["meetings"].last

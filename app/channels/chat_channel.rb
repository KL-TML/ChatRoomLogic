class ChatChannel < ApplicationCable::Channel

  def subscribed
    # room = Room.find_by(name: <name>)
    begin
      cookies = connection.env['HTTP_COOKIE'].split(';').map(&:strip)
      room_cookie = cookies.find { |cookie| cookie.split('=').first == 'room' }
      if room_cookie
        room = room_cookie.split('=').last
        stream_from room
      else
        puts "NO ROOM COOKIE!!!"
        puts cookies.to_yaml
      end
    rescue
      binding.pry
    end
  end

  def receive(data)
    ActionCable.server.broadcast(data['room'], data)
  end

end

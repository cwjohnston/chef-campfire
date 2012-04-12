action :speak do
  require 'tinder'
  begin
    campfire = Tinder::Campfire.new(@new_resource.subdomain, :token => @new_resource.token, :ssl => @new_resource.ssl)
    room = campfire.find_room_by_name(@new_resource.room)

    if @new_resource.play_before
      room.play(@new_resource.play_before)
    end

    if @new_resource.paste
      room.paste(@new_resource.message)
    else
      room.speak(@new_resource.message)
    end

    if @new_resource.play_after
      room.play(@new_resource.play_after)
    end

  rescue => e
      if @new_resource.failure_ok
        Chef::Log.info("Campfire: failed to connect to campfire.")
        Chef::Log.debug("Campfire: #{e.inspect}")
        raise
      else
        Chef::Log.fatal("Campfire: failed to connect to campfire.")
        Chef::Log.fatal("Campfire: #{e.inspect}")
      end
  end
end

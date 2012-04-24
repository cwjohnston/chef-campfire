action :speak do
  require 'broach'
  begin
    Broach.settings = {'account' => @new_resource.subdomain, 'token' => @new_resource.token, 'use_ssl' => true}
    room = Broach::Room.find_by_name(@new_resource.room)

    if @new_resource.play_before
      room.sound(@new_resource.play_before)
    end

    if @new_resource.paste
      room.paste(@new_resource.message)
    else
      room.speak(@new_resource.message)
    end

    if @new_resource.play_after
      room.sound(@new_resource.play_after)
    end

  rescue => e
      if @new_resource.failure_ok
        Chef::Log.info("Campfire: failed to connect to campfire.")
        Chef::Log.debug("Campfire: #{e.inspect}")
      else
        Chef::Log.fatal("Campfire: failed to connect to campfire.")
        Chef::Log.fatal("Campfire: #{e.inspect}")
        raise
      end
  end
end

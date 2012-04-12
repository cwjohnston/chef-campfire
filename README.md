Description
===========

This cookbook provides a `campfire_msg` resource, making it easier for chef recipies to play sounds or send messages to a chat room on the 37signals Campfire service.

Platform
========

Should work on any platform where Chef runs. Tested on Ubuntu.

Requirements
============

* Authentication token for an existing 37signals Campfire account.
* 'tinder' gem (automatically installed by this cookbook's default recipe)

Attributes
==========
* `subdomain` - the subdomain for your Campfire instance (required)
* `room` - the name of the room you would like to speak into (requied)
* `token` - authentication token for your Campfire account (required)
* `ssl` - toggles whether or not SSL is used in the connection (defaults to false)
* `message` - the message to speak. If a message is not specified, the name of the `campfire_msg` resource is used.
* `paste` - toggles whether or not to send the message as a monospaced "paste", (defaults to false)
* `play_before` - play the specified sound before speaking the message
* `play_after` - play the specified sound after speaking the message

A list of emoji and sounds available in Campfire can be found here: http://www.emoji-cheat-sheet.com/ 

Usage examples
==============

        include_recipe 'campfire'
        
        campfire_msg 'bad news' do
            subdomain 'example'
            room 'Important Stuff'
            token '0xdedbeef0xdedbeef0xdedbeef'
            ssl true
            message "I have some bad news... there was an error: #{some_error}"
            play_after 'trombone'
        end

License and Author
==================

Author:: Cameron Johnston <cwjohnston@gmail.com>

Copyright:: 2012, Cameron Johnston

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

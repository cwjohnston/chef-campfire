def initialize(*args)
  super
  @action = :speak
end

actions :speak

attribute :subdomain, :kind_of => String, :required => true
attribute :token, :kind_of => String, :required => true
attribute :room, :kind_of => String, :required => true
attribute :message, :kind_of => [ String, FalseClass ], :default => false
attribute :failure_ok, :kind_of => [ TrueClass, FalseClass ], :default => true
attribute :play_before, :kind_of => String
attribute :play_after, :kind_of => String
attribute :paste, :kind_of => [ TrueClass, FalseClass ], :default => false 

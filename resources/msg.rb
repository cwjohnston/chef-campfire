def initialize(*args)
  super
  @action = :speak
end

actions :speak

attribute :subdomain, :kind_of => String, :required => true
attribute :token, :kind_of => String, :required => true
attribute :ssl, :kind_of => [ TrueClass, FalseClass ], :required => true
attribute :room, :kind_of => String, :required => true
attribute :message, :kind_of => [ String, FalseClass ], :default => false
attribute :failure_ok, :kind_of => [ TrueClass, FalseClass ], :default => true

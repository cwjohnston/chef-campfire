broach = chef_gem 'broach' do
  action :nothing
end

broach.run_action(:install)

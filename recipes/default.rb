tinder = gem_package 'tinder' do
    action :install
    version '1.4.4'
    action :nothing
end

tinder.run_action(:install)

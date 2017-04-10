resource_name :motd

property :message, String, default: "This is managed by Chef"

default_action :create

action :create do
  file '/etc/motd' do
    content message
    action :create
    only_if { ::File.exist?('/etc/motd') }
  end
end

action :delete do
  file '/etc/motd' do
    action :delete
    only_if { ::File.exist?('/etc/motd')}
  end
end 
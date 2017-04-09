if node['platform_family'] == 'debian'
  default['final']['applicationserver']['package_name'] = 'tomcat7'
else
  default['final']['applicationserver']['package_name'] = 'tomcat'
end

default['final']['applicationserver']['additional_packages'] = ['tomcat7-docs', 'tomcat7-admin', 'tomcat7-examples']

default['final']['applicationserver']['user'] = 'admin'
default['final']['applicationserver']['password'] = 'password'
default['final']['applicationserver']['role'] = 'manager-gui,admin-gui'
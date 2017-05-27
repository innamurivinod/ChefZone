#
# Cookbook:: weblogic_book
# Recipe:: weblogic_install
# https://oracle-base.com/articles/11g/weblogic-silent-installation-11g
# Copyright:: 2017, The Authors, All Rights Reserved.
apt_update 'update' do
    action :update
end

template '/etc/hosts' do
  source 'hosts.erb'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

user 'oracle' do
  comment 'user creation'
  uid '1100'
  home '/home/oracle'
  shell '/bin/bash'
  password 'oracle'
  action :create
end

group 'ubuntu' do
  action :modify
  members 'oracle'
  append true
end

bash 'name' do
  code <<-EOH
  mkdir -p /u01/app/oracle/middleware
  mkdir -p /u01/app/oracle/config/domains
  mkdir -p /u01/app/oracle/config/applications
  chown -R oracle:ubuntu /u01
  chmod -R 775 /u01/
  EOH
  action :run
end
bash 'name' do
  code <<-EOH
  export MW_HOME=/u01/app/oracle/middleware
  export WLS_HOME=$MW_HOME/wlserver_10.3
  export WL_HOME=$WLS_HOME
  export JAVA_HOME=/usr/lib/jvm/java-7-oracle-amd64
  export PATH=$JAVA_HOME/bin:$PATH
  EOH
  action :run
end

directory '/u01/software' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

cookbook_file '/u01/software/silent.xml' do
  source 'silent.xml'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

cookbook_file '/u01/software/wls1036_generic.jar' do
  source 'wls1036_generic.jar'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
bash 'run_jar' do
   code <<-EOH
   java -Xmx1024m -jar /u01/software/wls1036_generic.jar -mode=silent -silent_xml=/u01/software/silent.xml &   
   EOH
end
bash 'name' do
  code <<-EOH
  export MW_HOME=/u01/app/oracle/middleware
  export WLS_HOME=$MW_HOME/wlserver_10.3
  export WL_HOME=$WLS_HOME
  export JAVA_HOME=/usr/lib/jvm/java-7-oracle-amd64
  export PATH=$JAVA_HOME/bin:$PATH
  EOH
  action :run
end
execute "install my lib" do
  command "sh . $WLS_HOME/server/bin/setWLSEnv.sh"
end


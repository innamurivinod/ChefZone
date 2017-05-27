#
# Cookbook:: weblogic_book
# Recipe:: weblogic_domain
# http://onlineappsdba.com/index.php/2008/07/28/create-domain-in-oracle-weblogic/
# Copyright:: 2017, The Authors, All Rights Reserved.
cookbook_file '/u01/software/create_domain.py' do
  source 'create_domain.py'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
cookbook_file '/u01/software/myDomain.properties' do
  source 'myDomain.properties'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
bash 'name' do
  code <<-EOH
  export MW_HOME=/u01/app/oracle/middleware
  export WLS_HOME=$MW_HOME/wlserver_10.3
  export WL_HOME=$WLS_HOME
  export JAVA_HOME=/u01/app/oracle/jdk1.7.0_79
  export PATH=$JAVA_HOME/bin:$PATH
  export CONFIG_JVM_ARGS=-Djava.security.egd=file:/dev/./urandom
  . $WLS_HOME/server/bin/setWLSEnv.sh 
  EOH
  action :run
end
execute 'starts domain' do
  command 'java weblogic.WLST /u01/software/create_domain.py -p /u01/software/myDomain.properties'
  action :run
end


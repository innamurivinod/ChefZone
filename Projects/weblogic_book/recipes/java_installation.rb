#
# Cookbook:: weblogic_book
# Recipe:: java_installation
#
# Copyright:: 2017, The Authors, All Rights Reserved.
# install jdk6 from Oracle
java_ark "jdk" do
    url 'http://download.oracle.com/otn-pub/java/jdk/8u131-b11/jdk-8u131-linux-x64.tar.gz'
    checksum  '62b215bdfb48bace523723cdbb2157c665e6a25429c73828a32f00e587301236'
    app_home '/usr/local/java/default'
    bin_cmds ["java", "javac"]
    action :install
end
# set alternatives for java and javac commands
java_alternatives "set java alternatives" do
    java_location '/usr/local/java'
    bin_cmds ["java", "javac"]
    action :set
end
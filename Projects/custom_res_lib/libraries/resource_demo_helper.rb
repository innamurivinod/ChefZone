class Chef::Recipe::Homepage

  def self.exists?
    return ::File.exist?('/var/www/html/index.html')
  end
end


#class Chef::Recipe::PlatfomCheck

#  def self.is_debian?
#    return node[platform_family] == 'debian'
#  end
#end


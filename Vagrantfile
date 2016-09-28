Vagrant.configure("2") do |config|

  config.vm.define "web" do |web|
    web.vm.box = "ubuntu/trusty64"
    web.vm.network "forwarded_port", guest: 80, host: 80
    web.vm.provision "puppet" do |puppet|
      puppet.module_path = "modules"
      puppet.manifest_file = "web.pp" 
    end

  end

  config.vm.define "app" do |app|
    app.vm.box = "ubuntu/trusty64"
    app.vm.network "forwarded_port", guest: 8080, host: 8080
    app.vm.provision "puppet" do |puppet|
      puppet.module_path = "modules"
      puppet.manifest_file = "app.pp" 
    end
  end

end

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'aws'

# Provisioning script
provision_script = <<SCRIPT
#!/bin/bash

# install a few base packages
apt-get update
apt-get install vim puppet -y
#long provisioning command
echo Provisioning is complete
SCRIPT


Vagrant.configure("2") do |config|

  config.vm.provision :shell, :inline => provision_script
  config.vm.provider :aws do |aws, override|
    #AWS Settings
    aws.access_key_id = ENV['AWS_KEY']
    aws.secret_access_key = ENV['AWS_SECRET']
    aws.region = ENV['AWS_DEFAULT_REGION']
    aws.instance_type = "t2.small"
    aws.keypair_name = ENV['AWS_KEYNAME']
    aws.security_groups = ['http']
    aws.ami = "ami-2d39803a" # Ubuntu Server 14.04 LTS (HVM), SSD Volume Type
    #Override Settings
    override.ssh.username = "ubuntu"
    override.ssh.private_key_path = ENV['AWS_KEYPATH']
  end

  config.vm.define "web" do |web|
    web.vm.box = "dummybox-aws"
    web.vm.provision "puppet" do |puppet|
      puppet.module_path = "modules"
      puppet.manifest_file = "web.pp" 
    end
  end

  config.vm.define "app" do |app|
    app.vm.box = "dummybox-aws"
    app.vm.provision "puppet" do |puppet|
      puppet.module_path = "modules"
      puppet.manifest_file = "app.pp" 
    end

  end

end

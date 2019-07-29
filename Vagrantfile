# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "puppetlabs/centos-7.0-64-puppet"
  config.vm.network "forwarded_port", guest: 8000, host: 8000
  config.vm.hostname = "jenkins-server"

  config.vm.provider "virtualbox" do |vb|
     vb.memory = "4096"
     vb.cpus   = 2
     vb.name   = "jenkins-server"
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbooks/main.yml"
    ansible.extra_vars = {
       jenkins_hostname: "localhost",
       jenkins_http_port: 8000,
       jenkins_host_ip: "10.0.0.57" }
  end
end

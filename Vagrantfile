Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox"

  # database1
  config.vm.define "database1" do |v|
    v.vm.box = "debian/buster64"
    v.vm.hostname = "database1"
    v.vm.network "private_network", ip: "192.168.51.100"

    v.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "512"
      vb.name = "database1"
    end

    v.vm.provision "ansible" do |ansible|
      ansible.playbook = ".ansible/redis.yml"
    end
  end

  # kamailio1
  config.vm.define "kamailio1" do |v|
    v.vm.box = "debian/buster64"
    v.vm.hostname = "kamailio1"
    v.vm.network "private_network", ip: "192.168.51.11"

    v.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "512"
      vb.name = "kamailio1"
    end

    v.vm.provision "ansible" do |ansible|
      ansible.playbook = ".ansible/kamailio.yml"
    end
  end

  # kamailio2
  config.vm.define "kamailio2" do |v|
    v.vm.box = "debian/buster64"
    v.vm.hostname = "kamailio2"
    v.vm.network "private_network", ip: "192.168.51.12"

    v.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "512"
      vb.name = "kamailio2"
    end

    v.vm.provision "ansible" do |ansible|
      ansible.playbook = ".ansible/kamailio.yml"
    end
  end

  # asterisk1
  config.vm.define "asterisk1" do |v|
    v.vm.box = "debian/buster64"
    v.vm.hostname = "asterisk1"
    v.vm.network "private_network", ip: "192.168.51.21"

    v.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "512"
      vb.name = "asterisk1"
    end

    v.vm.provision "ansible" do |ansible|
      ansible.playbook = ".ansible/asterisk.yml"
    end
  end

  # asterisk2
  config.vm.define "asterisk2" do |v|
    v.vm.box = "debian/buster64"
    v.vm.hostname = "asterisk2"
    v.vm.network "private_network", ip: "192.168.51.22"

    v.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "512"
      vb.name = "asterisk2"
    end

    v.vm.provision "ansible" do |ansible|
      ansible.playbook = ".ansible/asterisk.yml"
    end
  end

end

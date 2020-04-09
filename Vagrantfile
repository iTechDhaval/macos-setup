Vagrant.configure("2") do |config|
    config.vm.box = "ramsey/macos-catalina"
    config.vm.box_version = "1.0.0"
    # config.vm.network "private_network", ip: "192.168.50.4",
    #     virtualbox__intnet: true
    config.vm.synced_folder ".", "/Users/vagrant/dotfiles",  type: "rsync",
        rsync__exclude: ".git/"
    config.vm.provider "virtualbox" do |vb|
        vb.gui = true
        vb.customize ['setextradata', :id, 'GUI/ScaleFactor', '1.25']
        # vb.customize ["setextradata", :id, "VBoxInternal2/EfiGopMode", "4"]
        # 0: 640x480
        # 1: 800x600
        # 2: 1024x768
        # 3: 1280x1024
        # 4: 1440x900
        # 5: 1920x1200

        # vb.customize ["setextradata", :id, "GUI/HiDPI/UnscaledOutput", "1"]

        # vb.customize ["modifyvm", :id, "--cpuidset", "1","000206a7","02100800","1fbae3bf","bfebfbff"]
        # vb.customize ["setextradata", :id, "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct", "MacBookPro11,3"]
        # vb.customize ["setextradata", :id, "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion", "1.0"]
        # vb.customize ["setextradata", :id, "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct", "qIloveapple"]
        # vb.customize ["setextradata", :id, "VBoxInternal/Devices/smc/0/Config/DeviceKey", "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"]
    end

    config.vm.provision 'shell', path: 'install.sh',
        name: 'Init', args: ["/Users/vagrant/"],
        privileged: false
end
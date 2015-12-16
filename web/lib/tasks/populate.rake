namespace :db do
  # Populate file and structure taken from PATS
  # First, this populate destroys everything in the database
  # Second, this creates some filters, orgs, and users who are approvers
  # Third, this creates normal users, their keys, their key's rights,
  # their's keys comments, and their keys approvals if applicable

  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do
    require 'faker'

    # Step 1: clear any old data in the db
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    # Invoke rake db:migrate
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:test:prepare'].invoke


    #Add Chargers
    lightning = Charger.new
    lightning.name = "Apple Lightning Charger"
    lightning.charger_photo = "http://www.naztech.com/image/cache/data/product-193/12204_5-500x500.jpg"
    lightning.save! 

    appleThirtyPin = Charger.new
    appleThirtyPin.name = "Apple 30pin Charger"
    appleThirtyPin.charger_photo = "http://imgsrv.worldstart.com/images/ct-images/2015/02/30pin.jpg"
    appleThirtyPin.save!

    microUSB = Charger.new
    microUSB.name = "microUSB charger"
    microUSB.charger_photo = "http://ridepowerusa.com/wp-content/uploads/2013/04/microUSB-charger.jpg"
    microUSB.save! 

    miniUSB = Charger.new
    miniUSB.name = "miniUSB charger"
    miniUSB.charger_photo = "http://sockitz.com.au/media/catalog/category/mini-usb-connector.jpg"
    miniUSB.save! 


    #Add Devices 
    lightningDeviceNames = ["iPhone 5", "iPhone 5C","iPhone 5S", "iPhone 6", "iPhone 6 Plus", "iPhone 6S", "iPhone 6S Plus", "iPod Touch (5th gen)", "iPod Nano (7th gen)", "iPad mini", "iPad 4", "iPad Air", "iPad Air 2" ]
    appleThirtyPinDeviceNames = ["iPhone 3G", "iPhone 3GS", "iPhone 4", "iPhone 4S", "iPod Touch (1st-4th gen)", "iPad", "iPad 2", "iPad 3"]
    microUSBDeviceNames = ["kindle", "Nook Color", "Blackberry"]
    miniUSBDeviceNames = []
    #https://support.apple.com/en-us/HT201700


    lightningDeviceNames.each do |d|
      device = Device.new
      device.name = d
      device.charger_id = lightning.id
      device.save!
    end

    appleThirtyPinDeviceNames.each do |d|
      device = Device.new
      device.name = d
      device.charger_id = appleThirtyPin.id
      device.save!
    end

    microUSBDeviceNames.each do |d|
      device = Device.new
      device.name = d
      device.charger_id = microUSB.id
      device.save!
    end

    miniUSBDeviceNames.each do |d|
      device = Device.new
      device.name = d
      device.charger_id = miniUSB.id
      device.save!
    end

    #Add Users 

    password = "secret"

    rand(20..40).times do
      user = User.new
      user.first_name = Faker::Name.first_name
      user.last_name = Faker::Name.last_name
      user.email = Faker::Internet.free_email(user.first_name)
      user.encrypted_password = User.new(:password => password).encrypted_password
      # 40.4434 N, 79.9436 W cmu coords
      # so that all users are around CMU somewhere

      user.longitude = rand * (79.940797-79.946762) - 79.940797
      user.latitude = rand * (40.444331-40.440265) + 40.440265
      user.rating = rand(3.0...5.0).round(2)
      user.facebook_mutual_friend_count = rand(1..40)
      user.save!(validate: false) #avoid password can't be blank validation

      #Give each user a few devices
      rand(1..3).times do
        d = OwnedDevice.new
        d.user_id = user.id
        d.allow_lending = true
        d.device_id = rand(1..Device.all.size)
        d.personal_device_name = user.first_name + "'s " + Device.find(d.device_id).name
        d.save!
      end
    end


    aditi = User.new
    aditi.first_name = "Aditi"
    aditi.last_name = "Sarkar"
    aditi.email = "aditi@cmu.edu"
    aditi.encrypted_password = User.new(:password => password).encrypted_password
    # baker hall...      40.441657, -79.946250
    aditi.longitude =  -79.946250
    aditi.latitude = 40.441657
    aditi.facebook_mutual_friend_count = rand(1..40)
    aditi.save!(validate: false) #avoid password can't be blank validation
    #Give each user a few devices
    rand(1..3).times do
      d = OwnedDevice.new
      d.user_id = aditi.id
      d.allow_lending = true
      d.device_id = rand(1..Device.all.size)
      d.personal_device_name = aditi.first_name + "'s " + Device.find(d.device_id).name
      d.save!
    end

    skylar = User.new
    skylar.first_name = "Skylar"
    skylar.last_name = "Weaver"
    skylar.email = "skylar@cmu.edu"
    skylar.encrypted_password = User.new(:password => password).encrypted_password
    # baker hall...     40.441620, -79.946524
    skylar.longitude =  -79.946524
    skylar.latitude = 40.441620
    skylar.facebook_mutual_friend_count = rand(1..40)
    skylar.save!(validate: false) #avoid password can't be blank validation
    #Give each user a few devices
    rand(1..3).times do
      d = OwnedDevice.new
      d.user_id = skylar.id
      d.allow_lending = true
      d.device_id = rand(1..Device.all.size)
      d.personal_device_name = skylar.first_name + "'s " + Device.find(d.device_id).name
      d.save!
    end

    nathan = User.new
    nathan.first_name = "Nathan"
    nathan.last_name = "Oh"
    nathan.email = "nathan@cmu.edu"
    nathan.encrypted_password = User.new(:password => password).encrypted_password
    # baker hall...      40.441631, -79.945593
    nathan.longitude =  -79.945593
    nathan.latitude = 40.441631
    nathan.facebook_mutual_friend_count = rand(1..40)
    nathan.save!(validate: false) #avoid password can't be blank validation
    #Give each user a few devices
    rand(1..3).times do
      d = OwnedDevice.new
      d.user_id = nathan.id
      d.allow_lending = true
      d.device_id = rand(1..Device.all.size)
      d.personal_device_name = nathan.first_name + "'s " + Device.find(d.device_id).name
      d.save!
    end

    all_user_ids = User.all.map {|u| u.id }

    #Transactions
    rand(100..150).times do
      t = Transaction.new
      t.borrower_id = all_user_ids.sample #random borrower
      t.lender_id = (all_user_ids - [t.borrower_id]).sample #random lender thats not the borrower
      t.charger_id = rand(1..Charger.all.size) #Charger.find(User.find(t.borrower_id).devices.sample.charger_id) #random charger that the borrower has
      t.length_time_requested = rand(10..120) #randpm time between 10 min and 2 hrs
      t.accepted = true
      t.start_time = Faker::Time.between(DateTime.now - 1, DateTime.now)
      if t.start_time < DateTime.now - 2.hours
        t.end_time = nil
      else 
        t.end_time = t.start_time + rand(600..7200) #end time is up to two hours after
      end
      t.save!
    end

  
  end
end

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
    lightning.charger_photo = "http://placehold.it/100x100.png/000"
    lightning.save! 

    appleThirtyPin = Charger.new
    appleThirtyPin.name = "Apple 30pin Charger"
    appleThirtyPin.charger_photo = "http://placehold.it/100x100.png/000"
    appleThirtyPin.save!

    microUSB = Charger.new
    microUSB.name = "microUSB charger"
    microUSB.charger_photo = "http://placehold.it/100x100.png/000"
    microUSB.save! 

    miniUSB = Charger.new
    miniUSB.name = "miniUSB charger"
    miniUSB.charger_photo = "http://placehold.it/100x100.png/000"
    miniUSB.save! 


    #Add Devices 
    lightningDeviceNames = ["iPhone 5", "iPhone 5C","iPhone 5S", "iPhone 6", "iPhone 6 Plus", "iPhone 6S", "iPhone 6S Plus", "iPod Touch (5th gen)", "iPod Nano (7th gen)", "iPad mini", "iPad 4", "iPad Air", "iPad Air 2" ]
    appleThirtyPinDeviceNames = ["iPhone 3G", "iPhone 3GS", "iPhone 4", "iPhone 4S", "iPod Touch (1st-4th gen)", "iPad", "iPad 2", "iPad 3"]
    microUSBDeviceNames = []
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
      user.save!(validate: false) #avoid password can't be blank validation

      #Give each user a few devices
      rand(1..3).times do
        d = OwnedDevice.new
        d.user_id = user.id
        d.device_id = rand(1..Device.all.size)
        d.personal_device_name = user.first_name + "'s " + Device.find(d.device_id).name
        d.save!
      end
    end


  
  end
end

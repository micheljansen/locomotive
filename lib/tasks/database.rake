namespace :db do

  desc 'Bootstrap the database with default data'
  task :bootstrap => ['db:automigrate'] do
    begin
      gem 'fastercsv', '~>1.4.0'
      require 'fastercsv'
    rescue LoadError
      puts 'Please install the FasterCSV gem to use db:bootstrap'
      exit
    end

    csv = FasterCSV.foreach('db/default/operating_systems.csv') do |row|
      os_name = row[0]
      os_vendor = row[1]
      Locomotive::OperatingSystem.create(:name => os_name, :vendor_name => os_vendor)
    end
  end

  desc 'Populate the database with example data'
  task :populate => ['db:bootstrap']

end

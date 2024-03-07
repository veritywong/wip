class InstallFuzzystrmatchContribPackage < ActiveRecord::Migration[7.1]
    def up
      execute "CREATE EXTENSION fuzzystrmatch;"
    end
  
    def down
      execute "DROP EXTENSION fuzzystrmatch;"
    end
  end
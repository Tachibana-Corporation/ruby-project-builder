#Usage:
#  rails new APP_PATH [options]

#Options:
#      [--skip-namespace], [--no-skip-namespace]              # Skip namespace (affects only isolated applications)
#  -r, [--ruby=PATH]                                          # Path to the Ruby binary of your choice
                                                              # Default: C:/Ruby26-x64/bin/ruby.exe
#  -m, [--template=TEMPLATE]                                  # Path to some application template (can be a filesystem path or URL)
#  -d, [--database=DATABASE]                                  # Preconfigure for selected database (options: mysql/postgresql/sqlite3/oracle/frontbase/ibm_db/sqlserver/jdbcmysql/jdbcsqlite3/jdbcpostgresql/jdbc)
                                                              # Default: sqlite3
#      [--skip-gemfile], [--no-skip-gemfile]                  # Don't create a Gemfile
#  -G, [--skip-git], [--no-skip-git]                          # Skip .gitignore file
#      [--skip-keeps], [--no-skip-keeps]                      # Skip source control .keep files
#  -M, [--skip-action-mailer], [--no-skip-action-mailer]      # Skip Action Mailer files
#      [--skip-action-mailbox], [--no-skip-action-mailbox]    # Skip Action Mailbox gem
#      [--skip-action-text], [--no-skip-action-text]          # Skip Action Text gem
#  -O, [--skip-active-record], [--no-skip-active-record]      # Skip Active Record files
#      [--skip-active-storage], [--no-skip-active-storage]    # Skip Active Storage files
#  -P, [--skip-puma], [--no-skip-puma]                        # Skip Puma related files
#  -C, [--skip-action-cable], [--no-skip-action-cable]        # Skip Action Cable files
#  -S, [--skip-sprockets], [--no-skip-sprockets]              # Skip Sprockets files
#      [--skip-spring], [--no-skip-spring]                    # Don't install Spring application preloader
#      [--skip-listen], [--no-skip-listen]                    # Don't generate configuration that depends on the listen gem
#  -J, [--skip-javascript], [--no-skip-javascript]            # Skip JavaScript files
#      [--skip-turbolinks], [--no-skip-turbolinks]            # Skip turbolinks gem
#  -T, [--skip-test], [--no-skip-test]                        # Skip test files
#      [--skip-system-test], [--no-skip-system-test]          # Skip system test files
#      [--skip-bootsnap], [--no-skip-bootsnap]                # Skip bootsnap gem
#      [--dev], [--no-dev]                                    # Setup the application with Gemfile pointing to your Rails checkout
#      [--edge], [--no-edge]                                  # Setup the application with Gemfile pointing to Rails repository
#      [--rc=RC]                                              # Path to file containing extra configuration options for rails command
#      [--no-rc], [--no-no-rc]                                # Skip loading of extra configuration options from .railsrc file
#      [--api], [--no-api]                                    # Preconfigure smaller stack for API only apps
#  -B, [--skip-bundle], [--no-skip-bundle]                    # Don't run bundle install
#  --webpacker, [--webpack=WEBPACK]                           # Preconfigure Webpack with a particular framework (options: react, vue, angular, elm, stimulus)
#      [--skip-webpack-install], [--no-skip-webpack-install]  # Don't run Webpack install
#
#Runtime options:
#  -f, [--force]                    # Overwrite files that already exist
#  -p, [--pretend], [--no-pretend]  # Run but do not make any changes
#  -q, [--quiet], [--no-quiet]      # Suppress status output
#  -s, [--skip], [--no-skip]        # Skip files that already exist
#
#Rails options:
#  -h, [--help], [--no-help]        # Show this help message and quit
#  -v, [--version], [--no-version]  # Show Rails version number and quit
#
#Description:
#    The 'rails new' command creates a new Rails application with a default
#    directory structure and configuration at the path you specify.
#
#    You can specify extra command-line arguments to be used every time
#    'rails new' runs in the .railsrc configuration file in your home directory.
#
#    Note that the arguments specified in the .railsrc file don't affect the
#    defaults values shown above in this help message.
#
#Example:
#    rails new ~/Code/Ruby/weblog
#
#    This generates a skeletal Rails installation in ~/Code/Ruby/weblog.

puts "Project Types: API, Bare, Default"
print "Project Type: "
app_type = gets.chomp.downcase
puts "Database: mysql, postgresql, sqlite3, oracle, frontbase, ibm_db, sqlserver, jdbcmysql, jdbcsqlite3, jdbcpostgresql, jdbc, none"
database = gets.chomp.downcase
print "Project Type: "
app_type = gets.chomp.downcase
print "App Name: "
app_name = gets.chomp
case app_type
  when "api"
    if database != "none"
      system("rails new #{app_name} --api -d #{database} -M -S -J")
    else
      system("rails new #{app_name} --api -O -M -S -J")
    end
  when "bare"
    system("rails new #{app_name} -O -M -S -J --skip-test --skip-system-test --skip-bootsnap --skip-webpack-install")
    Dir.mkdir("#{app_name}/app/assets/javascripts") unless Dir.exist?("#{app_name}/app/assets/javascripts")
    gemfile = "// This is a manifest file that'll be compiled into application.js, which will include all the files
    // listed below.
    //
    // It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
    // compiled file.
    //
    //= require_tree ."
    if !File.exists?("#{app_name}/app/assets/javascripts/application.js")
        File.open("#{app_name}/app/assets/javascripts/application.js", "w") do |f|
            f.puts gemfile
        end
    end
    gemfile = "//= link_tree ../images
    //= link_directory ../javascripts .js
    //= link_directory ../stylesheets .css"
    if !File.exists?("#{app_name}/app/assets/config/manifest.js")
        File.open("#{app_name}/app/assets/config/manifest.js", "w") do |f|
            f.puts gemfile
        end
    else
      File.delete("#{app_name}/app/assets/config/manifest.js")
      File.open("#{app_name}/app/assets/config/manifest.js", "w") do |f|
          f.puts gemfile
      end
    end
  when "default"
    system("rails new #{app_name}")
  else
    puts "Invalid option"
end

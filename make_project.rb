print "App Name: "
app_name = gets.chomp

# Creating the top directory
Dir.mkdir("#{app_name}") unless Dir.exist?("#{app_name}")
puts "\n\t#{app_name} directory created."

# Creating the sub directorys under the top directory
Dir.mkdir("#{app_name}/app") unless Dir.exist?("#{app_name}/app")
puts "\t#{app_name}/app directory created."

Dir.mkdir("#{app_name}/bin") unless Dir.exist?("#{app_name}/bin")
puts "\t#{app_name}/bin directory created."

Dir.mkdir("#{app_name}/config") unless Dir.exist?("#{app_name}/config")
puts "\t#{app_name}/config directory created."

#Dir.mkdir("#{app_name}/db") unless Dir.exist?("#{app_name}/db")
#puts "\t#{app_name}/db directory created."

Dir.mkdir("#{app_name}/lib") unless Dir.exist?("#{app_name}/lib")
puts "\t#{app_name}/lib directory created."

Dir.mkdir("#{app_name}/log") unless Dir.exist?("#{app_name}/log")
puts "\t#{app_name}/log directory created."

#Dir.mkdir("#{app_name}/test") unless Dir.exist?("#{app_name}/test")
#puts "\t#{app_name}/test directory created."

#Dir.mkdir("#{app_name}/tmp") unless Dir.exist?("#{app_name}/tmp")
#puts "\t#{app_name}/tmp directory created."

# Creating the sub directories under the app sub directory of the top directory
Dir.mkdir("#{app_name}/app/assets") unless Dir.exist?("#{app_name}/app/assets")
puts "\t#{app_name}/app/assets directory created."

Dir.mkdir("#{app_name}/app/controllers") unless Dir.exist?("#{app_name}/app/controllers")
puts "\t#{app_name}/app/controllers directory created."

Dir.mkdir("#{app_name}/app/models") unless Dir.exist?("#{app_name}/app/models")
puts "\t#{app_name}/app/models directory created."

Dir.mkdir("#{app_name}/app/views") unless Dir.exist?("#{app_name}/app/views")
puts "\t#{app_name}/app/views directory created."

# Create Gemfile
source = "source 'https://rubygems.org'\n"
github = "git_source(:github) { |repo| \"https://github.com/\#{repo}.git\" }\n\n"
ruby_version = "ruby '#{RUBY_VERSION}'\n"

gemfile = source + github + ruby_version

if !File.exists?("#{app_name}/Gemfile")
    File.open("#{app_name}/Gemfile", "w") do |f|
        f.puts gemfile
    end
end
puts "\tGemfile created."

# gemfile.lock?
# only needed after a bundle install

# Add a check to see if git is installed
#init git dir here
system "git init"
puts "\tGit initiated"

# Create .gitignore file
git_ignore = ""
if !File.exists?("#{app_name}/Gemfile")
    File.open("#{app_name}/Gemfile", "w") do |f|
        f.puts gemfile
    end
end
puts "\t.gitignore created."

#license?
#puts "\tLicense created."

# Create readme.md
readme = ""
if !File.exists?("#{app_name}/README.md")
    File.open("#{app_name}/README.md", "w") do |f|
        f.puts readme
    end
end
puts "\tReadme.md created."

puts "\nFinished."

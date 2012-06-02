require 'rake'
require 'erb'
require 'fileutils'
include FileUtils

desc "Install into the users home"
task :install do
	Dir['home/*'].each do |entry|
		file = File.basename( entry )
		case file
			when 'Rakefile', 'README'
				next
			else
				puts( "Processing file #{file}" )
				puts( "Linking #{entry} to " + home_slash(".#{file}") )
				create_link entry, home_slash(".#{file}")
		end
	end
end

def home() ENV['HOME'] end
#def home() "/tmp/dotfiles" end
def home_slash(name) File.join(home, name) end

def create_link(source, target)
	action = if File.symlink?(target)
		if $replace_all
			:overwrite
		else
			print "Overwrite #{target}? [yNqa] "
			case $stdin.gets.chomp
				when 'a' then ($replace_all = true) and :overwrite
				when 'y' then :overwrite
				when 'q' then exit
				else :skip
			end
		end
	else
		:link
	end

	if [:link, :overwrite].include? action
		if action == :overwrite
			puts "Overwriting #{target}"
			rm target, :verbose => false
		end
		ln_s File.join(Dir.pwd, source), target, :verbose => false
	elsif action == :skip
		puts "skipping #{target}"
	end
end


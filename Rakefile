require 'rake'
require 'fileutils'
include FileUtils

desc "Install into the users home"
task :install do
  Dir[here( 'home/*' )].each do |entry|
    file = File.basename( entry )
    link_file( entry, home_slash( ".#{file}" ) ) unless ignore_file?( file )
  end
end

def home() ENV['HOME'] end

def home_slash( name ) File.join( home, name ) end

def here( *paths )
  File.expand_path( File.join( File.dirname( __FILE__ ), *paths ) )
end

def ignore_file?( file )
  [ 'Rakefile', 'README', 'README.md' ].include?( file )
end

def link_file( source, target )
  action = if File.symlink?( target )
    if $replace_all
      :overwrite
    else
      print "Overwrite #{target}? [yNqa] "
      case $stdin.gets.chomp
        when 'a' then ( $replace_all = true ) and :overwrite
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
    ln_s source, target, :verbose => false
  elsif action == :skip
    puts "skipping #{target}"
  end
end


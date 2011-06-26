require 'rake/clean'

CLEAN.include('~/.vim', '~/.vimrc', '~/.gitignore')

IGNORE = [/\.gitignore$/, /Rakefile$/, /README$/, /.gitmodules$/]

files = `git ls-files`.split("\n")
files.reject! { |f| IGNORE.any? { |re| f.match(re) } }
files.each {|s| s.sub! /(\/.*)+/, ''}
files.uniq!

desc 'install symlink to dotfiles in home directory'
task :install_symlinks do
  files.each do |file|
    begin
      printf "making symbolic link in home director to .#{file}... "
      FileUtils.ln_s File.join(File.dirname(__FILE__), file), File.join(ENV['HOME'], ".#{file}")
      puts "done"

    rescue
      puts ".#{file} already exists in your home directory.  Please remove it, or run `rake clobber`."
    end
  end
end

desc 'initialize vim plugin submodules'
task :initialize_plugins do
	puts 'updating submodule plugins'
	puts `git submodule init`
	puts 'done'
end

desc 'install dotfiles'
task :install => [:install_symlinks, :initialize_plugins, :update]

desc 'updates the vim pluggins included as git submodules'
task :update_plugins do
  puts 'updating submodule plugins'
  puts `git submodule update`
  puts 'done'
end

desc 'pull latest updates from git repository'
task :update_repository do
  puts 'updating local git repository...'
  puts `git pull`
  puts 'done'
end

desc 'pull latest from git repository, and update vim plugin submodules'
task :update => [:update_repository, :update_plugins]

desc 'remove dotfile symlinks in home directory' 
task :clean do
  files.each do |file|
    path = File.join(ENV['HOME'], ".#{file}")
    if File.symlink? path
      printf "removing .#{file} from the home directory... "
      FileUtils.rm_f path
      puts "done"
    end
  end
end

desc 'remove dotfiles in home directory'
task :clobber do
  files.each do |file|
    printf "removing .#{file} from the home directory... "
    FileUtils.rm_f File.join(ENV['HOME'], ".#{file}")
    puts "done"
  end
end

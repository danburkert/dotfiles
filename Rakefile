require 'rake/clean'

IGNORE = [/\.gitignore$/, /Rakefile$/, /README$/, /.git$/]

files = `git ls-files`.split("\n")
files.reject! { |f| IGNORE.any? { |re| f.match re } }
files.each {|s| s.sub! /(\/.*)+/, ''}
files.uniq!

desc 'install symlinks to dotfiles in home directory'
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

desc 'install dotfiles'
task :install => [:update, :install_symlinks]
task :default => :install

desc 'update dotfiles from github'
task :update do
  puts "updating dotfiles... "
  `git pull`
  puts "done"
end

desc 'remove dotfile symlinks in home directory'
task :clean do
  files.each do |file|
    path = File.join ENV['HOME'], ".#{file}"
    if File.symlink? path
      printf "removing .#{file} from the home directory... "
      FileUtils.rm_f path
      puts "done"
    end
  end
end

desc 'remove dotfiles in home directory (Warning: will delete original files)'
task :clobber do
  files.each do |file|
    printf "removing .#{file} from the home directory... "
    FileUtils.rm_f File.join(ENV['HOME'], ".#{file}")
    puts "done"
  end
end

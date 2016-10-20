require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rake/packagetask'
require 'anpan'

RSpec::Core::RakeTask.new(:spec)

TABLES = %i(anpan.txt dvorakjp.txt google_japanese_input.txt)
TABLE_PATHS = TABLES.map(&:to_s)
package_task = Rake::PackageTask.new("tables", Anpan::VERSION) do |p|
  p.need_zip = true
  p.package_files.include TABLE_PATHS
end

task default: :package

DIST_DIR = 'dist'
file package_task.package_dir_path => TABLES

def output_to_file(filename, conf)
  path = "#{filename}"
  puts filename
  File.open(path, 'w') do |file|
    file.write Anpan.new(conf).render
  end
end

task :dist_dir do
  Dir.mkdir DIST_DIR unless File.exists? DIST_DIR
end

file 'anpan.txt' => :dist_dir do
  output_to_file 'anpan.txt', Anpan::An::CONF
end

file 'dvorakjp.txt' => :dist_dir do
  output_to_file 'dvorakjp.txt', Anpan::An::DVORAKJP
end

file 'google_japanese_input.txt' => :dist_dir do
  output_to_file 'google_japanese_input.txt', Anpan::An::GOOGLE_JAPANESE
end

task :clean do
  rm_rf 'pkg'
  TABLES.each {|t| rm_rf t.to_s }
end

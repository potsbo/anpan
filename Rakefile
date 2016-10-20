require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rake/packagetask'
require 'anpan'

RSpec::Core::RakeTask.new(:spec)

task default: :package

CONFS = {
  'anpan.txt': Anpan::An::CONF,
  'dvorakjp.txt': Anpan::An::DVORAKJP,
  'google_japanese_input.txt': Anpan::An::GOOGLE_JAPANESE,
}

TABLE_PATHS = CONFS.keys.map(&:to_s)
package_task = Rake::PackageTask.new("tables", Anpan::VERSION) do |p|
  p.need_zip = true
  p.package_files.include TABLE_PATHS
end

file package_task.package_dir_path => TABLE_PATHS

def output_to_file(filename, conf)
  puts filename
  File.open(filename.to_s, 'w') do |file|
    file.write Anpan.new(conf).render
  end
end

CONFS.each do |filename, conf|
  file filename do
    output_to_file filename, conf
  end
end

task :clean do
  rm_rf 'pkg'
  TABLE_PATHS.each {|t| rm_rf t.to_s }
end

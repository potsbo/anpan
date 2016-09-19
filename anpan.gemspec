# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'anpan/version'

Gem::Specification.new do |spec|
  spec.name          = "anpan"
  spec.version       = Anpan::VERSION
  spec.authors       = ["Shimpei Otsubo"]
  spec.email         = ["potsbo@gmail.com"]

  spec.summary       = %q{Romaji table renderer to use extended DvorakJP}
  spec.description   = %q{Romaji table renderer to use extended DvorakJP}
  spec.homepage      = "https://github.com/potsbo/anpan"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end

# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "qa_cube/version"

Gem::Specification.new do |spec|
  spec.name          = "qa_cube"
  spec.version       = QaCube::VERSION
  spec.authors       = ["Bennett Talpers"]
  spec.email         = ["bennett.talpers@gmail.com"]

  spec.summary       = %q{A collection of QA tools.}
  spec.description   = %q{A collection of QA tooling. Currently only includes sheetsappender, which is a tool for appending data to an existing google sheets page}
  spec.homepage      = "https://github.com/btalpers/qa_cube"

  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "google-api-client", "~> 0.19.1"
  spec.add_runtime_dependency "googleauth", "~> 0.6.2"
end

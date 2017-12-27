# -*- encoding: utf-8 -*-
require File.expand_path('../lib/qa_cube/version', __FILE__)

Gem::Specification.new do |gem|
	gem.authors       = ["Bennett Talpers"]
	gem.email         = ["bennett.talpers@gmail.com"]
	gem.description   = %q{Allows a user to easily append data to a Google Sheets sheet.}
	gem.summary       = %q{Code taken from the examples found on https://developers.google.com/sheets/api/samples and parameterized, so it can be plugged-in easily to automated QA projects.}
	gem.homepage      = ""

	gem.files         = `git ls-files`.split($\)
	gem.name          = "qa_cube"
	gem.require_paths = ["lib"]
	gem.version       = QACube::VERSION
end

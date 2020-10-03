lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "learning_360/version"

Gem::Specification.new do |spec|
  spec.name          = "learning_360"
  spec.version       = Learning360::VERSION
  spec.authors       = ["david geismar"]
  spec.email         = ["davidgeismar@hotmail.fr"]

  spec.summary       = "wrapper for 360 learning api"
  spec.description   = "wrapper for 360 learning api"
  # spec.homepage      = "homepage"

  spec.metadata["allowed_push_host"] = "not yet implemented"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "not yet"
  # spec.metadata["changelog_uri"] = "not yet"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end

Gem::Specification.new do |gem| 
  gem.authors     = ["dkulchenko"]
  gem.email       = ["daniilk@activestate.com"]
  gem.description = "A plaintext codec for the Steno logger."
  gem.summary     = "A plaintext codec for the Steno logger."

  glob = Dir["**/*"].
    reject { |f| File.directory?(f) }

  gem.files         = glob
  gem.name          = "steno-codec-text"
  gem.require_paths = ["lib"]
  gem.version       = 0.1

  gem.add_dependency("steno", "~> 1.1.0")
end
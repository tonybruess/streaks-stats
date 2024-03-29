
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "streaks/stats/version"

Gem::Specification.new do |spec|
  spec.name          = "streaks-stats"
  spec.version       = Streaks::Stats::VERSION
  spec.authors       = ["Tony"]
  spec.email         = ["tonybruess@gmail.com"]

  spec.summary       = %q{Analyzes data from the Streaks app for iOS}
  spec.homepage      = "https://github.com/tonybruess/streaks-stats"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = ["streaks-stats"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cbs_fantasy_sports_api_token_fetcher'

Gem::Specification.new do |spec|
  spec.name          = "cbs_fantasy_sports_api_token_fetcher"
  spec.version       = CbsFantasySportsApiTokenFetcher::VERSION
  spec.authors       = ["Geoff Harcourt"]
  spec.email         = ["geoff.harcourt@gmail.com"]

  spec.summary       = %q{Retrieve your CBS v3 Fantasy Sports API token from CBS."}
  spec.description   = %q{CBS Sports' (now deprecated, but still available) v3 Fantasy Sports API has lots of useful data about your league that you need an API token to programatically access.}
  spec.homepage      = "https://github.com/geoffharcourt/cbs_fantasy_sports_api_token_fetcher"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "httparty", "~> 0.14.0"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end

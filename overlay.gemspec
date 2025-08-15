# frozen_string_literal: true

require_relative "lib/overlay/version"

Gem::Specification.new do |spec|
  spec.name = "overlay"
  spec.version = Overlay::VERSION
  spec.authors = ["overlay"]
  spec.email = ["contact@overlay.fun"]

  spec.summary = "Overlay is a library for Web3 development that makes it easy to implement wallet creation, token and NFT issuance, minting, burning, and transfers."
  spec.description = "Overlay enables simple Web3 development across multiple blockchains, including Solana, Ethereum, BSC, Base, Polygon, and Bera. It does not require signing transactions with wallets, which is typically necessary in blockchain development. Additionally, Overlay does not store any database, implements high-level security features, and securely encrypts wallet information to safely execute transactions."
  spec.homepage = "https://docs.overlay.fun"
  spec.required_ruby_version = ">= 3.3.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/overlaydotfun/overlay-ruby"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "httpx"
end

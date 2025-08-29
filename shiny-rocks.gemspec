# frozen_string_literal: true

require_relative "lib/shiny/rocks/version"

Gem::Specification.new do |spec|
  spec.name = "shiny-rocks"
  spec.version = Shiny::Rocks::VERSION
  spec.authors = ["Ranjan"]
  spec.email = ["devnull@gembro.live"]

  spec.summary = "Tiny demo gem for private Gemstash / Cloudsmith AoT"
  spec.description = "Demo gem for the gembro.live private registry."
  spec.homepage = "https://gembro.live"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://gembro.live"
  spec.metadata["changelog_uri"] = "https://gembro.live"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  # Build file list: prefer git when available, otherwise fall back to glob
  files =
    begin
      inside_git = system("git", "rev-parse", "--is-inside-work-tree", out: File::NULL, err: File::NULL)
      if inside_git
        IO.popen(%w[git ls-files -z], chdir: __dir__, err: File::NULL) { |ls| ls.read.split("\x0") }
      else
        Dir.chdir(__dir__) do
          Dir.glob("{bin,lib}/**/*", File::FNM_DOTMATCH).reject { |f| File.directory?(f) }
        end
      end
    rescue
      Dir.chdir(__dir__) do
        Dir.glob("{bin,lib}/**/*", File::FNM_DOTMATCH).reject { |f| File.directory?(f) }
      end
    end

  # Exclude dev/test files but keep bin/ and lib/
  spec.files = files.reject do |f|
    (f == gemspec) ||
      f.start_with?(*%w[test/ spec/ features/ .git appveyor Gemfile])
  end
  spec.bindir = "bin"
  spec.executables = spec.files.grep(%r{\Abin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end

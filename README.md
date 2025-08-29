# shiny-rocks

✨ A tiny demo Ruby gem that doubles as a crash course on **package management** and **artifacts**.

## What is Package Management?

Think of package management like ordering food delivery:
- 🍱 **Package** = the meal (code + metadata).
- 🛵 **Package manager** (RubyGems, npm, pip, etc.) = the delivery service.
- 🏠 **Repository** (Geminabox, Cloudsmith) = the restaurant / warehouse where meals are stored.
- 🗂️ **Metadata** (gemspec, version, deps) = the menu.

A package (or artifact) is just code + version + some metadata, bundled so it can be shared and reused easily.

### Why Package Management Exists

Package management exists to save developers from reinventing the wheel. Instead of writing common functionality from scratch, you can reuse code that others have already written, tested, and shared. This promotes collaboration and speeds up development. Additionally, package management helps with security by allowing maintainers to push updates and patches that users can easily consume.

### The Lifecycle of a Package

The lifecycle of a package typically involves:
- **Authoring**: Writing the code and metadata.
- **Building**: Packaging the code into a distributable format (e.g., a gem, npm package).
- **Publishing**: Uploading the package to a repository for others to access.
- **Consuming**: Installing and using the package in projects.

### Other Ecosystems

Package management is not unique to Ruby. Some popular ecosystems include:
- **npm** for JavaScript
- **pip** for Python
- **Maven** for Java
- **NuGet** for .NET

Each ecosystem has its own package managers and repositories tailored to their languages and workflows.

### Package Manager vs Repository

A **package manager** is the tool you use to interact with packages — installing, updating, and managing dependencies. A **repository** is where the packages are stored and served from. Think of the package manager as the delivery driver, and the repository as the restaurant kitchen.

### Real-World Fun Analogy Continuation

Imagine subscribing to a meal service where you can order different recipes (versions) of your favorite dish. Sometimes, a new recipe comes out with better ingredients (features) or fixes (bug patches). You can choose which version to order, and the delivery service ensures you get exactly what you asked for. Package management works similarly, letting you pick versions and manage updates seamlessly.

## What This Repo Contains

```
shiny-rocks/
├── bin/
│   └── shiny-rocks      # the CLI executable (run commands like --version, hello, greet, info)
├── lib/
│   └── shiny/
│       ├── rocks.rb     # main library entrypoint
│       └── rocks/version.rb # version constant (where we bump versions!)
├── shiny-rocks.gemspec  # gemspec: defines name, version, authors, executables, files to package
├── Gemfile              # declares dependencies for development
├── Rakefile             # tasks (like build, install, release)
├── README.md            # this guide
└── .gitignore           # ignores cache/log/temp files
```

## How It Works

- `bin/shiny-rocks` is linked into your PATH so you can run it as a CLI.
- `lib/shiny/rocks.rb` loads your library code.
- `lib/shiny/rocks/version.rb` defines `Shiny::Rocks::VERSION`, used everywhere.
- `shiny-rocks.gemspec` tells RubyGems what to include in the package.

## Commands We Use

### Build the gem
```bash
gem build shiny-rocks.gemspec
# => shiny-rocks-0.1.0.gem
```

### Install locally
```bash
gem install ./shiny-rocks-0.1.0.gem
shiny-rocks --version
```

### Push to a private registry
```bash
gem inabox shiny-rocks-0.1.0.gem -g https://gembro.live/
```

## Why is this Fun?

Because instead of abstract jargon, you can literally:
- Run `shiny-rocks hello`
- See ✨ "Hello from shiny-rocks" ✨
- Know you just installed a **real artifact** into your system!

## Learnings Recap

- **Package** = code + metadata.
- **Artifact** = fancy name for a built package (binary, gem, tarball, etc.).
- **Registry** = where packages live.
- **Manager** = tool to fetch/install them.

## License

MIT © Ranjan

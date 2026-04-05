class Devjournal < Formula
  desc "Automatic intelligent work diary for local git repositories"
  homepage "https://github.com/godart-corentin/dev-journal"
  url "https://github.com/godart-corentin/dev-journal/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "6ba0ef191f92e36b4e87816a2d4184ea330b96844b852fd4b0d419bfde049cef"
  license "Apache-2.0"
  head "https://github.com/godart-corentin/dev-journal.git", branch: "main"

  depends_on "pkgconf" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")

    generate_completions_from_executable(bin/"devjournal", "completions", shells: [:bash, :zsh, :fish])
  end

  test do
    config_path = shell_output("#{bin}/devjournal config").strip
    assert_match "devjournal", config_path
  end
end

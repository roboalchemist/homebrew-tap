class Md2notion < Formula
  desc "CLI tool to convert Markdown documents to Notion pages"
  homepage "https://github.com/roboalchemist/md2notion"
  url "https://github.com/roboalchemist/md2notion/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "7af2cf75dbfa509ea1865c92d7647cb1cc060c3c2da595eaf2a08ceae15ac396"
  license "MIT"

  depends_on "python@3.12"

  def install
    system Formula["python@3.12"].opt_bin/"pip3.12", "install",
           "--prefix=#{prefix}",
           "--no-deps",
           "."

    # Install dependencies
    system Formula["python@3.12"].opt_bin/"pip3.12", "install",
           "--target=#{libexec}/vendor",
           "marko>=2.0.0",
           "click>=8.1.0",
           "python-dotenv>=1.0.0",
           "httpx>=0.24.0"

    # Create wrapper that includes vendor path
    (bin/"md2notion").unlink if (bin/"md2notion").exist?
    (bin/"md2notion").write <<~EOS
      #!/bin/bash
      export PYTHONPATH="#{libexec}/vendor:#{prefix}/lib/python3.12/site-packages:$PYTHONPATH"
      exec "#{Formula["python@3.12"].opt_bin}/python3.12" -m md2notion "$@"
    EOS
  end

  def caveats
    <<~EOS
      Set your Notion API token:
        export NOTION_API_TOKEN="your-notion-integration-token"

      Get a token from: https://www.notion.so/my-integrations
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/md2notion --help")
  end
end

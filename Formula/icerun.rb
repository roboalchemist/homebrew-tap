class Icerun < Formula
  desc "Firecrawl-compatible local web scraper — proxy rotation, 6 parsers, LLM extraction"
  homepage "https://github.com/roboalchemist/icerun"
  url "https://github.com/roboalchemist/icerun/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "396a2a7d917777710bfce56e30b337b770ee42e8e2832d035c3494ada490180c"
  license "MIT"

  depends_on "python@3.12"

  def install
    system Formula["python@3.12"].opt_bin/"python3.12", "-m", "venv", libexec/"venv"
    system "#{libexec}/venv/bin/pip", "install", "--upgrade", "pip"
    system "#{libexec}/venv/bin/pip", "install", "."

    bin.install_symlink "#{libexec}/venv/bin/icerun"
  end

  def caveats
    <<~EOS
      Optional extras:
        Browser mode (camoufox):  pip install 'icerun[browser]'
        LLM extraction:           pip install 'icerun[extract]'
        PDF support:              pip install 'icerun[pdf]'
        DDG search fallback:      pip install 'icerun[search]'

      Key environment variables:
        ICER_PROXY=http://proxy:port        # proxy for all fetches
        ICER_PROXY_API_KEY=...              # Webshare API key for proxy rotation
        SERPER_API_KEY=...                  # Serper.dev for icerun search
        ANTHROPIC_API_KEY=...              # for icerun scrape --extract-schema

      Quick start:
        icerun scrape https://example.com
        icerun batch urls.txt --output ./out/
        icerun crawl https://example.com --depth 3 --output ./out/
        icerun map https://example.com
    EOS
  end

  test do
    assert_match "icerun", shell_output("#{bin}/icerun --help 2>&1")
  end
end

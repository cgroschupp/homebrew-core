class Wiggle < Formula
  desc "Program for applying patches with conflicting changes"
  homepage "http://neil.brown.name/blog/20100324064620"
  url "http://neil.brown.name/wiggle/wiggle-1.0.tar.gz"
  sha256 "44c97b2d47a109c709cdd4181d9ba941fee50dbb64448018b91d4a2fffe69cf2"

  bottle do
    cellar :any_skip_relocation
    sha256 "7e832c2b0e4e4564f15c3a66b1d0b78c309a0f28ca548b5e39b6967bdf12a542" => :el_capitan
    sha256 "e6799084357708eb5142ec5c1104f43c9fdcc0d953f0b80c458e931f53e210e8" => :yosemite
    sha256 "09c23ec2dce1bc70a93671b85780f47f9bbb24c024a48cbfa9c3a13b79b048a5" => :mavericks
  end

  # All three patches are upstream commits
  patch do
    url "https://github.com/neilbrown/wiggle/commit/16bb4be1c93be24917669d63ab68dd7d77597b63.diff"
    sha256 "09c9e028c22ae9ee37c5f7636a79899862264bf45cae2ed3fb9c47535d092467"
  end

  patch do
    url "https://github.com/neilbrown/wiggle/commit/e010f2ffa78b0e50eff5a9e664f9de27bb790035.diff"
    sha256 "33f9ef59e90000e2c10485ab358fee2014d8525428f77329399389f2acaa7290"
  end

  patch do
    url "https://github.com/neilbrown/wiggle/commit/351535d3489f4583a49891726616375e249ab1f3.diff"
    sha256 "4ee9d9df6099be99ac6b4eee5f17d6ea5d885288400fb3a49835cf72aaf6bb18"
  end

  def install
    system "make", "OptDbg=#{ENV.cflags}", "wiggle", "wiggle.man", "test"
    bin.install "wiggle"
    man1.install "wiggle.1"
  end
end

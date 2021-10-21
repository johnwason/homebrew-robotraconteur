class Robotraconteur < Formula
  desc "Robot Raconteur: communication framework for robotics"
  homepage "https://robotraconteur.com"
  url "https://github.com/johnwason/robotraconteur/archive/v0.15.3-rc2.tar.gz"
  sha256 "f1438c93f978d34c80c4b122538589efb08f78c26c7d6e507fcdd7e2f8f0ac10"
  head "https://github.com/robotraconteur/robotraconteur.git"
  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "openssl"

  def install
    system "cmake", ".", "-DCMAKE_CXX_STANDARD=11", "-DBUILD_GEN=ON", "-DBoost_USE_STATIC_LIBS=ON",
           "-DOPENSSL_USE_STATIC_LIBS=ON", "-DCMAKE_BUILD_TYPE=Release", *std_cmake_args
    system "make", "install"
  end

  test do
    system "ctest", "-C", "Release"
  end
end

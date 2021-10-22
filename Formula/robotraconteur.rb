class Robotraconteur < Formula
  desc "Robot Raconteur: communication framework for robotics"
  homepage "https://robotraconteur.com"
  url "https://github.com/johnwason/robotraconteur/archive/v0.15.3-rc3.tar.gz"
  sha256 "1cbf46bd756a3d5f06b0fde7059749f086cd3baf63f712c7e2051cc3c82c6294"
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

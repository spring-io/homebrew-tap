require 'formula'

class SpringBoot < Formula
  homepage 'https://spring.io/projects/spring-boot'
  url 'https://repo.maven.apache.org/maven2/org/springframework/boot/spring-boot-cli/3.3.0/spring-boot-cli-3.3.0-bin.tar.gz'
  version '3.3.0'
  sha256 '334c0f1643ed1e61cf4c07d17abf46e9396e1c60f44c7912306859404598c25a'
  head 'https://github.com/spring-projects/spring-boot.git', :branch => "main"

  def install
    if build.head?
      system './gradlew spring-boot-project:spring-boot-tools:spring-boot-cli:tar'
      system 'tar -xzf spring-boot-project/spring-boot-tools/spring-boot-cli/build/distributions/spring-* -C spring-boot-project/spring-boot-tools/spring-boot-cli/build/distributions'
      root = 'spring-boot-project/spring-boot-tools/spring-boot-cli/build/distributions/spring-*'
    else
      root = '.'
    end

    bin.install Dir["#{root}/bin/spring"]
    lib.install Dir["#{root}/lib/spring-boot-cli-*.jar"]
    bash_completion.install Dir["#{root}/shell-completion/bash/spring"]
    zsh_completion.install Dir["#{root}/shell-completion/zsh/_spring"]
  end
end

require 'formula'

class SpringBoot < Formula
  homepage 'https://spring.io/projects/spring-boot'
  url 'https://repo1.maven.org/maven2/org/springframework/boot/spring-boot-cli/3.0.2/spring-boot-cli-3.0.2-bin.tar.gz'
  version '3.0.2'
  sha256 '592e54ffa1e002cfd075385fb08c389252ad24c2a0861c59b7d926df95a94e79'
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

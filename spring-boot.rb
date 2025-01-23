require 'formula'

class SpringBoot < Formula
  homepage 'https://spring.io/projects/spring-boot'
  url 'https://repo.maven.apache.org/maven2/org/springframework/boot/spring-boot-cli/3.3.8/spring-boot-cli-3.3.8-bin.tar.gz'
  version '3.3.8'
  sha256 'd54acb937ea06c01452356e961ec635a120a108af8735106b74b3e3071051368'
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

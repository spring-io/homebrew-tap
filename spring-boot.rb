require 'formula'

class SpringBoot < Formula
  homepage 'https://spring.io/projects/spring-boot'
  url 'https://repo.maven.apache.org/maven2/org/springframework/boot/spring-boot-cli/3.5.7/spring-boot-cli-3.5.7-bin.tar.gz'
  version '3.5.7'
  sha256 '2f07f5a146272ae55c56fdd1fb40fb5f6f99b86b09747a7b08df5f4266119134'
  head 'https://github.com/spring-projects/spring-boot.git', :branch => "main"

  def install
    if build.head?
      system './gradlew spring-boot-project:spring-boot-tools:spring-boot-cli:tar'
      system 'tar -xzf spring-boot-project/spring-boot-tools/spring-boot-cli/build/distributions/spring-* -C spring-boot-project/spring-boot-tools/spring-boot-cli/build/distributions'
      root = 'spring-boot-project/spring-boot-tools/spring-boot-cli/build/distributions/spring-*'
    else
      root = '.'
    end

    libexec.install Dir["#{root}/*"]
    (bin/"spring").write_env_script libexec/"bin/spring", {}

    bash_comp = libexec/"shell-completion/bash/spring"
    zsh_comp  = libexec/"shell-completion/zsh/_spring"

    bash_completion.install bash_comp if bash_comp.exist?
    zsh_completion.install  zsh_comp  if zsh_comp.exist?
  end
end

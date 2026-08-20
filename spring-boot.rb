require 'formula'

class SpringBoot < Formula
  homepage 'https://spring.io/projects/spring-boot'
  url 'https://repo.maven.apache.org/maven2/org/springframework/boot/spring-boot-cli/4.1.1/spring-boot-cli-4.1.1-bin.tar.gz'
  version '4.1.1'
  sha256 '1b2bf6991e5540728b862f49721241d3d52acb9d48e48ce5ea0d24d75978dfc4'

  def install
    libexec.install Dir["./*"]
    (bin/"spring").write_env_script libexec/"bin/spring", {}

    bash_comp = libexec/"shell-completion/bash/spring"
    zsh_comp  = libexec/"shell-completion/zsh/_spring"

    bash_completion.install bash_comp if bash_comp.exist?
    zsh_completion.install  zsh_comp  if zsh_comp.exist?
  end
end

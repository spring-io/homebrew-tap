require 'formula'

class SpringBoot < Formula
  homepage 'https://spring.io/projects/spring-boot'
  url 'https://repo.maven.apache.org/maven2/org/springframework/boot/spring-boot-cli/4.0.2/spring-boot-cli-4.0.2-bin.tar.gz'
  version '4.0.2'
  sha256 'f0748199a1d0082bed1e25cfcb7dc239aa6b3162991dccef364dad28010a2f49'

  def install
    libexec.install Dir["./*"]
    (bin/"spring").write_env_script libexec/"bin/spring", {}

    bash_comp = libexec/"shell-completion/bash/spring"
    zsh_comp  = libexec/"shell-completion/zsh/_spring"

    bash_completion.install bash_comp if bash_comp.exist?
    zsh_completion.install  zsh_comp  if zsh_comp.exist?
  end
end

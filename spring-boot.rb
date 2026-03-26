require 'formula'

class SpringBoot < Formula
  homepage 'https://spring.io/projects/spring-boot'
  url 'https://repo.maven.apache.org/maven2/org/springframework/boot/spring-boot-cli/4.0.5/spring-boot-cli-4.0.5-bin.tar.gz'
  version '4.0.5'
  sha256 '7ed664f2e716e7c23c53b7edf5670c708ebee4ea63489033f9e7c3aff655d58c'

  def install
    libexec.install Dir["./*"]
    (bin/"spring").write_env_script libexec/"bin/spring", {}

    bash_comp = libexec/"shell-completion/bash/spring"
    zsh_comp  = libexec/"shell-completion/zsh/_spring"

    bash_completion.install bash_comp if bash_comp.exist?
    zsh_completion.install  zsh_comp  if zsh_comp.exist?
  end
end

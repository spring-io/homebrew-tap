require 'formula'

class SpringBoot < Formula
  homepage 'https://spring.io/projects/spring-boot'
  url 'https://repo.maven.apache.org/maven2/org/springframework/boot/spring-boot-cli/4.0.9/spring-boot-cli-4.0.9-bin.tar.gz'
  version '4.0.9'
  sha256 '291a05b12585b42d85b261a92fb76eb17e54d8ff12766eaba81834ec6a0304ab'

  def install
    libexec.install Dir["./*"]
    (bin/"spring").write_env_script libexec/"bin/spring", {}

    bash_comp = libexec/"shell-completion/bash/spring"
    zsh_comp  = libexec/"shell-completion/zsh/_spring"

    bash_completion.install bash_comp if bash_comp.exist?
    zsh_completion.install  zsh_comp  if zsh_comp.exist?
  end
end

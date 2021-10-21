require 'formula'

class SpringBoot < Formula
  homepage 'https://spring.io/projects/spring-boot'
  url 'https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/2.5.6/spring-boot-cli-2.5.6-bin.tar.gz'
  version '2.5.6'
  sha256 '3ed04173958347126907d9251d48f9cbc4dc83c8355e61b54ed773d6868e014b'
  head 'https://github.com/spring-projects/spring-boot.git'

  if build.head?
    depends_on 'maven' => :build
  end

  def install
    if build.head?
      Dir.chdir('spring-boot-cli') { system 'mvn -U -DskipTests=true package' }
      root = 'spring-boot-cli/target/spring-boot-cli-*-bin/spring-*'
    else
      root = '.'
    end

    bin.install Dir["#{root}/bin/spring"]
    lib.install Dir["#{root}/lib/spring-boot-cli-*.jar"]
    bash_completion.install Dir["#{root}/shell-completion/bash/spring"]
    zsh_completion.install Dir["#{root}/shell-completion/zsh/_spring"]
  end
end

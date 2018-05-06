# -*- encoding: utf-8 -*-
# stub: boostrap-sass 0.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "boostrap-sass".freeze
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Benjamin Eckel".freeze]
  s.date = "2014-03-19"
  s.description = "boo!".freeze
  s.email = ["bhelx@simst.im".freeze]
  s.homepage = "".freeze
  s.licenses = ["MIT".freeze]
  s.post_install_message = "\n      .'``'.      ...\n     :o  o `....'`  ;\n     `. O         :'\n       `':          `.\n         `:.          `.\n          : `.         `.\n         `..'`...       `.\n                 `...     `.\n     boo!            ``...  `.\n                          `````.\n\n".freeze
  s.rubygems_version = "2.7.3".freeze
  s.summary = "boo!".freeze

  s.installed_by_version = "2.7.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<bootstrap-sass>.freeze, [">= 0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<bootstrap-sass>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<bootstrap-sass>.freeze, [">= 0"])
  end
end

# -*- encoding: utf-8 -*-
# stub: watir 6.10.3 ruby lib

Gem::Specification.new do |s|
  s.name = "watir".freeze
  s.version = "6.10.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Alex Rodionov".freeze, "Titus Fortner".freeze]
  s.date = "2018-01-26"
  s.description = "Watir stands for Web Application Testing In Ruby\nIt facilitates the writing of automated tests by mimicing the behavior of a user interacting with a website.\n".freeze
  s.email = ["p0deje@gmail.com".freeze, "titusfortner@gmail.com".freeze]
  s.homepage = "http://github.com/watir/watir".freeze
  s.licenses = ["MIT".freeze]
  s.rubyforge_project = "watir".freeze
  s.rubygems_version = "2.7.3".freeze
  s.summary = "Watir powered by Selenium".freeze

  s.installed_by_version = "2.7.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<selenium-webdriver>.freeze, [">= 3.4.1", "~> 3.4"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<yard>.freeze, ["> 0.8.2.1"])
      s.add_development_dependency(%q<webidl>.freeze, [">= 0.2.0"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 0.9.2"])
      s.add_development_dependency(%q<fuubar>.freeze, [">= 0"])
      s.add_development_dependency(%q<nokogiri>.freeze, [">= 0"])
      s.add_development_dependency(%q<activesupport>.freeze, [">= 4.1.11", "~> 4.0"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
      s.add_development_dependency(%q<coveralls>.freeze, [">= 0"])
      s.add_development_dependency(%q<yard-doctest>.freeze, [">= 0.1.8"])
      s.add_development_dependency(%q<webdrivers>.freeze, [">= 3.1.0", "~> 3.0"])
    else
      s.add_dependency(%q<selenium-webdriver>.freeze, [">= 3.4.1", "~> 3.4"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<yard>.freeze, ["> 0.8.2.1"])
      s.add_dependency(%q<webidl>.freeze, [">= 0.2.0"])
      s.add_dependency(%q<rake>.freeze, ["~> 0.9.2"])
      s.add_dependency(%q<fuubar>.freeze, [">= 0"])
      s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
      s.add_dependency(%q<activesupport>.freeze, [">= 4.1.11", "~> 4.0"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
      s.add_dependency(%q<coveralls>.freeze, [">= 0"])
      s.add_dependency(%q<yard-doctest>.freeze, [">= 0.1.8"])
      s.add_dependency(%q<webdrivers>.freeze, [">= 3.1.0", "~> 3.0"])
    end
  else
    s.add_dependency(%q<selenium-webdriver>.freeze, [">= 3.4.1", "~> 3.4"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<yard>.freeze, ["> 0.8.2.1"])
    s.add_dependency(%q<webidl>.freeze, [">= 0.2.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 0.9.2"])
    s.add_dependency(%q<fuubar>.freeze, [">= 0"])
    s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
    s.add_dependency(%q<activesupport>.freeze, [">= 4.1.11", "~> 4.0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<coveralls>.freeze, [">= 0"])
    s.add_dependency(%q<yard-doctest>.freeze, [">= 0.1.8"])
    s.add_dependency(%q<webdrivers>.freeze, [">= 3.1.0", "~> 3.0"])
  end
end

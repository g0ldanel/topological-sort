# Given a list of packages and its dependencies, sort them out avoiding circular dependency

class TopologicalSort
  require 'byebug'

    @sorted = []
    @visiting = []

  # package: name, dependencies
  def self.check_dependencies(package, dependencies)

    @visiting << package
    dependencies[package].each do |dependency|
      unless @visiting.include? dependency
        @visiting << dependency
        check_dependencies dependency, dependencies
      end
    end
    @visiting -= [package]
    unless @sorted.include? package
      @sorted << package
    end

  end


  def self.packages_order_declaration(packages, dependencies)
    packages.each do |package|
      @visiting = []
      check_dependencies package, dependencies
    end
  end

end

dependencies = [[],[2],[1],[1,2],[3]]
packages = [0,1,2,3,4]


puts TopologicalSort.packages_order_declaration packages, dependencies

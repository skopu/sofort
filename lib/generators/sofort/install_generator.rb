require 'rails/generators/base'

module Sofort
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a Sofort initializer to your application."

      def copy_initializer
        template "sofort_rails.rb", "config/initializers/sofort.rb"
      end

      def show_readme
        readme "README" if behavior == :invoke
      end
    end
  end
end
require 'rails/generators/base'

module Sofort
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a Sofort initializer to your application."

      def copy_initializer
        template "devise.rb", "config/initializers/devise.rb"
      end

      def show_readme
        readme "README" if behavior == :invoke
      end
    end
  end
end
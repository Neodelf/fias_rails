class AddressGenerator < Rails::Generators::NamedBase
  include Rails::Generators::Migration
  source_root File.expand_path('../templates', __FILE__)
  #argument :user_cname, :type => :string, :default => 'User', :banner => 'User'

  def self.next_migration_number(path)
    Time.now.utc.strftime("%Y%m%d%H%M%S")
  end

  def create_migration_file
    migration_template 'migration.rb', "db/migrate/add_columns_to_#{file_name.pluralize}.rb"
  end

  def inject_model
    inject_into_class(model_path, class_name, model_content)
  end

  def model_path
    File.join("app", "models", "#{file_name.downcase}.rb")
  end

  def model_content
    <<RUBY
    belongs_to :fias_region, :class_name => 'Fias::AddressObject', :foreign_key => :region_id
    belongs_to :fias_area, :class_name => 'Fias::AddressObject', :foreign_key => :area_id
    belongs_to :fias_city, :class_name => 'Fias::AddressObject', :foreign_key => :city_id
    belongs_to :fias_town, :class_name => 'Fias::AddressObject', :foreign_key => :town_id
    belongs_to :fias_street, :class_name => 'Fias::AddressObject', :foreign_key => :street_id
RUBY
  end

end

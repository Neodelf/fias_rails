class AddColumnsTo<%= table_name.camelize %> < ActiveRecord::Migration
  def change
    add_column :<%= table_name %>, :region_id, :integer
    add_column :<%= table_name %>, :area_id, :integer
    add_column :<%= table_name %>, :city_id, :integer
    add_column :<%= table_name %>, :street_id, :integer
    add_column :<%= table_name %>, :house_id, :integer
    add_column :<%= table_name %>, :corps_id, :integer
    add_column :<%= table_name %>, :flat_id, :integer
    add_column :<%= table_name %>, :town_id, :integer
  end
end
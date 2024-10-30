class AddNameToDogs < ActiveRecord::Migration[7.2]
  def change
    add_column :dogs, :name, :string
  end
end

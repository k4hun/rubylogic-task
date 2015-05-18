class ChangeDescriptionFormatInRequestModel < ActiveRecord::Migration
  def up
     change_column :requests, :description, :text
   end

   def down
     change_column :requests, :description, :string
   end
end

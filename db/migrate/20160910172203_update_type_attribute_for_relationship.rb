class UpdateTypeAttributeForRelationship < ActiveRecord::Migration
  def self.up
    rename_column :relationships, :type, :relationship_type
  end

  def self.down
    rename_column :relationships, :relationship_type, :type
  end
end

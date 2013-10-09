class RenamePhotosSetIdColumn < ActiveRecord::Migration
  def change
    rename_column :photos, :set_id, :album_id
  end
end

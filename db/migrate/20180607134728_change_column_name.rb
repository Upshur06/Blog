class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :post_id, :blog_id
  end
end

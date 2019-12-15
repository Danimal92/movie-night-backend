class CreateUsermovies < ActiveRecord::Migration[6.0]
  def change
    create_table :usermovies do |t|
      t.integer :user_id
      t.integer :movie_id
      t.boolean :liked

      t.timestamps
    end
  end
end

class CreateFeeds < ActiveRecord::Migration[6.1]
  def change
    create_table :feeds do |t|
      t.string :title
      t.string :link
      t.timestamp :published_at

      t.timestamps
    end
  end
end
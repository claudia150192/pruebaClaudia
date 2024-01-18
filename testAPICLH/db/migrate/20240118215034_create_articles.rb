class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :source
      t.string :author
      t.string :title
      t.string :description
      t.string :url
      t.string :urlToImage
      t.string :publishedAt
      t.string :content

      t.timestamps
    end
  end
end

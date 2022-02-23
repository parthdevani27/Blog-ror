class AddTermsToArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :terms, :boolean
  end
end

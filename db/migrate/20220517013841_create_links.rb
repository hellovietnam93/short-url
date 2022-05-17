# frozen_string_literal: true

class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :url
      t.string :slug
      t.bigint :clicked, default: 0

      t.timestamps
    end
  end
end

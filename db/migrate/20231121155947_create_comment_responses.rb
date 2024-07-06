class CreateCommentResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :comment_responses do |t|
      t.bigint :id_comment
      t.bigint :id_response
      t.text :texto

      t.timestamps
    end
  end
end

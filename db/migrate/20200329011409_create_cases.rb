class CreateCases < ActiveRecord::Migration[6.0]
  def change
    create_table :cases do |t|
      t.string :case_number
      t.boolean :teen_program_eligible

      t.timestamps
    end
  end
end
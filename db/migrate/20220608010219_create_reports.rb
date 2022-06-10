class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.string :parliamentary_name
      t.string :cpf
      t.string :ide_register
      t.string :parliamentary_card_number
      t.integer :legislature_number
      t.string :sguf
      t.string :sg_party
      t.integer :legislature_code
      t.integer :subquota_number
      t.string :description
      t.integer :subquota_specification_number
      t.text :text_description_specification
      t.text :supplier_text
      t.string :cpf_cnpj
      t.integer :number
      t.integer :document_type
      t.string :issuance_string
      t.float :document_value
      t.integer :glosa_value
      t.float :net_value
      t.integer :month_number
      t.integer :year_number
      t.integer :installment_number
      t.text :passenger_text
      t.text :text_excerpt
      t.integer :lot_number
      t.integer :reimbursement_number
      t.float :refund_value
      t.integer :deputy_number
      t.string :document
      t.string :url_document

      t.timestamps
    end
  end
end

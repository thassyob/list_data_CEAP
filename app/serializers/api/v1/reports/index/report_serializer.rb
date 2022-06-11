class Api::V1::Reports::Index::ReportSerializer < ActiveModel::Serializer
  attributes :id, :total_spent, :higher_expense, :expenses

  def expenses
    {
      issuance_string: object.issuance_string,
      supplier_text: object.supplier_text ,
      net_value: object.net_value,
      url_document: object.url_document
    }
  end

  def total_spent
    total = object.document_value.to_f + object.glosa_value.to_f

    "R$ #{ Money.new(total).to_s }"
  end

  def higher_expense
    parliamentary_name = Report.where(parliamentary_name: object.parliamentary_name, sguf: object.sguf)
    
    higher_expense = parliamentary_name.map { |value| value.document_value }
    higher_expense = higher_expense.each_with_index.max[0]

    "R$ #{ Money.new(higher_expense).to_s }"
  end
end
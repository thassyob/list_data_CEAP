FactoryBot.define do
  factory :report do
    parliamentary_name { "MyString" }
    cpf { "MyString" }
    ide_register { "MyString" }
    parliamentary_card_number { "MyString" }
    legislature_number { 1 }
    sguf { "MyString" }
    sg_party { "MyString" }
    legislature_code { 1 }
    subquota_number { 1 }
    description { "MyString" }
    subquota_specification_number { 1 }
    text_description_specification { "MyText" }
    supplier_text { "MyText" }
    cpf_cnpj { "MyString" }
    number { 1 }
    document_type { 1 }
    issuance_string { "MyString" }
    document_value { 1.5 }
    glosa_value { 1 }
    net_value { 1.5 }
    month_number { 1 }
    year_number { 1 }
    installment_number { 1 }
    passenger_text { "MyText" }
    text_excerpt { "MyText" }
    lot_number { 1 }
    reimbursement_number { 1 }
    refund_value { 1.5 }
    deputy_number { 1 }
    document { "MyString" }
    url_document { "MyString" }
  end
end

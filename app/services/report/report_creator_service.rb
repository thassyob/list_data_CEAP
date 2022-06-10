class Report::ReportCreatorService
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def call
    create_report(spreadsheet_rows)
  end

  private

  def spreadsheet_rows
    report_data = []

    data = Roo::Spreadsheet.open(params[:file].tempfile)
    headers = data.row(1) 
    data.each_with_index do |row, idx|
      next if idx == 0 

      report_data << Hash[[headers, row].transpose]
    end

    report_data
  end

  def create_report(spreadsheet_rows)
    spreadsheet_rows.map do |spreadsheet_data|
      report = build_report(spreadsheet_data)
      
      report.save 
    end
  end

  def build_report(spreadsheet_data)
    Report.new(
      parliamentary_name: spreadsheet_data['txNomeParlamentar'],
      cpf: spreadsheet_data['cpf'],
      ide_register: spreadsheet_data['ideCadastro'],
      parliamentary_card_number: spreadsheet_data['nuCarteiraParlamentar'],
      legislature_number: spreadsheet_data['nuLegislatura'],
      sguf: spreadsheet_data['sgUF'],
      sg_party: spreadsheet_data['sgPartido'],
      legislature_code: spreadsheet_data['codLegislatura'],
      subquota_number: spreadsheet_data['numSubCota'],
      description: spreadsheet_data['txtDescricao'],
      subquota_specification_number: spreadsheet_data['numEspecificacaoSubCota'],
      text_description_specification: spreadsheet_data['txtDescricaoEspecificacao'],
      supplier_text: spreadsheet_data['txtFornecedor'],
      cpf_cnpj: spreadsheet_data['txtCNPJCPF'],
      number: spreadsheet_data['txtNumero'],
      document_type: spreadsheet_data['indTipoDocumento'],
      issuance_string: spreadsheet_data['datEmissao'],
      document_value: spreadsheet_data['vlrDocumento'],
      glosa_value: spreadsheet_data['vlrGlosa'],
      net_value: spreadsheet_data['vlrLiquido'],
      month_number: spreadsheet_data['numMes'],
      year_number: spreadsheet_data['numAno'],
      installment_number: spreadsheet_data['numParcela'],
      passenger_text: spreadsheet_data['txtPassageiro'],
      text_excerpt: spreadsheet_data['txtTrecho'],
      lot_number: spreadsheet_data['numLote'],
      reimbursement_number: spreadsheet_data['numRessarcimento'],
      refund_value: spreadsheet_data['vlrRestituicao'],
      deputy_number: spreadsheet_data['nuDeputadoId'],
      document: spreadsheet_data['ideDocumento'],
      url_document: spreadsheet_data['urlDocumento']
    )
  end
end
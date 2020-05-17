class QuotationResponse {
  bool error;
  List<Data> data;
  String message;
  int rows;
  int perPage;
  int iTs;

  QuotationResponse(
      {this.error, this.data, this.message, this.rows, this.perPage, this.iTs});

  QuotationResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    rows = json['rows'];
    perPage = json['per_page'];
    iTs = json['_ts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['rows'] = this.rows;
    data['per_page'] = this.perPage;
    data['_ts'] = this.iTs;
    return data;
  }
}

class Data {
  int quotationId;
  String partyCompanyDisplay;
  String quotationNo;
  String quotationDate;
  String quotationExpiryDate;
  double quotationTotal;
  String quotationStatus;
  String entityCompany;
  String entityCompanyDisplay;
  String partyCompany;
  String currencySymbol;
  String createdByName;

  Data(
      {this.quotationId,
        this.partyCompanyDisplay,
        this.quotationNo,
        this.quotationDate,
        this.quotationExpiryDate,
        this.quotationTotal,
        this.quotationStatus,
        this.entityCompany,
        this.entityCompanyDisplay,
        this.partyCompany,
        this.currencySymbol,
        this.createdByName});

  Data.fromJson(Map<String, dynamic> json) {
    quotationId = json['quotation_id'];
    partyCompanyDisplay = json['party_company_display'];
    quotationNo = json['quotation_no'];
    quotationDate = json['quotation_date'];
    quotationExpiryDate = json['quotation_expiry_date'];
    quotationTotal = json['quotation_total'];
    quotationStatus = json['quotation_status'];
    entityCompany = json['entity_company'];
    entityCompanyDisplay = json['entity_company_display'];
    partyCompany = json['party_company'];
    currencySymbol = json['currency_symbol'];
    createdByName = json['created_by_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quotation_id'] = this.quotationId;
    data['party_company_display'] = this.partyCompanyDisplay;
    data['quotation_no'] = this.quotationNo;
    data['quotation_date'] = this.quotationDate;
    data['quotation_expiry_date'] = this.quotationExpiryDate;
    data['quotation_total'] = this.quotationTotal;
    data['quotation_status'] = this.quotationStatus;
    data['entity_company'] = this.entityCompany;
    data['entity_company_display'] = this.entityCompanyDisplay;
    data['party_company'] = this.partyCompany;
    data['currency_symbol'] = this.currencySymbol;
    data['created_by_name'] = this.createdByName;
    return data;
  }
}
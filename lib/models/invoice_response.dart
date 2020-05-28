class InvoiceResponse {
  bool error;
  List<InvoiceData> invoiceData;
  String message;
  int rows;
  int perPage;
  int iTs;

  InvoiceResponse(
      {this.error, this.invoiceData, this.message, this.rows, this.perPage, this.iTs});

  InvoiceResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['data'] != null) {
      invoiceData = new List<InvoiceData>();
      json['data'].forEach((v) {
        invoiceData.add(new InvoiceData.fromJson(v));
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
    if (this.invoiceData != null) {
      data['data'] = this.invoiceData.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['rows'] = this.rows;
    data['per_page'] = this.perPage;
    data['_ts'] = this.iTs;
    return data;
  }
}

class InvoiceData {
  int invoiceId;
  int orderId;
  var invoiceNo;
  String invoiceDate;
  int invoiceSubTotal;
  var invoiceTaxAmt;
  var invoiceTotal;
  int statusId;
  int paymentTotal;
  var invoiceMargin;
  var paymentDue;
  var orderNo;
  String entityCompany;
  String entityCompanyDisplay;
  String partyCompany;
  String partyCompanyDisplay;
  String invoiceDueDate;
  String currencySymbol;
  String createdByName;
  int dueDays;
  String statusName;

  InvoiceData(
      {this.invoiceId,
        this.orderId,
        this.invoiceNo,
        this.invoiceDate,
        this.invoiceSubTotal,
        this.invoiceTaxAmt,
        this.invoiceTotal,
        this.statusId,
        this.paymentTotal,
        this.invoiceMargin,
        this.paymentDue,
        this.orderNo,
        this.entityCompany,
        this.entityCompanyDisplay,
        this.partyCompany,
        this.partyCompanyDisplay,
        this.invoiceDueDate,
        this.currencySymbol,
        this.createdByName,
        this.dueDays,
        this.statusName});

  InvoiceData.fromJson(Map<String, dynamic> json) {
    invoiceId = json['invoice_id'];
    orderId = json['order_id'];
    invoiceNo = json['invoice_no'];
    invoiceDate = json['invoice_date'];
    invoiceSubTotal = json['invoice_sub_total'];
    invoiceTaxAmt = json['invoice_tax_amt'];
    invoiceTotal = json['invoice_total'];
    statusId = json['status_id'];
    paymentTotal = json['payment_total'];
    invoiceMargin = json['invoice_margin'];
    paymentDue = json['payment_due'];
    orderNo = json['order_no'];
    entityCompany = json['entity_company'];
    entityCompanyDisplay = json['entity_company_display'];
    partyCompany = json['party_company'];
    partyCompanyDisplay = json['party_company_display'];
    invoiceDueDate = json['invoice_due_date'];
    currencySymbol = json['currency_symbol'];
    createdByName = json['created_by_name'];
    dueDays = json['due_days'];
    statusName = json['status_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invoice_id'] = this.invoiceId;
    data['order_id'] = this.orderId;
    data['invoice_no'] = this.invoiceNo;
    data['invoice_date'] = this.invoiceDate;
    data['invoice_sub_total'] = this.invoiceSubTotal;
    data['invoice_tax_amt'] = this.invoiceTaxAmt;
    data['invoice_total'] = this.invoiceTotal;
    data['status_id'] = this.statusId;
    data['payment_total'] = this.paymentTotal;
    data['invoice_margin'] = this.invoiceMargin;
    data['payment_due'] = this.paymentDue;
    data['order_no'] = this.orderNo;
    data['entity_company'] = this.entityCompany;
    data['entity_company_display'] = this.entityCompanyDisplay;
    data['party_company'] = this.partyCompany;
    data['party_company_display'] = this.partyCompanyDisplay;
    data['invoice_due_date'] = this.invoiceDueDate;
    data['currency_symbol'] = this.currencySymbol;
    data['created_by_name'] = this.createdByName;
    data['due_days'] = this.dueDays;
    data['status_name'] = this.statusName;
    return data;
  }
}
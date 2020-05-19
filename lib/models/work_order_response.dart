class WorkOrderResponse {
  bool error;
  List<WorkOrderData> data;
  String message;
  int rows;
  int perPage;
  int iTs;
  WorkOrderResponse(
      {this.error, this.data, this.message, this.rows, this.perPage, this.iTs});

  WorkOrderResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['data'] != null) {
      data = new List<WorkOrderData>();
      json['data'].forEach((v) {
        data.add(new WorkOrderData.fromJson(v));
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

class WorkOrderData {
  int orderId;
  int quotationId;
  int porderId;
  String partyCompanyDisplay;
  var orderNo;
  String orderDate;
  int orderSubTotal;
  var orderTaxAmt;
  var orderTotal;
  var invoiceTotal;
  var paymentTotal;
  var statusId;
  var hasReport;
  String orderNotes;
  String entityCompany;
  String entityCompanyDisplay;
  String partyCompany;
  String currencySymbol;
  String statusName;
  String createdByName;
  String quotationNo;
  String porderNo;
  String tags;
  String reportStatus;
  int hasServiceAccess;
  var invoiceDue;
  var paymentDue;
  List<String> salesPersons;
  List<String> items;
  List<String> itemsDescriptions;
  List<String> itemsBudgetImplementations;
  List<String> itemsCategory;

  WorkOrderData(
      {this.orderId,
        this.quotationId,
        this.porderId,
        this.partyCompanyDisplay,
        this.orderNo,
        this.orderDate,
        this.orderSubTotal,
        this.orderTaxAmt,
        this.orderTotal,
        this.invoiceTotal,
        this.paymentTotal,
        this.statusId,
        this.hasReport,
        this.orderNotes,
        this.entityCompany,
        this.entityCompanyDisplay,
        this.partyCompany,
        this.currencySymbol,
        this.statusName,
        this.createdByName,
        this.quotationNo,
        this.porderNo,
        this.tags,
        this.reportStatus,
        this.hasServiceAccess,
        this.invoiceDue,
        this.paymentDue,
        this.salesPersons,
        this.items,
        this.itemsDescriptions,
        this.itemsBudgetImplementations,
        this.itemsCategory});

  WorkOrderData.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    quotationId = json['quotation_id'];
    porderId = json['porder_id'];
    partyCompanyDisplay = json['party_company_display'];
    orderNo = json['order_no'];
    orderDate = json['order_date'];
    orderSubTotal = json['order_sub_total'];
    orderTaxAmt = json['order_tax_amt'];
    orderTotal = json['order_total'];
    invoiceTotal = json['invoice_total'];
    paymentTotal = json['payment_total'];
    statusId = json['status_id'];
    hasReport = json['has_report'];
    orderNotes = json['order_notes'];
    entityCompany = json['entity_company'];
    entityCompanyDisplay = json['entity_company_display'];
    partyCompany = json['party_company'];
    currencySymbol = json['currency_symbol'];
    statusName = json['status_name'];
    createdByName = json['created_by_name'];
    quotationNo = json['quotation_no'];
    porderNo = json['porder_no'];
    tags = json['tags'];
    reportStatus = json['report_status'];
    hasServiceAccess = json['has_service_access'];
    invoiceDue = json['invoice_due'];
    paymentDue = json['payment_due'];
    salesPersons = json['sales_persons'].cast<String>();
    items = json['items'].cast<String>();
    itemsDescriptions = json['itemsDescriptions'].cast<String>();
    itemsBudgetImplementations =
        json['itemsBudgetImplementations'].cast<String>();
    itemsCategory = json['itemsCategory'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['quotation_id'] = this.quotationId;
    data['porder_id'] = this.porderId;
    data['party_company_display'] = this.partyCompanyDisplay;
    data['order_no'] = this.orderNo;
    data['order_date'] = this.orderDate;
    data['order_sub_total'] = this.orderSubTotal;
    data['order_tax_amt'] = this.orderTaxAmt;
    data['order_total'] = this.orderTotal;
    data['invoice_total'] = this.invoiceTotal;
    data['payment_total'] = this.paymentTotal;
    data['status_id'] = this.statusId;
    data['has_report'] = this.hasReport;
    data['order_notes'] = this.orderNotes;
    data['entity_company'] = this.entityCompany;
    data['entity_company_display'] = this.entityCompanyDisplay;
    data['party_company'] = this.partyCompany;
    data['currency_symbol'] = this.currencySymbol;
    data['status_name'] = this.statusName;
    data['created_by_name'] = this.createdByName;
    data['quotation_no'] = this.quotationNo;
    data['porder_no'] = this.porderNo;

    data['tags'] = this.tags;
    data['report_status'] = this.reportStatus;
    data['has_service_access'] = this.hasServiceAccess;
    data['invoice_due'] = this.invoiceDue;
    data['payment_due'] = this.paymentDue;
    data['sales_persons'] = this.salesPersons;
    data['items'] = this.items;
    data['itemsDescriptions'] = this.itemsDescriptions;
    data['itemsBudgetImplementations'] = this.itemsBudgetImplementations;
    data['itemsCategory'] = this.itemsCategory;
    return data;
  }
}
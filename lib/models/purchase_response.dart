class PurchaseOrderResponse {
  bool error;
  List<PurchaseData> data;
  String message;
  int rows;
  int perPage;
  int iTs;

  PurchaseOrderResponse(
      {this.error, this.data, this.message, this.rows, this.perPage, this.iTs});

  PurchaseOrderResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['data'] != null) {
      data = new List<PurchaseData>();
      json['data'].forEach((v) {
        data.add(new PurchaseData.fromJson(v));
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

class PurchaseData {
  int porderId;
  int orderId;
  String partyCompanyDisplay;
  var porderNo;
  String porderDate;
  String deliveryDate;
  var porderTotal;
  var invoiceAmount;
  var paymentAmount;
  var invoiceDue;
  String porderStatus;
  String billingEntityCompany;
  String billingEntityCompanyDisplay;
  String shippingEntityCompany;
  String shippingEntityCompanyDisplay;
  String partyCompany;
  String currencySymbol;
  var orderNo;
  String createdByName;

  PurchaseData(
      {this.porderId,
        this.orderId,
        this.partyCompanyDisplay,
        this.porderNo,
        this.porderDate,
        this.deliveryDate,
        this.porderTotal,
        this.invoiceAmount,
        this.paymentAmount,
        this.invoiceDue,
        this.porderStatus,
        this.billingEntityCompany,
        this.billingEntityCompanyDisplay,
        this.shippingEntityCompany,
        this.shippingEntityCompanyDisplay,
        this.partyCompany,
        this.currencySymbol,
        this.orderNo,
        this.createdByName});

  PurchaseData.fromJson(Map<String, dynamic> json) {
    porderId = json['porder_id'];
    orderId = json['order_id'];
    partyCompanyDisplay = json['party_company_display'];
    porderNo = json['porder_no'];
    porderDate = json['porder_date'];
    deliveryDate = json['delivery_date'];
    porderTotal = json['porder_total'];
    invoiceAmount = json['invoice_amount'];
    paymentAmount = json['payment_amount'];
    invoiceDue = json['invoice_due'];
    porderStatus = json['porder_status'];
    billingEntityCompany = json['billing_entity_company'];
    billingEntityCompanyDisplay = json['billing_entity_company_display'];
    shippingEntityCompany = json['shipping_entity_company'];
    shippingEntityCompanyDisplay = json['shipping_entity_company_display'];
    partyCompany = json['party_company'];
    currencySymbol = json['currency_symbol'];
    orderNo = json['order_no'];
    createdByName = json['created_by_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['porder_id'] = this.porderId;
    data['order_id'] = this.orderId;
    data['party_company_display'] = this.partyCompanyDisplay;
    data['porder_no'] = this.porderNo;
    data['porder_date'] = this.porderDate;
    data['delivery_date'] = this.deliveryDate;
    data['porder_total'] = this.porderTotal;
    data['invoice_amount'] = this.invoiceAmount;
    data['payment_amount'] = this.paymentAmount;
    data['invoice_due'] = this.invoiceDue;
    data['porder_status'] = this.porderStatus;
    data['billing_entity_company'] = this.billingEntityCompany;
    data['billing_entity_company_display'] = this.billingEntityCompanyDisplay;
    data['shipping_entity_company'] = this.shippingEntityCompany;
    data['shipping_entity_company_display'] = this.shippingEntityCompanyDisplay;
    data['party_company'] = this.partyCompany;
    data['currency_symbol'] = this.currencySymbol;
    data['order_no'] = this.orderNo;
    data['created_by_name'] = this.createdByName;
    return data;
  }
}
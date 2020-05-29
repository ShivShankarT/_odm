class WorkOrderDetailsResponse {
  bool error;
  List<WODetailsData> data;
  String message;
  var iTs;

  WorkOrderDetailsResponse({this.error, this.data, this.message, this.iTs});

  WorkOrderDetailsResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['data'] != null) {
      data = new List<WODetailsData>();
      json['data'].forEach((v) {
        data.add(new WODetailsData.fromJson(v));
      });
    }
    message = json['message'];
    iTs = json['_ts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['_ts'] = this.iTs;
    return data;
  }
}

class WODetailsData {
  var orderId;
  var quotationId;
  Null porderId;
  var entityId;
  var ebId;
  String ebName;
  var ebGstTreatmentId;
  String ebGstNo;
  String ebAttention;
  String ebAddress;
  String ebCity;
  String ebState;
  var ebPincode;
  String ebCountry;
  var partyId;
  String partyCompanyDisplay;
  var pbBId;
  String pbBName;
  var pbBGstTreatmentId;
  String pbBGstNo;
  String pbBAttention;
  String pbBAddress;
  String pbBCity;
  String pbBState;
  var pbBPincode;
  String pbBCountry;
  var pbSId;
  String pbSName;
  var pbSGstTreatmentId;
  String pbSGstNo;
  String pbSAttention;
  String pbSAddress;
  String pbSCity;
  String pbSState;
  var pbSPincode;
  String pbSCountry;
  String supplyPlace;
  var paymentTermId;
  var orderNo;
  String orderDate;
  var currencyId;
  var orderIsTaxable;
  var orderIsIgst;
  var orderTaxPer;
  var orderTaxAmt;
  var orderDiscount;
  var orderSubTotal;
  var orderTotal;
  var invoiceTotal;
  var paymentTotal;
  String orderNotes;
  String orderInvShipAddr;
  String tags;
  var hasReport;
  var statusId;
  var createdById;
  var hasServiceAccess;
  String entityCompany;
  String entityCompanyDisplay;
  String entityCountry;
  String partyCompany;
  String partyCountry;
  String currencySymbol;
  String currencyTitle;
  String gstTreatmentTitle;
  var gstTreatmentIsGst;
  var gstTreatmentIsTax;
  String createdByName;
  String paymentTermTitle;
  var invoiceDue;
  var paymentDue;
  String statusName;
  var industryId;
  String industryTitle;
  var channelId;
  String channelTitle;
  String quotationNo;
  Null porderNo;
  List<Items> items;
  List<SalesPerson> salesPerson;
  List<Files> files;

  WODetailsData(
      {this.orderId,
        this.quotationId,
        this.porderId,
        this.entityId,
        this.ebId,
        this.ebName,
        this.ebGstTreatmentId,
        this.ebGstNo,
        this.ebAttention,
        this.ebAddress,
        this.ebCity,
        this.ebState,
        this.ebPincode,
        this.ebCountry,
        this.partyId,
        this.partyCompanyDisplay,
        this.pbBId,
        this.pbBName,
        this.pbBGstTreatmentId,
        this.pbBGstNo,
        this.pbBAttention,
        this.pbBAddress,
        this.pbBCity,
        this.pbBState,
        this.pbBPincode,
        this.pbBCountry,
        this.pbSId,
        this.pbSName,
        this.pbSGstTreatmentId,
        this.pbSGstNo,
        this.pbSAttention,
        this.pbSAddress,
        this.pbSCity,
        this.pbSState,
        this.pbSPincode,
        this.pbSCountry,
        this.supplyPlace,
        this.paymentTermId,
        this.orderNo,
        this.orderDate,
        this.currencyId,
        this.orderIsTaxable,
        this.orderIsIgst,
        this.orderTaxPer,
        this.orderTaxAmt,
        this.orderDiscount,
        this.orderSubTotal,
        this.orderTotal,
        this.invoiceTotal,
        this.paymentTotal,
        this.orderNotes,
        this.orderInvShipAddr,
        this.tags,
        this.hasReport,
        this.statusId,
        this.createdById,
        this.hasServiceAccess,
        this.entityCompany,
        this.entityCompanyDisplay,
        this.entityCountry,
        this.partyCompany,
        this.partyCountry,
        this.currencySymbol,
        this.currencyTitle,
        this.gstTreatmentTitle,
        this.gstTreatmentIsGst,
        this.gstTreatmentIsTax,
        this.createdByName,
        this.paymentTermTitle,
        this.invoiceDue,
        this.paymentDue,
        this.statusName,
        this.industryId,
        this.industryTitle,
        this.channelId,
        this.channelTitle,
        this.quotationNo,
        this.porderNo,
        this.items,
        this.salesPerson,
        this.files});

  WODetailsData.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    quotationId = json['quotation_id'];
    porderId = json['porder_id'];
    entityId = json['entity_id'];
    ebId = json['eb_id'];
    ebName = json['eb_name'];
    ebGstTreatmentId = json['eb_gst_treatment_id'];
    ebGstNo = json['eb_gst_no'];
    ebAttention = json['eb_attention'];
    ebAddress = json['eb_address'];
    ebCity = json['eb_city'];
    ebState = json['eb_state'];
    ebPincode = json['eb_pincode'];
    ebCountry = json['eb_country'];
    partyId = json['party_id'];
    partyCompanyDisplay = json['party_company_display'];
    pbBId = json['pb_b_id'];
    pbBName = json['pb_b_name'];
    pbBGstTreatmentId = json['pb_b_gst_treatment_id'];
    pbBGstNo = json['pb_b_gst_no'];
    pbBAttention = json['pb_b_attention'];
    pbBAddress = json['pb_b_address'];
    pbBCity = json['pb_b_city'];
    pbBState = json['pb_b_state'];
    pbBPincode = json['pb_b_pincode'];
    pbBCountry = json['pb_b_country'];
    pbSId = json['pb_s_id'];
    pbSName = json['pb_s_name'];
    pbSGstTreatmentId = json['pb_s_gst_treatment_id'];
    pbSGstNo = json['pb_s_gst_no'];
    pbSAttention = json['pb_s_attention'];
    pbSAddress = json['pb_s_address'];
    pbSCity = json['pb_s_city'];
    pbSState = json['pb_s_state'];
    pbSPincode = json['pb_s_pincode'];
    pbSCountry = json['pb_s_country'];
    supplyPlace = json['supply_place'];
    paymentTermId = json['payment_term_id'];
    orderNo = json['order_no'];
    orderDate = json['order_date'];
    currencyId = json['currency_id'];
    orderIsTaxable = json['order_is_taxable'];
    orderIsIgst = json['order_is_igst'];
    orderTaxPer = json['order_tax_per'];
    orderTaxAmt = json['order_tax_amt'];
    orderDiscount = json['order_discount'];
    orderSubTotal = json['order_sub_total'];
    orderTotal = json['order_total'];
    invoiceTotal = json['invoice_total'];
    paymentTotal = json['payment_total'];
    orderNotes = json['order_notes'];
    orderInvShipAddr = json['order_inv_ship_addr'];
    tags = json['tags'];
    hasReport = json['has_report'];
    statusId = json['status_id'];
    createdById = json['created_by_id'];
    hasServiceAccess = json['has_service_access'];
    entityCompany = json['entity_company'];
    entityCompanyDisplay = json['entity_company_display'];
    entityCountry = json['entity_country'];
    partyCompany = json['party_company'];
    partyCountry = json['party_country'];
    currencySymbol = json['currency_symbol'];
    currencyTitle = json['currency_title'];
    gstTreatmentTitle = json['gst_treatment_title'];
    gstTreatmentIsGst = json['gst_treatment_is_gst'];
    gstTreatmentIsTax = json['gst_treatment_is_tax'];
    createdByName = json['created_by_name'];
    paymentTermTitle = json['payment_term_title'];
    invoiceDue = json['invoice_due'];
    paymentDue = json['payment_due'];
    statusName = json['status_name'];
    industryId = json['industry_id'];
    industryTitle = json['industry_title'];
    channelId = json['channel_id'];
    channelTitle = json['channel_title'];
    quotationNo = json['quotation_no'];
    porderNo = json['porder_no'];
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
    if (json['sales_person'] != null) {
      salesPerson = new List<SalesPerson>();
      json['sales_person'].forEach((v) {
        salesPerson.add(new SalesPerson.fromJson(v));
      });
    }
    if (json['files'] != null) {
      files = new List<Files>();
      json['files'].forEach((v) {
        files.add(new Files.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['quotation_id'] = this.quotationId;
    data['porder_id'] = this.porderId;
    data['entity_id'] = this.entityId;
    data['eb_id'] = this.ebId;
    data['eb_name'] = this.ebName;
    data['eb_gst_treatment_id'] = this.ebGstTreatmentId;
    data['eb_gst_no'] = this.ebGstNo;
    data['eb_attention'] = this.ebAttention;
    data['eb_address'] = this.ebAddress;
    data['eb_city'] = this.ebCity;
    data['eb_state'] = this.ebState;
    data['eb_pincode'] = this.ebPincode;
    data['eb_country'] = this.ebCountry;
    data['party_id'] = this.partyId;
    data['party_company_display'] = this.partyCompanyDisplay;
    data['pb_b_id'] = this.pbBId;
    data['pb_b_name'] = this.pbBName;
    data['pb_b_gst_treatment_id'] = this.pbBGstTreatmentId;
    data['pb_b_gst_no'] = this.pbBGstNo;
    data['pb_b_attention'] = this.pbBAttention;
    data['pb_b_address'] = this.pbBAddress;
    data['pb_b_city'] = this.pbBCity;
    data['pb_b_state'] = this.pbBState;
    data['pb_b_pincode'] = this.pbBPincode;
    data['pb_b_country'] = this.pbBCountry;
    data['pb_s_id'] = this.pbSId;
    data['pb_s_name'] = this.pbSName;
    data['pb_s_gst_treatment_id'] = this.pbSGstTreatmentId;
    data['pb_s_gst_no'] = this.pbSGstNo;
    data['pb_s_attention'] = this.pbSAttention;
    data['pb_s_address'] = this.pbSAddress;
    data['pb_s_city'] = this.pbSCity;
    data['pb_s_state'] = this.pbSState;
    data['pb_s_pincode'] = this.pbSPincode;
    data['pb_s_country'] = this.pbSCountry;
    data['supply_place'] = this.supplyPlace;
    data['payment_term_id'] = this.paymentTermId;
    data['order_no'] = this.orderNo;
    data['order_date'] = this.orderDate;
    data['currency_id'] = this.currencyId;
    data['order_is_taxable'] = this.orderIsTaxable;
    data['order_is_igst'] = this.orderIsIgst;
    data['order_tax_per'] = this.orderTaxPer;
    data['order_tax_amt'] = this.orderTaxAmt;
    data['order_discount'] = this.orderDiscount;
    data['order_sub_total'] = this.orderSubTotal;
    data['order_total'] = this.orderTotal;
    data['invoice_total'] = this.invoiceTotal;
    data['payment_total'] = this.paymentTotal;
    data['order_notes'] = this.orderNotes;
    data['order_inv_ship_addr'] = this.orderInvShipAddr;
    data['tags'] = this.tags;
    data['has_report'] = this.hasReport;
    data['status_id'] = this.statusId;
    data['created_by_id'] = this.createdById;
    data['has_service_access'] = this.hasServiceAccess;
    data['entity_company'] = this.entityCompany;
    data['entity_company_display'] = this.entityCompanyDisplay;
    data['entity_country'] = this.entityCountry;
    data['party_company'] = this.partyCompany;
    data['party_country'] = this.partyCountry;
    data['currency_symbol'] = this.currencySymbol;
    data['currency_title'] = this.currencyTitle;
    data['gst_treatment_title'] = this.gstTreatmentTitle;
    data['gst_treatment_is_gst'] = this.gstTreatmentIsGst;
    data['gst_treatment_is_tax'] = this.gstTreatmentIsTax;
    data['created_by_name'] = this.createdByName;
    data['payment_term_title'] = this.paymentTermTitle;
    data['invoice_due'] = this.invoiceDue;
    data['payment_due'] = this.paymentDue;
    data['status_name'] = this.statusName;
    data['industry_id'] = this.industryId;
    data['industry_title'] = this.industryTitle;
    data['channel_id'] = this.channelId;
    data['channel_title'] = this.channelTitle;
    data['quotation_no'] = this.quotationNo;
    data['porder_no'] = this.porderNo;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    if (this.salesPerson != null) {
      data['sales_person'] = this.salesPerson.map((v) => v.toJson()).toList();
    }
    if (this.files != null) {
      data['files'] = this.files.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  var oiId;
  var orderId;
  var itemId;
  String oiType;
  String oiName;
  var oiCode;
  var oiDescription;
  var oiRate;
  var oiQuantity;
  var taxGroupId;
  var oiTaxPer;
  var oiTaxAmt;
  var oiDiscount;
  var oiSubTotal;
  var oiTotal;
  var oiBudget;
  var categoryId;
  String taxGroupName;
  String categoryName;

  Items(
      {this.oiId,
        this.orderId,
        this.itemId,
        this.oiType,
        this.oiName,
        this.oiCode,
        this.oiDescription,
        this.oiRate,
        this.oiQuantity,
        this.taxGroupId,
        this.oiTaxPer,
        this.oiTaxAmt,
        this.oiDiscount,
        this.oiSubTotal,
        this.oiTotal,
        this.oiBudget,
        this.categoryId,
        this.taxGroupName,
        this.categoryName});

  Items.fromJson(Map<String, dynamic> json) {
    oiId = json['oi_id'];
    orderId = json['order_id'];
    itemId = json['item_id'];
    oiType = json['oi_type'];
    oiName = json['oi_name'];
    oiCode = json['oi_code'];
    oiDescription = json['oi_description'];
    oiRate = json['oi_rate'];
    oiQuantity = json['oi_quantity'];
    taxGroupId = json['tax_group_id'];
    oiTaxPer = json['oi_tax_per'];
    oiTaxAmt = json['oi_tax_amt'];
    oiDiscount = json['oi_discount'];
    oiSubTotal = json['oi_sub_total'];
    oiTotal = json['oi_total'];
    oiBudget = json['oi_budget'];
    categoryId = json['category_id'];
    taxGroupName = json['tax_group_name'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['oi_id'] = this.oiId;
    data['order_id'] = this.orderId;
    data['item_id'] = this.itemId;
    data['oi_type'] = this.oiType;
    data['oi_name'] = this.oiName;
    data['oi_code'] = this.oiCode;
    data['oi_description'] = this.oiDescription;
    data['oi_rate'] = this.oiRate;
    data['oi_quantity'] = this.oiQuantity;
    data['tax_group_id'] = this.taxGroupId;
    data['oi_tax_per'] = this.oiTaxPer;
    data['oi_tax_amt'] = this.oiTaxAmt;
    data['oi_discount'] = this.oiDiscount;
    data['oi_sub_total'] = this.oiSubTotal;
    data['oi_total'] = this.oiTotal;
    data['oi_budget'] = this.oiBudget;
    data['category_id'] = this.categoryId;
    data['tax_group_name'] = this.taxGroupName;
    data['category_name'] = this.categoryName;
    return data;
  }
}

class SalesPerson {
  var orderId;
  var userId;
  var percentage;
  String salespersonName;

  SalesPerson(
      {this.orderId, this.userId, this.percentage, this.salespersonName});

  SalesPerson.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    userId = json['user_id'];
    percentage = json['percentage'];
    salespersonName = json['salesperson_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['user_id'] = this.userId;
    data['percentage'] = this.percentage;
    data['salesperson_name'] = this.salespersonName;
    return data;
  }
}

class Files {
  var fakeId;

  Files({this.fakeId});

  Files.fromJson(Map<String, dynamic> json) {
    fakeId = json['fake_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fake_id'] = this.fakeId;
    return data;
  }
}
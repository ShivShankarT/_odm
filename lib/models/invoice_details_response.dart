class InvoiceDetailsResponse {
  bool error;
  List<InvoiceDetailsData> invoiceDetailsdata;
  String message;
  var iTs;

  InvoiceDetailsResponse({this.error, this.invoiceDetailsdata, this.message, this.iTs});

  InvoiceDetailsResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['data'] != null) {
      invoiceDetailsdata = new List<InvoiceDetailsData>();
      json['data'].forEach((v) {
        invoiceDetailsdata.add(new InvoiceDetailsData.fromJson(v));
      });
    }
    message = json['message'];
    iTs = json['_ts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.invoiceDetailsdata != null) {
      data['data'] = this.invoiceDetailsdata.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['_ts'] = this.iTs;
    return data;
  }
}

class InvoiceDetailsData {
  var invoiceId;
  var orderId;
  var entityId;
  var ebId;
  var partyId;
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
  var pbSGstNo;
  String pbSAttention;
  String pbSAddress;
  String pbSCity;
  String pbSState;
  var pbSPincode;
  String pbSCountry;
  String supplyPlace;
  String invoiceType;
  var invoiceIsDomestic;
  var paymentTermId;
  var invoiceNo;
  String invoiceDate;
  var currencyId;
  var invoiceTemplateId;
  var invoiceIsTaxable;
  var invoiceIsIgst;
  var invoiceTaxPer;
  var invoiceTaxAmt;
  var invoiceDiscount;
  var invoiceSubTotal;
  var invoiceTotal;
  var paymentTotal;
  var paymentDue;
  String invoiceNotes;
  String invoiceTerms;
  var statusId;
  var createdById;
  String ebName;
  var ebGstTreatmentId;
  String ebGstNo;
  String ebAttention;
  String ebAddress;
  String ebCity;
  String ebState;
  var ebPincode;
  String ebCountry;
  String invoiceDueDate;
  String entityCompany;
  String entityCompanyDisplay;
  String entityEmail;
  String entityCountry;
  var entityPhone;
  String entityPan;
  String entityLogo;
  String partyCompany;
  String partyCompanyDisplay;
  String partyCountry;
  String partyEmail;
  String currencySymbol;
  String currencyTitle;
  String paymentTermTitle;
  var paymentTermDays;
  var orderNo;
  String createdByName;
  String templateName;
  String gstTreatmentTitle;
  var gstTreatmentIsGst;
  var gstTreatmentIsTax;
  var invoiceMargin;
  String statusName;
  List<Items> items;

  InvoiceDetailsData(
      {this.invoiceId,
        this.orderId,
        this.entityId,
        this.ebId,
        this.partyId,
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
        this.invoiceType,
        this.invoiceIsDomestic,
        this.paymentTermId,
        this.invoiceNo,
        this.invoiceDate,
        this.currencyId,
        this.invoiceTemplateId,
        this.invoiceIsTaxable,
        this.invoiceIsIgst,
        this.invoiceTaxPer,
        this.invoiceTaxAmt,
        this.invoiceDiscount,
        this.invoiceSubTotal,
        this.invoiceTotal,
        this.paymentTotal,
        this.paymentDue,
        this.invoiceNotes,
        this.invoiceTerms,
        this.statusId,
        this.createdById,
        this.ebName,
        this.ebGstTreatmentId,
        this.ebGstNo,
        this.ebAttention,
        this.ebAddress,
        this.ebCity,
        this.ebState,
        this.ebPincode,
        this.ebCountry,
        this.invoiceDueDate,
        this.entityCompany,
        this.entityCompanyDisplay,
        this.entityEmail,
        this.entityCountry,
        this.entityPhone,
        this.entityPan,
        this.entityLogo,
        this.partyCompany,
        this.partyCompanyDisplay,
        this.partyCountry,
        this.partyEmail,
        this.currencySymbol,
        this.currencyTitle,
        this.paymentTermTitle,
        this.paymentTermDays,
        this.orderNo,
        this.createdByName,
        this.templateName,
        this.gstTreatmentTitle,
        this.gstTreatmentIsGst,
        this.gstTreatmentIsTax,
        this.invoiceMargin,
        this.statusName,
        this.items});

  InvoiceDetailsData.fromJson(Map<String, dynamic> json) {
    invoiceId = json['invoice_id'];
    orderId = json['order_id'];
    entityId = json['entity_id'];
    ebId = json['eb_id'];
    partyId = json['party_id'];
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
    invoiceType = json['invoice_type'];
    invoiceIsDomestic = json['invoice_is_domestic'];
    paymentTermId = json['payment_term_id'];
    invoiceNo = json['invoice_no'];
    invoiceDate = json['invoice_date'];
    currencyId = json['currency_id'];
    invoiceTemplateId = json['invoice_template_id'];
    invoiceIsTaxable = json['invoice_is_taxable'];
    invoiceIsIgst = json['invoice_is_igst'];
    invoiceTaxPer = json['invoice_tax_per'];
    invoiceTaxAmt = json['invoice_tax_amt'];
    invoiceDiscount = json['invoice_discount'];
    invoiceSubTotal = json['invoice_sub_total'];
    invoiceTotal = json['invoice_total'];
    paymentTotal = json['payment_total'];
    paymentDue = json['payment_due'];
    invoiceNotes = json['invoice_notes'];
    invoiceTerms = json['invoice_terms'];
    statusId = json['status_id'];
    createdById = json['created_by_id'];
    ebName = json['eb_name'];
    ebGstTreatmentId = json['eb_gst_treatment_id'];
    ebGstNo = json['eb_gst_no'];
    ebAttention = json['eb_attention'];
    ebAddress = json['eb_address'];
    ebCity = json['eb_city'];
    ebState = json['eb_state'];
    ebPincode = json['eb_pincode'];
    ebCountry = json['eb_country'];
    invoiceDueDate = json['invoice_due_date'];
    entityCompany = json['entity_company'];
    entityCompanyDisplay = json['entity_company_display'];
    entityEmail = json['entity_email'];
    entityCountry = json['entity_country'];
    entityPhone = json['entity_phone'];
    entityPan = json['entity_pan'];
    entityLogo = json['entity_logo'];
    partyCompany = json['party_company'];
    partyCompanyDisplay = json['party_company_display'];
    partyCountry = json['party_country'];
    partyEmail = json['party_email'];
    currencySymbol = json['currency_symbol'];
    currencyTitle = json['currency_title'];
    paymentTermTitle = json['payment_term_title'];
    paymentTermDays = json['payment_term_days'];
    orderNo = json['order_no'];
    createdByName = json['created_by_name'];
    templateName = json['template_name'];
    gstTreatmentTitle = json['gst_treatment_title'];
    gstTreatmentIsGst = json['gst_treatment_is_gst'];
    gstTreatmentIsTax = json['gst_treatment_is_tax'];
    invoiceMargin = json['invoice_margin'];
    statusName = json['status_name'];
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invoice_id'] = this.invoiceId;
    data['order_id'] = this.orderId;
    data['entity_id'] = this.entityId;
    data['eb_id'] = this.ebId;
    data['party_id'] = this.partyId;
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
    data['invoice_type'] = this.invoiceType;
    data['invoice_is_domestic'] = this.invoiceIsDomestic;
    data['payment_term_id'] = this.paymentTermId;
    data['invoice_no'] = this.invoiceNo;
    data['invoice_date'] = this.invoiceDate;
    data['currency_id'] = this.currencyId;
    data['invoice_template_id'] = this.invoiceTemplateId;
    data['invoice_is_taxable'] = this.invoiceIsTaxable;
    data['invoice_is_igst'] = this.invoiceIsIgst;
    data['invoice_tax_per'] = this.invoiceTaxPer;
    data['invoice_tax_amt'] = this.invoiceTaxAmt;
    data['invoice_discount'] = this.invoiceDiscount;
    data['invoice_sub_total'] = this.invoiceSubTotal;
    data['invoice_total'] = this.invoiceTotal;
    data['payment_total'] = this.paymentTotal;
    data['payment_due'] = this.paymentDue;
    data['invoice_notes'] = this.invoiceNotes;
    data['invoice_terms'] = this.invoiceTerms;
    data['status_id'] = this.statusId;
    data['created_by_id'] = this.createdById;
    data['eb_name'] = this.ebName;
    data['eb_gst_treatment_id'] = this.ebGstTreatmentId;
    data['eb_gst_no'] = this.ebGstNo;
    data['eb_attention'] = this.ebAttention;
    data['eb_address'] = this.ebAddress;
    data['eb_city'] = this.ebCity;
    data['eb_state'] = this.ebState;
    data['eb_pincode'] = this.ebPincode;
    data['eb_country'] = this.ebCountry;
    data['invoice_due_date'] = this.invoiceDueDate;
    data['entity_company'] = this.entityCompany;
    data['entity_company_display'] = this.entityCompanyDisplay;
    data['entity_email'] = this.entityEmail;
    data['entity_country'] = this.entityCountry;
    data['entity_phone'] = this.entityPhone;
    data['entity_pan'] = this.entityPan;
    data['entity_logo'] = this.entityLogo;
    data['party_company'] = this.partyCompany;
    data['party_company_display'] = this.partyCompanyDisplay;
    data['party_country'] = this.partyCountry;
    data['party_email'] = this.partyEmail;
    data['currency_symbol'] = this.currencySymbol;
    data['currency_title'] = this.currencyTitle;
    data['payment_term_title'] = this.paymentTermTitle;
    data['payment_term_days'] = this.paymentTermDays;
    data['order_no'] = this.orderNo;
    data['created_by_name'] = this.createdByName;
    data['template_name'] = this.templateName;
    data['gst_treatment_title'] = this.gstTreatmentTitle;
    data['gst_treatment_is_gst'] = this.gstTreatmentIsGst;
    data['gst_treatment_is_tax'] = this.gstTreatmentIsTax;
    data['invoice_margin'] = this.invoiceMargin;
    data['status_name'] = this.statusName;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  var iiId;
  var invoiceId;
  var oiId;
  var itemId;
  String iiName;
  var iiCode;
  var iiDescription;
  var iiRate;
  var iiQuantity;
  var taxGroupId;
  var iiTaxPer;
  var iiTaxAmt;
  var iiDiscount;
  var iiSubTotal;
  var iiTotal;
  var categoryId;
  var taxGroupName;
  var taxGroupRate;
  var totalQuantity;
  var maxRate;
  var totalRate;
  var maxQuantity;
  String categoryName;

  Items(
      {this.iiId,
        this.invoiceId,
        this.oiId,
        this.itemId,
        this.iiName,
        this.iiCode,
        this.iiDescription,
        this.iiRate,
        this.iiQuantity,
        this.taxGroupId,
        this.iiTaxPer,
        this.iiTaxAmt,
        this.iiDiscount,
        this.iiSubTotal,
        this.iiTotal,
        this.categoryId,
        this.taxGroupName,
        this.taxGroupRate,
        this.totalQuantity,
        this.maxRate,
        this.totalRate,
        this.maxQuantity,
        this.categoryName});

  Items.fromJson(Map<String, dynamic> json) {
    iiId = json['ii_id'];
    invoiceId = json['invoice_id'];
    oiId = json['oi_id'];
    itemId = json['item_id'];
    iiName = json['ii_name'];
    iiCode = json['ii_code'];
    iiDescription = json['ii_description'];
    iiRate = json['ii_rate'];
    iiQuantity = json['ii_quantity'];
    taxGroupId = json['tax_group_id'];
    iiTaxPer = json['ii_tax_per'];
    iiTaxAmt = json['ii_tax_amt'];
    iiDiscount = json['ii_discount'];
    iiSubTotal = json['ii_sub_total'];
    iiTotal = json['ii_total'];
    categoryId = json['category_id'];
    taxGroupName = json['tax_group_name'];
    taxGroupRate = json['tax_group_rate'];
    totalQuantity = json['total_quantity'];
    maxRate = json['max_rate'];
    totalRate = json['total_rate'];
    maxQuantity = json['max_quantity'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ii_id'] = this.iiId;
    data['invoice_id'] = this.invoiceId;
    data['oi_id'] = this.oiId;
    data['item_id'] = this.itemId;
    data['ii_name'] = this.iiName;
    data['ii_code'] = this.iiCode;
    data['ii_description'] = this.iiDescription;
    data['ii_rate'] = this.iiRate;
    data['ii_quantity'] = this.iiQuantity;
    data['tax_group_id'] = this.taxGroupId;
    data['ii_tax_per'] = this.iiTaxPer;
    data['ii_tax_amt'] = this.iiTaxAmt;
    data['ii_discount'] = this.iiDiscount;
    data['ii_sub_total'] = this.iiSubTotal;
    data['ii_total'] = this.iiTotal;
    data['category_id'] = this.categoryId;
    data['tax_group_name'] = this.taxGroupName;
    data['tax_group_rate'] = this.taxGroupRate;
    data['total_quantity'] = this.totalQuantity;
    data['max_rate'] = this.maxRate;
    data['total_rate'] = this.totalRate;
    data['max_quantity'] = this.maxQuantity;
    data['category_name'] = this.categoryName;
    return data;
  }
}
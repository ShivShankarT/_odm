class PurchaseDetailsResponse {
  bool error;
  List<PurchaseDetailsData> data;
  String message;
  var iTs;

  PurchaseDetailsResponse({this.error, this.data, this.message, this.iTs});

  PurchaseDetailsResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['data'] != null) {
      data = new List<PurchaseDetailsData>();
      json['data'].forEach((v) {
        data.add(new PurchaseDetailsData.fromJson(v));
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

class PurchaseDetailsData {
  var porderId;
  var orderId;
  var billingEntityId;
  var shippingEntityId;
  var pbId;
  String pbName;
  var pbGstTreatmentId;
  var porderTemplateId;
  String pbGstNo;
  String pbAttention;
  String pbAddress;
  String pbCity;
  String pbState;
  var pbPincode;
  String pbCountry;
  var partyId;
  String partyCompanyDisplay;
  var ebBId;
  String ebBName;
  var ebBGstTreatmentId;
  String ebBGstNo;
  String ebBAttention;
  String ebBAddress;
  String ebBCity;
  String ebBState;
  var ebBPincode;
  String ebBCountry;
  var ebSId;
  String ebSName;
  var ebSGstTreatmentId;
  String ebSGstNo;
  String ebSAttention;
  String ebSAddress;
  String ebSCity;
  String ebSState;
  var ebSPincode;
  String ebSCountry;
  var paymentTermId;
  var porderNo;
  var porderDate;
  var deliveryDate;
  var currencyId;
  var porderIsTaxable;
  var porderIsIgst;
  var porderTaxPer;
  var porderTaxAmt;
  var porderDiscount;
  var porderSubTotal;
  var porderTotal;
  var invoiceAmount;
  var paymentAmount;
  var invoiceDue;
  var porderNotes;
  String porderTerms;
  String porderStatus;
  var porderRefNo;
  var createdById;
  String billingEntityCompany;
  String billingEntityCompanyDisplay;
  String billingEntityEmail;
  String billingEntityCountry;
  var billingEntityPhone;
  String billingEntityPan;
  String billingEntityLogo;
  String shippingEntityCompany;
  String shippingEntityCompanyDisplay;
  String shippingEntityEmail;
  String shippingEntityCountry;
  var shippingEntityPhone;
  String shippingEntityPan;
  String shippingEntityLogo;
  String partyCompany;
  String partyCountry;
  String partyEmail;
  String currencySymbol;
  String currencyTitle;
  String paymentTermTitle;
  String createdByName;
  String templateName;
  String gstTreatmentTitle;
  var gstTreatmentIsGst;
  var gstTreatmentIsTax;
  var totalInvoiceAmount;
  var totalPaymentAmount;
  var orderNo;
  List<Items> items;

  PurchaseDetailsData(
      {this.porderId,
        this.orderId,
        this.billingEntityId,
        this.shippingEntityId,
        this.pbId,
        this.pbName,
        this.pbGstTreatmentId,
        this.porderTemplateId,
        this.pbGstNo,
        this.pbAttention,
        this.pbAddress,
        this.pbCity,
        this.pbState,
        this.pbPincode,
        this.pbCountry,
        this.partyId,
        this.partyCompanyDisplay,
        this.ebBId,
        this.ebBName,
        this.ebBGstTreatmentId,
        this.ebBGstNo,
        this.ebBAttention,
        this.ebBAddress,
        this.ebBCity,
        this.ebBState,
        this.ebBPincode,
        this.ebBCountry,
        this.ebSId,
        this.ebSName,
        this.ebSGstTreatmentId,
        this.ebSGstNo,
        this.ebSAttention,
        this.ebSAddress,
        this.ebSCity,
        this.ebSState,
        this.ebSPincode,
        this.ebSCountry,
        this.paymentTermId,
        this.porderNo,
        this.porderDate,
        this.deliveryDate,
        this.currencyId,
        this.porderIsTaxable,
        this.porderIsIgst,
        this.porderTaxPer,
        this.porderTaxAmt,
        this.porderDiscount,
        this.porderSubTotal,
        this.porderTotal,
        this.invoiceAmount,
        this.paymentAmount,
        this.invoiceDue,
        this.porderNotes,
        this.porderTerms,
        this.porderStatus,
        this.porderRefNo,
        this.createdById,
        this.billingEntityCompany,
        this.billingEntityCompanyDisplay,
        this.billingEntityEmail,
        this.billingEntityCountry,
        this.billingEntityPhone,
        this.billingEntityPan,
        this.billingEntityLogo,
        this.shippingEntityCompany,
        this.shippingEntityCompanyDisplay,
        this.shippingEntityEmail,
        this.shippingEntityCountry,
        this.shippingEntityPhone,
        this.shippingEntityPan,
        this.shippingEntityLogo,
        this.partyCompany,
        this.partyCountry,
        this.partyEmail,
        this.currencySymbol,
        this.currencyTitle,
        this.paymentTermTitle,
        this.createdByName,
        this.templateName,
        this.gstTreatmentTitle,
        this.gstTreatmentIsGst,
        this.gstTreatmentIsTax,
        this.totalInvoiceAmount,
        this.totalPaymentAmount,
        this.orderNo,
        this.items});

  PurchaseDetailsData.fromJson(Map<String, dynamic> json) {
    porderId = json['porder_id'];
    orderId = json['order_id'];
    billingEntityId = json['billing_entity_id'];
    shippingEntityId = json['shipping_entity_id'];
    pbId = json['pb_id'];
    pbName = json['pb_name'];
    pbGstTreatmentId = json['pb_gst_treatment_id'];
    porderTemplateId = json['porder_template_id'];
    pbGstNo = json['pb_gst_no'];
    pbAttention = json['pb_attention'];
    pbAddress = json['pb_address'];
    pbCity = json['pb_city'];
    pbState = json['pb_state'];
    pbPincode = json['pb_pincode'];
    pbCountry = json['pb_country'];
    partyId = json['party_id'];
    partyCompanyDisplay = json['party_company_display'];
    ebBId = json['eb_b_id'];
    ebBName = json['eb_b_name'];
    ebBGstTreatmentId = json['eb_b_gst_treatment_id'];
    ebBGstNo = json['eb_b_gst_no'];
    ebBAttention = json['eb_b_attention'];
    ebBAddress = json['eb_b_address'];
    ebBCity = json['eb_b_city'];
    ebBState = json['eb_b_state'];
    ebBPincode = json['eb_b_pincode'];
    ebBCountry = json['eb_b_country'];
    ebSId = json['eb_s_id'];
    ebSName = json['eb_s_name'];
    ebSGstTreatmentId = json['eb_s_gst_treatment_id'];
    ebSGstNo = json['eb_s_gst_no'];
    ebSAttention = json['eb_s_attention'];
    ebSAddress = json['eb_s_address'];
    ebSCity = json['eb_s_city'];
    ebSState = json['eb_s_state'];
    ebSPincode = json['eb_s_pincode'];
    ebSCountry = json['eb_s_country'];
    paymentTermId = json['payment_term_id'];
    porderNo = json['porder_no'];
    porderDate = json['porder_date'];
    deliveryDate = json['delivery_date'];
    currencyId = json['currency_id'];
    porderIsTaxable = json['porder_is_taxable'];
    porderIsIgst = json['porder_is_igst'];
    porderTaxPer = json['porder_tax_per'];
    porderTaxAmt = json['porder_tax_amt'];
    porderDiscount = json['porder_discount'];
    porderSubTotal = json['porder_sub_total'];
    porderTotal = json['porder_total'];
    invoiceAmount = json['invoice_amount'];
    paymentAmount = json['payment_amount'];
    invoiceDue = json['invoice_due'];
    porderNotes = json['porder_notes'];
    porderTerms = json['porder_terms'];
    porderStatus = json['porder_status'];
    porderRefNo = json['porder_ref_no'];
    createdById = json['created_by_id'];
    billingEntityCompany = json['billing_entity_company'];
    billingEntityCompanyDisplay = json['billing_entity_company_display'];
    billingEntityEmail = json['billing_entity_email'];
    billingEntityCountry = json['billing_entity_country'];
    billingEntityPhone = json['billing_entity_phone'];
    billingEntityPan = json['billing_entity_pan'];
    billingEntityLogo = json['billing_entity_logo'];
    shippingEntityCompany = json['shipping_entity_company'];
    shippingEntityCompanyDisplay = json['shipping_entity_company_display'];
    shippingEntityEmail = json['shipping_entity_email'];
    shippingEntityCountry = json['shipping_entity_country'];
    shippingEntityPhone = json['shipping_entity_phone'];
    shippingEntityPan = json['shipping_entity_pan'];
    shippingEntityLogo = json['shipping_entity_logo'];
    partyCompany = json['party_company'];
    partyCountry = json['party_country'];
    partyEmail = json['party_email'];
    currencySymbol = json['currency_symbol'];
    currencyTitle = json['currency_title'];
    paymentTermTitle = json['payment_term_title'];
    createdByName = json['created_by_name'];
    templateName = json['template_name'];
    gstTreatmentTitle = json['gst_treatment_title'];
    gstTreatmentIsGst = json['gst_treatment_is_gst'];
    gstTreatmentIsTax = json['gst_treatment_is_tax'];
    totalInvoiceAmount = json['total_invoice_amount'];
    totalPaymentAmount = json['total_payment_amount'];
    orderNo = json['order_no'];
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['porder_id'] = this.porderId;
    data['order_id'] = this.orderId;
    data['billing_entity_id'] = this.billingEntityId;
    data['shipping_entity_id'] = this.shippingEntityId;
    data['pb_id'] = this.pbId;
    data['pb_name'] = this.pbName;
    data['pb_gst_treatment_id'] = this.pbGstTreatmentId;
    data['porder_template_id'] = this.porderTemplateId;
    data['pb_gst_no'] = this.pbGstNo;
    data['pb_attention'] = this.pbAttention;
    data['pb_address'] = this.pbAddress;
    data['pb_city'] = this.pbCity;
    data['pb_state'] = this.pbState;
    data['pb_pincode'] = this.pbPincode;
    data['pb_country'] = this.pbCountry;
    data['party_id'] = this.partyId;
    data['party_company_display'] = this.partyCompanyDisplay;
    data['eb_b_id'] = this.ebBId;
    data['eb_b_name'] = this.ebBName;
    data['eb_b_gst_treatment_id'] = this.ebBGstTreatmentId;
    data['eb_b_gst_no'] = this.ebBGstNo;
    data['eb_b_attention'] = this.ebBAttention;
    data['eb_b_address'] = this.ebBAddress;
    data['eb_b_city'] = this.ebBCity;
    data['eb_b_state'] = this.ebBState;
    data['eb_b_pincode'] = this.ebBPincode;
    data['eb_b_country'] = this.ebBCountry;
    data['eb_s_id'] = this.ebSId;
    data['eb_s_name'] = this.ebSName;
    data['eb_s_gst_treatment_id'] = this.ebSGstTreatmentId;
    data['eb_s_gst_no'] = this.ebSGstNo;
    data['eb_s_attention'] = this.ebSAttention;
    data['eb_s_address'] = this.ebSAddress;
    data['eb_s_city'] = this.ebSCity;
    data['eb_s_state'] = this.ebSState;
    data['eb_s_pincode'] = this.ebSPincode;
    data['eb_s_country'] = this.ebSCountry;
    data['payment_term_id'] = this.paymentTermId;
    data['porder_no'] = this.porderNo;
    data['porder_date'] = this.porderDate;
    data['delivery_date'] = this.deliveryDate;
    data['currency_id'] = this.currencyId;
    data['porder_is_taxable'] = this.porderIsTaxable;
    data['porder_is_igst'] = this.porderIsIgst;
    data['porder_tax_per'] = this.porderTaxPer;
    data['porder_tax_amt'] = this.porderTaxAmt;
    data['porder_discount'] = this.porderDiscount;
    data['porder_sub_total'] = this.porderSubTotal;
    data['porder_total'] = this.porderTotal;
    data['invoice_amount'] = this.invoiceAmount;
    data['payment_amount'] = this.paymentAmount;
    data['invoice_due'] = this.invoiceDue;
    data['porder_notes'] = this.porderNotes;
    data['porder_terms'] = this.porderTerms;
    data['porder_status'] = this.porderStatus;
    data['porder_ref_no'] = this.porderRefNo;
    data['created_by_id'] = this.createdById;
    data['billing_entity_company'] = this.billingEntityCompany;
    data['billing_entity_company_display'] = this.billingEntityCompanyDisplay;
    data['billing_entity_email'] = this.billingEntityEmail;
    data['billing_entity_country'] = this.billingEntityCountry;
    data['billing_entity_phone'] = this.billingEntityPhone;
    data['billing_entity_pan'] = this.billingEntityPan;
    data['billing_entity_logo'] = this.billingEntityLogo;
    data['shipping_entity_company'] = this.shippingEntityCompany;
    data['shipping_entity_company_display'] = this.shippingEntityCompanyDisplay;
    data['shipping_entity_email'] = this.shippingEntityEmail;
    data['shipping_entity_country'] = this.shippingEntityCountry;
    data['shipping_entity_phone'] = this.shippingEntityPhone;
    data['shipping_entity_pan'] = this.shippingEntityPan;
    data['shipping_entity_logo'] = this.shippingEntityLogo;
    data['party_company'] = this.partyCompany;
    data['party_country'] = this.partyCountry;
    data['party_email'] = this.partyEmail;
    data['currency_symbol'] = this.currencySymbol;
    data['currency_title'] = this.currencyTitle;
    data['payment_term_title'] = this.paymentTermTitle;
    data['created_by_name'] = this.createdByName;
    data['template_name'] = this.templateName;
    data['gst_treatment_title'] = this.gstTreatmentTitle;
    data['gst_treatment_is_gst'] = this.gstTreatmentIsGst;
    data['gst_treatment_is_tax'] = this.gstTreatmentIsTax;
    data['total_invoice_amount'] = this.totalInvoiceAmount;
    data['total_payment_amount'] = this.totalPaymentAmount;
    data['order_no'] = this.orderNo;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  var poiId;
  var porderId;
  var oiId;
  var itemId;
  String poiType;
  String poiName;
  var poiCode;
  var poiDescription;
  var poiRate;
  var poiQuantity;
  var taxGroupId;
  var poiTaxPer;
  var poiTaxAmt;
  var poiDiscount;
  var poiSubTotal;
  var poiTotal;
  String taxGroupName;

  Items(
      {this.poiId,
        this.porderId,
        this.oiId,
        this.itemId,
        this.poiType,
        this.poiName,
        this.poiCode,
        this.poiDescription,
        this.poiRate,
        this.poiQuantity,
        this.taxGroupId,
        this.poiTaxPer,
        this.poiTaxAmt,
        this.poiDiscount,
        this.poiSubTotal,
        this.poiTotal,
        this.taxGroupName});

  Items.fromJson(Map<String, dynamic> json) {
    poiId = json['poi_id'];
    porderId = json['porder_id'];
    oiId = json['oi_id'];
    itemId = json['item_id'];
    poiType = json['poi_type'];
    poiName = json['poi_name'];
    poiCode = json['poi_code'];
    poiDescription = json['poi_description'];
    poiRate = json['poi_rate'];
    poiQuantity = json['poi_quantity'];
    taxGroupId = json['tax_group_id'];
    poiTaxPer = json['poi_tax_per'];
    poiTaxAmt = json['poi_tax_amt'];
    poiDiscount = json['poi_discount'];
    poiSubTotal = json['poi_sub_total'];
    poiTotal = json['poi_total'];
    taxGroupName = json['tax_group_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['poi_id'] = this.poiId;
    data['porder_id'] = this.porderId;
    data['oi_id'] = this.oiId;
    data['item_id'] = this.itemId;
    data['poi_type'] = this.poiType;
    data['poi_name'] = this.poiName;
    data['poi_code'] = this.poiCode;
    data['poi_description'] = this.poiDescription;
    data['poi_rate'] = this.poiRate;
    data['poi_quantity'] = this.poiQuantity;
    data['tax_group_id'] = this.taxGroupId;
    data['poi_tax_per'] = this.poiTaxPer;
    data['poi_tax_amt'] = this.poiTaxAmt;
    data['poi_discount'] = this.poiDiscount;
    data['poi_sub_total'] = this.poiSubTotal;
    data['poi_total'] = this.poiTotal;
    data['tax_group_name'] = this.taxGroupName;
    return data;
  }
}
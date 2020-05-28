class QuotationDetailsResponse {
  bool error;
  List<QDetailsData> data;
  String message;
  int iTs;

  QuotationDetailsResponse({this.error, this.data, this.message, this.iTs});

  QuotationDetailsResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['data'] != null) {
      data = new List<QDetailsData>();
      json['data'].forEach((v) {
        data.add(new QDetailsData.fromJson(v));
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

class QDetailsData {
  var quotationId;
  var entityId;
  var ebId;
  var partyId;
  String partyCompanyDisplay;
  var pbBId;
  var pbBName;
  var pbBGstTreatmentId;
  var pbBGstNo;
  String pbBAttention;
  String pbBAddress;
  String pbBCity;
  String pbBState;
  var pbBPincode;
  String pbBCountry;
  var pbSId;
  String pbSName;
  int pbSGstTreatmentId;
  var pbSGstNo;
  String pbSAttention;
  String pbSAddress;
  String pbSCity;
  String pbSState;
  var pbSPincode;
  String pbSCountry;
  String supplyPlace;
  var paymentTermId;
  var quotationNo;
  String quotationDate;
  String quotationExpiryDate;
  var currencyId;
  var quotationIsTaxable;
  var quotationIsIgst;
  var quotationTaxPer;
  var quotationTaxAmt;
  var quotationDiscount;
  var quotationSubTotal;
  var quotationTotal;
  var quotationNotes;
  String quotationTerms;
  String quotationStatus;
  var quotationTemplateId;
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
  String entityCompany;
  String entityCompanyDisplay;
  String entityEmail;
  String entityCountry;
  var entityPhone;
  String entityPan;
  String entityLogo;
  String partyCompany;
  String partyCountry;
  String partyEmail;
  String currencySymbol;
  String currencyTitle;
  String paymentTermTitle;
  String createdByName;
  String gstTreatmentTitle;
  var gstTreatmentIsGst;
  var gstTreatmentIsTax;
  String templateName;
  List<Items> items;

  QDetailsData(
      {this.quotationId,
        this.entityId,
        this.ebId,
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
        this.quotationNo,
        this.quotationDate,
        this.quotationExpiryDate,
        this.currencyId,
        this.quotationIsTaxable,
        this.quotationIsIgst,
        this.quotationTaxPer,
        this.quotationTaxAmt,
        this.quotationDiscount,
        this.quotationSubTotal,
        this.quotationTotal,
        this.quotationNotes,
        this.quotationTerms,
        this.quotationStatus,
        this.quotationTemplateId,
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
        this.entityCompany,
        this.entityCompanyDisplay,
        this.entityEmail,
        this.entityCountry,
        this.entityPhone,
        this.entityPan,
        this.entityLogo,
        this.partyCompany,
        this.partyCountry,
        this.partyEmail,
        this.currencySymbol,
        this.currencyTitle,
        this.paymentTermTitle,
        this.createdByName,
        this.gstTreatmentTitle,
        this.gstTreatmentIsGst,
        this.gstTreatmentIsTax,
        this.templateName,
        this.items});

  QDetailsData.fromJson(Map<String, dynamic> json) {
    quotationId = json['quotation_id'];
    entityId = json['entity_id'];
    ebId = json['eb_id'];
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
    quotationNo = json['quotation_no'];
    quotationDate = json['quotation_date'];
    quotationExpiryDate = json['quotation_expiry_date'];
    currencyId = json['currency_id'];
    quotationIsTaxable = json['quotation_is_taxable'];
    quotationIsIgst = json['quotation_is_igst'];
    quotationTaxPer = json['quotation_tax_per'];
    quotationTaxAmt = json['quotation_tax_amt'];
    quotationDiscount = json['quotation_discount'];
    quotationSubTotal = json['quotation_sub_total'];
    quotationTotal = json['quotation_total'];
    quotationNotes = json['quotation_notes'];
    quotationTerms = json['quotation_terms'];
    quotationStatus = json['quotation_status'];
    quotationTemplateId = json['quotation_template_id'];
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
    entityCompany = json['entity_company'];
    entityCompanyDisplay = json['entity_company_display'];
    entityEmail = json['entity_email'];
    entityCountry = json['entity_country'];
    entityPhone = json['entity_phone'];
    entityPan = json['entity_pan'];
    entityLogo = json['entity_logo'];
    partyCompany = json['party_company'];
    partyCountry = json['party_country'];
    partyEmail = json['party_email'];
    currencySymbol = json['currency_symbol'];
    currencyTitle = json['currency_title'];
    paymentTermTitle = json['payment_term_title'];
    createdByName = json['created_by_name'];
    gstTreatmentTitle = json['gst_treatment_title'];
    gstTreatmentIsGst = json['gst_treatment_is_gst'];
    gstTreatmentIsTax = json['gst_treatment_is_tax'];
    templateName = json['template_name'];
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quotation_id'] = this.quotationId;
    data['entity_id'] = this.entityId;
    data['eb_id'] = this.ebId;
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
    data['quotation_no'] = this.quotationNo;
    data['quotation_date'] = this.quotationDate;
    data['quotation_expiry_date'] = this.quotationExpiryDate;
    data['currency_id'] = this.currencyId;
    data['quotation_is_taxable'] = this.quotationIsTaxable;
    data['quotation_is_igst'] = this.quotationIsIgst;
    data['quotation_tax_per'] = this.quotationTaxPer;
    data['quotation_tax_amt'] = this.quotationTaxAmt;
    data['quotation_discount'] = this.quotationDiscount;
    data['quotation_sub_total'] = this.quotationSubTotal;
    data['quotation_total'] = this.quotationTotal;
    data['quotation_notes'] = this.quotationNotes;
    data['quotation_terms'] = this.quotationTerms;
    data['quotation_status'] = this.quotationStatus;
    data['quotation_template_id'] = this.quotationTemplateId;
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
    data['entity_company'] = this.entityCompany;
    data['entity_company_display'] = this.entityCompanyDisplay;
    data['entity_email'] = this.entityEmail;
    data['entity_country'] = this.entityCountry;
    data['entity_phone'] = this.entityPhone;
    data['entity_pan'] = this.entityPan;
    data['entity_logo'] = this.entityLogo;
    data['party_company'] = this.partyCompany;
    data['party_country'] = this.partyCountry;
    data['party_email'] = this.partyEmail;
    data['currency_symbol'] = this.currencySymbol;
    data['currency_title'] = this.currencyTitle;
    data['payment_term_title'] = this.paymentTermTitle;
    data['created_by_name'] = this.createdByName;
    data['gst_treatment_title'] = this.gstTreatmentTitle;
    data['gst_treatment_is_gst'] = this.gstTreatmentIsGst;
    data['gst_treatment_is_tax'] = this.gstTreatmentIsTax;
    data['template_name'] = this.templateName;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int qiId;
  int quotationId;
  int itemId;
  String qiType;
  String qiName;
  int qiCode;
  var qiDescription;
  int qiRate;
  int qiQuantity;
  int taxGroupId;
  int qiTaxPer;
  var qiTaxAmt;
  var qiDiscount;
  var qiSubTotal;
  var qiTotal;
  String taxGroupName;

  Items(
      {this.qiId,
        this.quotationId,
        this.itemId,
        this.qiType,
        this.qiName,
        this.qiCode,
        this.qiDescription,
        this.qiRate,
        this.qiQuantity,
        this.taxGroupId,
        this.qiTaxPer,
        this.qiTaxAmt,
        this.qiDiscount,
        this.qiSubTotal,
        this.qiTotal,
        this.taxGroupName});

  Items.fromJson(Map<String, dynamic> json) {
    qiId = json['qi_id'];
    quotationId = json['quotation_id'];
    itemId = json['item_id'];
    qiType = json['qi_type'];
    qiName = json['qi_name'];
    qiCode = json['qi_code'];
    qiDescription = json['qi_description'];
    qiRate = json['qi_rate'];
    qiQuantity = json['qi_quantity'];
    taxGroupId = json['tax_group_id'];
    qiTaxPer = json['qi_tax_per'];
    qiTaxAmt = json['qi_tax_amt'];
    qiDiscount = json['qi_discount'];
    qiSubTotal = json['qi_sub_total'];
    qiTotal = json['qi_total'];
    taxGroupName = json['tax_group_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qi_id'] = this.qiId;
    data['quotation_id'] = this.quotationId;
    data['item_id'] = this.itemId;
    data['qi_type'] = this.qiType;
    data['qi_name'] = this.qiName;
    data['qi_code'] = this.qiCode;
    data['qi_description'] = this.qiDescription;
    data['qi_rate'] = this.qiRate;
    data['qi_quantity'] = this.qiQuantity;
    data['tax_group_id'] = this.taxGroupId;
    data['qi_tax_per'] = this.qiTaxPer;
    data['qi_tax_amt'] = this.qiTaxAmt;
    data['qi_discount'] = this.qiDiscount;
    data['qi_sub_total'] = this.qiSubTotal;
    data['qi_total'] = this.qiTotal;
    data['tax_group_name'] = this.taxGroupName;
    return data;
  }
}
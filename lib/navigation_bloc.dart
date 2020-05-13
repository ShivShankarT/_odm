

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odm/pages/change_password.dart';
import 'package:odm/pages/home_page.dart';
import 'package:odm/pages/invoices_page.dart';
import 'package:odm/pages/logout.dart';
import 'package:odm/pages/purchage_order_page.dart';
import 'package:odm/pages/quotation_page.dart';
import 'package:odm/pages/work_order_page.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  MyQuotationClickedEvent,
  MyWorkOrdersClickedEvent,
  MyPurchaseOrderClickedEvent,
  MyInvoicesClickedEvent,
  MyChangePasswordClickedEvent,
  MyLogoutClickedEvent
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => PurchageOrderpage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.MyQuotationClickedEvent:
        yield QuotationPage();
        break;
      case NavigationEvents.MyWorkOrdersClickedEvent:
        yield WorkOrderPage();
        break;
      case NavigationEvents.MyPurchaseOrderClickedEvent:
        yield PurchageOrderpage();
        break;
      case NavigationEvents.MyInvoicesClickedEvent:
        yield InvoiceScreen();
        break;
      case NavigationEvents.MyChangePasswordClickedEvent:
        yield ChangePassword();
        break;
      case NavigationEvents.MyLogoutClickedEvent:
        yield Logout();
        break;
    }
  }
}
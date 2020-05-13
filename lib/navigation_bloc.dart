

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odm/pages/home_page.dart';
import 'package:odm/pages/purchage_order_page.dart';
import 'package:odm/pages/work_order_page.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  MyAccountClickedEvent,
  MyOrdersClickedEvent,
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
      case NavigationEvents.MyAccountClickedEvent:
        yield PurchageOrderpage();
        break;
      case NavigationEvents.MyOrdersClickedEvent:
        yield WorkOrderPage();
        break;
    }
  }
}
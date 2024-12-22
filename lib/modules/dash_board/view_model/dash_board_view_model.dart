import '../entities/order_type_model.dart';
import '../entities/orders_data_model.dart';

class DashBoardViewModel {
  late List<OrdersDataModel> ordersDataModel;
  String? totalOrders;
  String? averagePrice;
  String? returnedCount;

  DashBoardViewModel(List<OrdersDataModel> data) {
    ordersDataModel = data;
    _setData();
  }

  void _setData(){
    totalOrders = ordersDataModel.length.toString();
    averagePrice = _getAveragePrice();
    returnedCount = _getReturnedCount();
  }

  String? _getAveragePrice(){
    double totalRevenue = 0.0;
    for (var order in ordersDataModel) {
      if(order.price != null) {
        String priceString = order.price!.replaceAll('\$', '').replaceAll(
            ',', '');
        double price = double.parse(priceString);
        totalRevenue += price;
      }
    }
    return '\$${(totalRevenue / ordersDataModel.length).toStringAsFixed(2)}';
  }

  String? _getReturnedCount() {
    int returnedOrders = 0;
    for (var order in ordersDataModel) {
      if(order.status == "RETURNED") {
        returnedOrders ++;
      }
    }
    return returnedOrders.toString();
  }

  List<OrderTypeModel> getOrderData() {
    int deliveredOrders = 0;
    int orderedOrders = 0;
    int returnedOrders = 0;
    for (var order in ordersDataModel) {
      switch (order.status){
        case "DELIVERED":
          deliveredOrders ++;
          break;
        case "ORDERED":
          orderedOrders ++;
          break;
        case "RETURNED":
          returnedOrders ++;
          break;
      }
    }
    return [
      OrderTypeModel('DELIVERED', deliveredOrders),
      OrderTypeModel('ORDERED', orderedOrders),
      OrderTypeModel('RETURNED', returnedOrders),
    ];
  }
}

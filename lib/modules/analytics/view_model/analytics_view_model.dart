
import '../entities/order_type_model.dart';
import '../entities/orders_data_model.dart';

class AnalyticsViewModel {
  late List<OrdersDataModel> ordersDataModel;
  late List<OrderTypeModel> chartData;
  String? totalOrders;
  String? averagePrice;
  String? returnedCount;

  AnalyticsViewModel(List<OrdersDataModel> data) {
    ordersDataModel = data;
    _setData();
  }

  void _setData() {
    chartData = _getOrderCountByDate();
  }

  List<OrderTypeModel> _getOrderCountByDate() {
    List<OrderTypeModel> timeList = [];
    Map<String, int> aggregatedCounts = {};
    for (var order in ordersDataModel) {
      var x = order.registered!.split('T').last;
      var y = x.split(':')[0];
      timeList.add(OrderTypeModel(y, 1));
    }

    for (var element in timeList) {
      if (aggregatedCounts.containsKey(element.time)) {
        aggregatedCounts[element.time] =
            aggregatedCounts[element.time]! + element.count;
      } else {
        aggregatedCounts[element.time] = element.count;
      }
    }

    List<OrderTypeModel> result = aggregatedCounts.entries
        .map((entry) => OrderTypeModel(entry.key, entry.value))
        .toList();

    return result;
  }
}

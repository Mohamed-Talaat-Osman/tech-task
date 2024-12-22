enum AnalyticsEndpoints {
  orders('assets/files/orders.json');

  const AnalyticsEndpoints(this.path);

  final String path;
}
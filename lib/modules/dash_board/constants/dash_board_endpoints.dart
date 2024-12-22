enum DashBoardEndpoints {
  orders('assets/files/orders.json');

  const DashBoardEndpoints(this.path);

  final String path;
}
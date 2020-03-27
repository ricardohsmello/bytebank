class Transfer {
  String accountName;
  double accountValue;

  Transfer(
    this.accountName,
    this.accountValue,
  );

  @override
  String toString() {
    return 'Transfer{accountName: $accountName, accountValue: $accountValue}';
  }
}

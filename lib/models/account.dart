class Account {
  String accountName;
  double accountValue;
  int id;

  Account(
    this.id,
    this.accountName,
    this.accountValue,
  );

  @override
  String toString() {
    return 'Account{id: $id, accountName: $accountName, accountValue: $accountValue}';
  }
}

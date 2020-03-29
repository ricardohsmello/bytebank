class Account {
  String accountName;
  double accountValue;

  Account(
    this.accountName,
    this.accountValue,
  );

  @override
  String toString() {
    return 'Account{accountName: $accountName, accountValue: $accountValue}';
  }

}

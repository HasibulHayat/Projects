results = {
    'TotalAmountByTransactionType': [
        {'transaction_type': 'Credit', 'total_amount': 4801.00},
        {'transaction_type': 'Debit', 'total_mount': 921.00}
    ],
    'NetBalancePerAccount': [
        {'account_id': 101, 'net_balance': 50.00},
        {'account_id': 102, 'net_balance': 180.00},
        {'account_id': 103, 'net_balance': 200.00},
        {'account_id': 104, 'net_balance': 300.00},
        {'account_id': 105, 'net_balance': 300.00},
        {'account_id': 106, 'net_balance': 250.00},
        {'account_id': 107, 'net_balance': 499.50},
        {'account_id': 108, 'net_balance': 600.50},
        {'account_id': 109, 'net_balance': 700.00},
        {'account_id': 110, 'net_balance': 800.00}
    ],
    'TransactionsPerDay': [
        {'Date': '2023-01-01', 'num_transactions': 2},
        {'Date': '2023-01-02', 'num_transactions': 2},
        {'Date': '2023-01-03', 'num_transactions': 1},
    ],
    'TotalAmountPerDay': [
        {'Date': '2023-01-17', 'total_amount': 900.00},
        {'Date': '2023-01-15', 'total_amount': 800.00},
        {'Date': '2023-01-13', 'total_amount': 700.50},
    ]
}


report_from_data = {
    'Total Amount by Transaction Type': results['TotalAmountByTransactionType'],
    'Net Balance Per Account': results['NetBalancePerAccount'],
    'Transactions Per Day': results['TransactionsPerDay'],
    'Total Amount Per Day': results['TotalAmountPerDay']
}


for title, data in report_from_data.items():
    print(f"=== {title} ===\n")
    for entry in data:
        print(", ".join(f"{i}: {j}" for i, j in entry.items()))
    print()
part of 'models.dart';

enum TransactionStatus {
  delivered,
  on_delivery,
  pending,
  canceled,
}

class Transaction extends Equatable {
  final int? id;
  final Food? food;
  final int? quantity;
  final int? total;
  final DateTime? dateTime;
  final TransactionStatus? status;
  final User? user;

  Transaction({
    this.id,
    this.food,
    this.quantity,
    this.total,
    this.dateTime,
    this.status,
    this.user,
  });

  Transaction copyWith({
    required int id,
    required Food food,
    required int quantity,
    required int total,
    required DateTime dateTime,
    required TransactionStatus status,
    required User user,
  }) {
    return Transaction(
        id: id ?? this.id,
        food: food ?? this.food,
        quantity: quantity ?? this.quantity,
        total: total ?? this.total,
        dateTime: dateTime ?? this.dateTime,
        status: status ?? this.status,
        user: user ?? this.user);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        food,
        quantity,
        total,
        dateTime,
        status,
        user,
      ];
}

List<Transaction> mockTransaction = [
  Transaction(
    id: 1,
    food: mockFoods[1],
    quantity: 3,
    total: (mockFoods[1].price! * 5 * 1.1).toInt() + 50000,
    dateTime: DateTime.now(),
    status: TransactionStatus.on_delivery,
    user: mockUser,
  ),
  Transaction(
    id: 2,
    food: mockFoods[4],
    quantity: 4,
    total: (mockFoods[1].price! * 4 * 1.1).toInt() + 50000,
    dateTime: DateTime.now(),
    status: TransactionStatus.canceled,
    user: mockUser,
  ),
  Transaction(
    id: 3,
    food: mockFoods[0],
    quantity: 2,
    total: (mockFoods[1].price! * 2 * 1.1).toInt() + 50000,
    dateTime: DateTime.now(),
    status: TransactionStatus.delivered,
    user: mockUser,
  )
];

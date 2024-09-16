part of 'models.dart';

class User extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? address;
  final String? houseNumber;
  final String? phoneNumber;
  final String? city;
  final String? picturePath;

  User({
    this.id,
    this.name,
    this.email,
    this.address,
    this.houseNumber,
    this.phoneNumber,
    this.city,
    this.picturePath,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    this.id,
    this.name,
    this.email,
    this.address,
    this.houseNumber,
    this.phoneNumber,
    this.city,
    this.picturePath,
  ];
}

User mockUser = User(
  id: 1,
  name: 'Budi Asep',
  email: 'asep@gmail.com',
  address: 'Jl. Raja Isa No. 09',
  houseNumber: 'A6',
  phoneNumber: '081234567890',
  city: 'Batam',
  picturePath: 'https://i.pinimg.com/236x/42/a6/7e/42a67e1b30179697fba4c30f9c4fa310.jpg'
);

import 'package:dishboard_fruits_app/features/view_order/domain/entities/addressing_shipping_entity.dart';

class AddressingShippingModel {
  final String fullName;
  final String phoneNumber;
  final String address;
  final String city;
  final String addressDetails;
  final String email;
  final String floor;

  AddressingShippingModel({
    required this.fullName,
    required this.phoneNumber,
    required this.address,
    required this.city,
    required this.addressDetails,
    required this.email,
    required this.floor,
  });

  @override
  String toString() {
    return '$address $city $floor';
  }

  factory AddressingShippingModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return AddressingShippingModel.empty();
    return AddressingShippingModel(
      fullName: json['fullName'] ?? "",
      phoneNumber: json['phoneNumber'] ?? "",
      address: json['address'] ?? "",
      city: json['city'] ?? "",
      addressDetails: json['addressDetails'] ?? "",
      email: json['email'] ?? "",
      floor: json['floor'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'address': address,
      'city': city,
      'addressDetails': addressDetails,
      'email': email,
      'floor': floor,
    };
  }

  AddressingShippingEntity toEntity() {
    return AddressingShippingEntity(
      fullName: fullName,
      phoneNumber: phoneNumber,
      address: address,
      city: city,
      addressDetails: addressDetails,
      email: email,
      floor: floor,
    );
  }

  /// Returns an empty AddressingShippingModel with default values
  factory AddressingShippingModel.empty() => AddressingShippingModel(
    fullName: "",
    phoneNumber: "",
    address: "",
    city: "",
    addressDetails: "",
    email: "",
    floor: "",
  );
}

import 'package:dishboard_fruits_app/features/view_order/domain/entities/addressing_shipping_entity.dart';

class AddressingShippingModel {
  String? fullName;
  String? phoneNumber;
  String? address;
  String? city;
  String? addressDetails;
  String? email;
  String? floor;

  AddressingShippingModel({
    this.fullName,
    this.phoneNumber,
    this.address,
    this.city,
    this.addressDetails,
    this.email,
    this.floor,
  });

  @override
  String toString() {
    return '$address $city $floor';
  }

  factory AddressingShippingModel.fromJson(Map<String, dynamic> json) {
    return AddressingShippingModel(
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      city: json['city'],
      addressDetails: json['addressDetails'],
      email: json['email'],
      floor: json['floor'],
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

  toEntity() {
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
}

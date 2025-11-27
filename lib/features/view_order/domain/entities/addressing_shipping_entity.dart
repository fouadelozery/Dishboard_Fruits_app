class AddressingShippingEntity {
  String? fullName;
  String? phoneNumber;
  String? address;
  String? city;
  String? addressDetails;
  String? email;
  String? floor;

  AddressingShippingEntity({
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
}

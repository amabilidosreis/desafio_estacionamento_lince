
/// Cars informations
 class  Car {
   final int? id;
  final String licensePlate;
  final String driverName; ///Driver name
  final String entryFormat;///Entry date
  final String? exitDate;
  final double? price;
  final String? photo;

  const Car({
    this.id,
    required this.licensePlate,
    required this.driverName,
    required this.entryFormat,
    this.exitDate,
    this.price,
    this.photo
  });


  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'entryDate': entryFormat,
      'exitDate': exitDate,
      'licensePlate': licensePlate,
      'driverName': driverName,
      'price': price,
      'photo': photo,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Car{id: $id, entryDate: $entryFormat,'
        ' exitDate: $exitDate,'
        ' licensePlate: $licensePlate, driverName: $driverName, price: $price}';
  }
}
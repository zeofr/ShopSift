import 'package:hive/hive.dart';

part 'samaan.g.dart';

@HiveType(typeId: 0)
class Samaan {
  @HiveField(0)
  String naam;

  @HiveField(1)
  String samaanId;

  @HiveField(2)
  double daam;

  @HiveField(3)
  String soochna;

  @HiveField(4)
  String imagePath;

  Samaan({
    required this.naam,
    required this.samaanId,
    required this.daam,
    required this.soochna,
    required this.imagePath,
  });
}


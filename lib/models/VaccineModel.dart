class VaccineModel {
  late String imageUrl;
  late String name;
  late String desc;
  late int efficacy;
  late String permissions;
  late List<String> sideEffects;

  VaccineModel({
    required this.imageUrl,
    required this.name,
    required this.desc,
    required this.efficacy,
    required this.permissions,
    required this.sideEffects
  });
}
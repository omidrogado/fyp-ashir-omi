class AppUser {
  final String id;
  final String phoneNumber;
  final String name;
  final String userType; // deaf or hearing
  final String? avatarId;

  const AppUser({
    required this.id,
    required this.phoneNumber,
    required this.name,
    required this.userType,
    this.avatarId,
  });
}

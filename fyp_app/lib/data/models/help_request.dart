class HelpRequest {
  final String id;
  final String subject;
  final String description;
  final DateTime createdAt;
  final String status;

  const HelpRequest({
    required this.id,
    required this.subject,
    required this.description,
    required this.createdAt,
    this.status = 'open',
  });
}

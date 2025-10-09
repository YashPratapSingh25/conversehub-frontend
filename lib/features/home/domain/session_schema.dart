class SessionSchema {
  final String id;
  final String userId;
  final String sessionName;
  final String mode;
  final Map<String, dynamic> details;
  final Map<String, dynamic> summaryFeedback;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool saved;

  SessionSchema({
    required this.id,
    required this.userId,
    required this.sessionName,
    required this.mode,
    required this.details,
    required this.summaryFeedback,
    required this.createdAt,
    required this.updatedAt,
    required this.saved,
  });

  factory SessionSchema.fromMap(Map<String, dynamic> map) {
    return SessionSchema(
      id: map['id'] ?? '',
      userId: map['user_id'] ?? '',
      sessionName: map['session_name'] ?? '',
      mode: map['mode'] ?? '',
      details: Map<String, dynamic>.from(map['details'] ?? {}),
      summaryFeedback: Map<String, dynamic>.from(map['summary_feedback'] ?? {}),
      createdAt: DateTime.tryParse(map['created_at'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(map['updated_at'] ?? '') ?? DateTime.now(),
      saved: map['saved'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'sessionName': sessionName,
      'mode': mode,
      'details': details,
      'summaryFeedback': summaryFeedback,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'saved': saved,
    };
  }
}

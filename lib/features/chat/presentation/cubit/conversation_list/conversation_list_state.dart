import 'package:equatable/equatable.dart';
import 'package:rentverse/features/chat/domain/entity/chat_conversation_entity.dart';

enum ConversationListStatus { initial, loading, success, failure }

class ConversationListState extends Equatable {
  final ConversationListStatus status;
  final List<ChatConversationEntity> conversations;
  final String? error;
  final int? statusCode;

  const ConversationListState({
    this.status = ConversationListStatus.initial,
    this.conversations = const [],
    this.error,
    this.statusCode,
  });

  ConversationListState copyWith({
    ConversationListStatus? status,
    List<ChatConversationEntity>? conversations,
    String? error,
    int? statusCode,
  }) {
    return ConversationListState(
      status: status ?? this.status,
      conversations: conversations ?? this.conversations,
      error: error,
      statusCode: statusCode ?? this.statusCode,
    );
  }

  @override
  List<Object?> get props => [status, conversations, error, statusCode];
}

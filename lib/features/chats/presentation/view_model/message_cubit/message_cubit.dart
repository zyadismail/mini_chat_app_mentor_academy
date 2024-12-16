// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:mini_chat_app_mentor_academy/features/chats/data/model/message_model.dart';
// import 'package:mini_chat_app_mentor_academy/features/chats/data/repos/message_repo.dart';

// part 'message_state.dart';

// class MessageCubit extends Cubit<MessageState> {
//   final MessageRepository messageRepository;

//   MessageCubit({required this.messageRepository}) : super(MessageInitial());

//   void loadMessages() {
//     emit(MessageLoading());
//     try {
//       messageRepository.getMessages().listen((messages) {
//         emit(MessageLoaded(messages));
//       // });
//     } catch (e) {
//       emit(MessageError(e.toString()));
//     }
//   }

//   void sendMessage(Message message) async {
//     try {
//       await messageRepository.sendMessage(message);
//     } catch (e) {
//       emit(MessageError(e.toString()));
//     }
//   }
// }

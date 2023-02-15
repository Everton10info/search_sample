part of 'search_user_bloc.dart';

@immutable
abstract class SearchUserState {}

class SearchUserInitial extends SearchUserState {}

class FetchUserCompleted extends SearchUserState {
  final List<User> users;

  FetchUserCompleted({
    required this.users,
  });
}

class SearchUsers extends SearchUserState {
  final List<User> resultUsers;

  SearchUsers({
    required this.resultUsers,
  });
}

class SearchError extends SearchUserState {
  final String message;

  SearchError({required this.message});
}

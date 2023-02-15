part of 'search_user_bloc.dart';

abstract class SearchUserEvent {}

class FetchUserList extends SearchUserEvent {}

class SearchUser extends SearchUserEvent {
  final String valueSearch;
  final List<User> totalList;

  SearchUser({
    required this.valueSearch,
    required this.totalList,
  });
}

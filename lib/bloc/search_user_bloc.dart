import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:search_poc/helpers/search_helper.dart';
import 'package:search_poc/repositories/search_repository.dart';
import '../models/users_model.dart';
import '../resources/appHttpClient/http_client_impl.dart';

part 'search_user_event.dart';
part 'search_user_state.dart';

class SearchUserBloc extends Bloc<SearchUserEvent, SearchUserState> {
  SearchUserBloc() : super(SearchUserInitial()) {
    final reposytory = SearchRepository(HtttpClientImpl());

    on<FetchUserList>((event, emit) async {
      try {
        List<User> result = await reposytory.getLis();

        emit(FetchUserCompleted(users: result));
      } catch (e) {
        emit(SearchError(message: e.toString()));
      }
    });

    on<SearchUser>(
      (event, emit) {
        List<User> resultUsers = SearchHelper.search(
          event.valueSearch,
          event.totalList,
        );
        emit(SearchUsers(resultUsers: resultUsers));
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search_user_bloc.dart';
import '../models/users_model.dart';

class SearchHomePage extends StatefulWidget {
  const SearchHomePage({super.key});

  @override
  State<SearchHomePage> createState() => _SearchHomePageState();
}

class _SearchHomePageState extends State<SearchHomePage> {
  List<User> showUsers = [];
  List<User> users = [];

  final _bloc = SearchUserBloc();
  @override
  void initState() {
    super.initState();
    _bloc.add(FetchUserList());
  }

  void onChangeValue(String value) {
    _bloc.add(SearchUser(
      valueSearch: value,
      totalList: users,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Users'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: onChangeValue),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 480,
                child: BlocConsumer(
                  bloc: _bloc,
                  listener: (context, state) {
                    if (state is SearchUsers) {
                      showUsers = state.resultUsers;
                    }
                    if (state is FetchUserCompleted) {
                      users = state.users;
                      showUsers = users;
                    }
                  },
                  builder: (context, state) {
                    if (state is SearchError) {
                      return Column(
                        children: [
                          const Text(
                            'Algo deu errado, sem conexão!',
                          ),
                          IconButton(
                            onPressed: () => _bloc.add(FetchUserList()),
                            icon: const Icon(Icons.update),
                          ),
                        ],
                      );
                    }
                    return ListView.builder(
                      itemCount: showUsers.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                            ),
                            child: ListTile(
                              trailing: Text(showUsers[index].name!),
                              title: Text('${showUsers[index].id!}'),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

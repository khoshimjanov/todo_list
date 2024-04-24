import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/domain/user_model/user_model.dart';

import '../../infrastructure/db_helper.dart';

class UserCubit extends Cubit<UserModel> {
  UserCubit() : super(const UserModel(name: 'user')) {
    getUserData();
  }

  Future<void> getUserData() async {
    final  data = await DbHelper.getUserName();
    final UserModel user = UserModel(
      name: data ?? 'user',
    );

    emit(user);
  }

  void changeName(final String newName) {
    DbHelper.changeUserName(newName);
    emit(state.copyWith(name: newName,));
  }
}
import 'package:flutter_bloc/flutter_bloc.dart';

class SideBarController extends Cubit<int> {
  SideBarController() : super(0);

  void updateIndex(int page) {
    emit(page);
  }
}
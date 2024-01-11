import 'package:aiohs_web_admin/maid_manage/controllers/maid_manage.dart';
import 'package:aiohs_web_admin/maid_manage/cubits/get_reviews/get_reviews_state.dart';
import 'package:aiohs_web_admin/maid_manage/models/maid_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetReviewsCubit extends Cubit<GetReviewsState> {
  GetReviewsCubit() : super(GetReviewsInitial());

  Future<void> getReviews(String user_code) async {
    emit(GetReviewsLoading());
    try {
      MaidInfoRating reviews = await MaidManageController().getMaidInfoRating(user_code);
      emit(GetReviewsSuccess(reviews));
    } catch (e) {
      emit(GetReviewsFailure(e.toString()));
    }
  }
}
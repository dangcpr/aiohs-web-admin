import 'package:aiohs_web_admin/maid_manage/models/maid_info.dart';

abstract class GetReviewsState {}

class GetReviewsInitial extends GetReviewsState {}

class GetReviewsLoading extends GetReviewsState {}

class GetReviewsSuccess extends GetReviewsState {
  final MaidInfoRating ratings;
  
  GetReviewsSuccess(this.ratings);
}

class GetReviewsFailure extends GetReviewsState {
  final String error;

  GetReviewsFailure(this.error);
}
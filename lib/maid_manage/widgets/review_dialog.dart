import 'package:aiohs_web_admin/maid_manage/cubits/get_reviews/get_reviews_cubit.dart';
import 'package:aiohs_web_admin/maid_manage/cubits/get_reviews/get_reviews_state.dart';
import 'package:aiohs_web_admin/maid_manage/widgets/rating_card.dart';
import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewMaidDialog extends StatefulWidget {
  const ReviewMaidDialog({super.key, required this.maidId});

  final String maidId;

  @override
  State<ReviewMaidDialog> createState() => _ReviewMaidDialogState();
}

class _ReviewMaidDialogState extends State<ReviewMaidDialog> {
  @override
  void initState() {
    super.initState();
    context.read<GetReviewsCubit>().getReviews(widget.maidId);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle normal =
        TextStyle(fontSize: fontSize.medium, fontFamily: fontFamily);
    TextStyle bold =
        TextStyle(fontSize: fontSize.medium, fontFamily: fontFamilyBold);
    return Container(
      width: Responsive.isMobile(context)
          ? MediaQuery.of(context).size.width / 1.2
          : Responsive.isTablet(context)
              ? MediaQuery.of(context).size.width / 1.7
              : MediaQuery.of(context).size.width / 2.3,
      child: BlocBuilder(
        bloc: context.watch<GetReviewsCubit>(),
        builder: (context, state) {
          if (state is GetReviewsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetReviewsSuccess) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Số sao trung bình: ',
                        style: bold,
                      ),
                      TextSpan(
                        text: state.ratings.avg_star.toString(),
                        style: normal,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Số lượng đánh giá: ',
                        style: bold,
                      ),
                      TextSpan(
                        text: state.ratings.total_rating.toString(),
                        style: normal,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Nhận xét về giúp việc: ',
                        style: bold,
                      ),
                      TextSpan(
                        text: state.ratings.total_rating.toString(),
                        style: normal,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                for (int i = 0; i < state.ratings.rating!.length; i++)
                  Padding(
                    padding: EdgeInsets.only(bottom: 7),
                    child: RatingCard(
                      rating: state.ratings.rating![i],
                    ),
                  )
              ],
            );
          }

          if (state is GetReviewsFailure) {
            return Center(
              child: Text(state.error),
            );
          }

          return Center(
            child: Text("Có lỗi xảy ra"),
          );
        },
      ),
    );
  }
}

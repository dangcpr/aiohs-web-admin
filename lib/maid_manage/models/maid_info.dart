import 'package:aiohs_web_admin/maid_manage/models/rating.dart';

class MaidInfoRating {
  late double avg_star;
  late int total_rating;
  List<RatingMaid>? rating;

  MaidInfoRating({
    required this.avg_star,
    required this.total_rating,
    required this.rating,
  });

  MaidInfoRating.fromJson(Map<String, dynamic> json) {
    avg_star = json['avg_star'] is int
        ? (json['avg_star'] as int).toDouble()
        : json['avg_star'];
    total_rating = json['total_rating'];
    if (json['ratings'] != null) {
      rating = <RatingMaid>[];
      json['ratings'].forEach((v) {
        rating!.add(RatingMaid.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() => {
        'avg_star': avg_star,
        'total_rating': total_rating,
        'rating': rating!.map((e) => e.toJson()).toList(),
      };
}

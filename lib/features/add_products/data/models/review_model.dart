import 'package:dishboard_fruits_app/features/add_products/domain/entity/review_entity.dart';

class ReviewModel {
  final String reviewerName;
  final String comment;
  final num rating;
  final String reviewDate;
  final String imageUrl;


  ReviewModel({
    required this.reviewerName,
    required this.comment,
    required this.rating,
    required this.reviewDate,
    required this.imageUrl,
    
  });
 

 
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      reviewerName: json['reviewerName'],
      comment: json['comment'],
      rating: json['rating'],
      reviewDate: json['reviewDate'],
      imageUrl: json['imageUrl'],
  
    );
  }
   factory ReviewModel.fromEntity(ReviewEntity entity) {
    return ReviewModel(
      reviewerName: entity.reviewerName,
      comment: entity.comment,
      rating: entity.rating,
      reviewDate: entity.reviewDate,
      imageUrl: entity.imageUrl,
     
    );
  }
  tojson() {
      return {
        "reviewerName": reviewerName,
        "comment": comment,
        "rating": rating,
        "reviewDate": reviewDate,
        "imageUrl": imageUrl,
      
      };
    }
}

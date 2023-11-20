import 'package:hiking_nepal/features/post/domain/entity/post_entity.dart';

class PostModel extends PostEntity {
  ///constructor
  const PostModel(
      {super.uid,
      super.name,
      super.category,
      super.description,
      super.cost,
      super.date,
      super.location,
      super.image,
      super.time,
      super.author});

  ///changes the properties of existing data class.
  PostModel copyWith(
      {String? uid,
      String? name,
      String? description,
      int? cost,
      String? category,
      String? date,
      String? location,
      String? image,
      int? time,
      String? author}) {
    return PostModel(
        uid: uid ?? this.uid,
        name: name ?? this.name,
        description: description ?? this.description,
        cost: cost ?? this.cost,
        category: category ?? this.category,
        date: date ?? this.date,
        location: location ?? this.location,
        image: image ?? this.image,
        time: time ?? this.time,
        author: author ?? this.author);
  }
}

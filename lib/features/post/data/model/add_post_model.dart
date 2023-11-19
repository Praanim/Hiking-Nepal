import 'package:hiking_nepal/features/post/domain/entity/post_entity.dart';

class PostModel extends PostEntity {
  ///constructor
  const PostModel(
      {super.name,
      super.category,
      super.description,
      super.cost,
      super.date,
      super.location,
      super.image,
      super.time});

  ///changes the properties of existing data class.
  PostModel copyWith({
    String? name,
    String? description,
    int? cost,
    String? category,
    String? date,
    String? location,
    String? image,
    int? time,
  }) {
    return PostModel(
      name: name ?? this.name,
      description: description ?? this.description,
      cost: cost ?? this.cost,
      category: category ?? this.category,
      date: date ?? this.date,
      location: location ?? this.location,
      image: image ?? this.image,
      time: time ?? this.time,
    );
  }
}

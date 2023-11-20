class PostEntity {
  ///Unique id of the post
  final String? uid;

  ///name of the place
  final String? name;

  ///description of the place
  final String? description;

  ///estimated cost for the travel
  final int? cost;

  ///category
  final String? category;

  ///date on which the user logged or travelled to the place
  final String? date;

  ///location
  final String? location;

  ///time (in days) required to reach the destination
  final int? time;

  ///image of the destination
  final String? image;

  ///Author of the post (This wil be firebase uid of the user)
  final String? author;

  ///constructor
  const PostEntity(
      {this.uid,
      this.name,
      this.description,
      this.cost,
      this.category,
      this.date,
      this.location,
      this.time,
      this.image,
      this.author});
}

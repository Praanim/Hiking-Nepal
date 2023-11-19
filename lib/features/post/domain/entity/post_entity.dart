class PostEntity {
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

  ///constructor
  const PostEntity(
      {this.name,
      this.description,
      this.cost,
      this.category,
      this.date,
      this.location,
      this.time,
      this.image});
}

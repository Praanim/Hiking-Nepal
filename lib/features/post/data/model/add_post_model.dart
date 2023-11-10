class PostModel {
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

  ///constructor
  PostModel({
    this.name,
    this.description,
    this.cost,
    this.category,
    this.date,
    this.location,
    this.time,
  });

  ///changes the properties of existing data class.
  PostModel copyWith({
    String? name,
    String? description,
    int? cost,
    String? category,
    String? date,
    String? location,
    int? time,
  }) {
    return PostModel(
      name: name ?? this.name,
      description: description ?? this.description,
      cost: cost ?? this.cost,
      category: category ?? this.category,
      date: date ?? this.date,
      location: location ?? this.location,
      time: time ?? this.time,
    );
  }
}

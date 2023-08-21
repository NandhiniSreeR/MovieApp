enum MovieCategory {
  nowPlaying("Now Playing"),
  popular("Popular"),
  upcoming("Upcoming"),
  topRated("Top Rated");

  const MovieCategory(this.name);
  final String name;
}

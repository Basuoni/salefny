enum WorkType {
  fromHome,
  office;

  bool get isFromHome => this == WorkType.fromHome;

  bool get isOffice => this == WorkType.office;
}

abstract class SearchList {
  final dynamic fiedlOneSearch;
  final dynamic fieldTwoSearch;
  SearchList({
    required this.fiedlOneSearch,
    required this.fieldTwoSearch,
  });
}

class SearchHelper {
  static search(
    String value,
    List<SearchList> listTotal,
  ) {
    List<SearchList> searchList;

    searchList = listTotal
        .where(
          (element) =>
              element.fiedlOneSearch!.toString().toLowerCase().trim().contains(value.trim().toLowerCase()) ||
              element.fieldTwoSearch!.toString().toLowerCase().trim().contains(value.trim().toLowerCase()),
        )
        .toList();

    return searchList;
  }
}

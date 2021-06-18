part of 'screens.dart';

class SearchContent extends StatefulWidget {
  const SearchContent({Key key}) : super(key: key);

  @override
  _SearchContentState createState() => _SearchContentState();
}

class _SearchContentState extends State<SearchContent> {
  List<Category> categorys = [];
  String query = '';

  Future<void> getJson() async {
    String data = await rootBundle.loadString('assets/category.json');

    setState(() {
      categorys = categoryFromJson(data);
    });
  }

  @override
  void initState() {
    super.initState();
    getJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildSearch(),
          Expanded(
            child: ListView.builder(
              itemCount: categorys.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(categorys[index].title),
                  subtitle: Text(
                      categorys[index].content.map((e) => e.title).toString()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearch() =>
      SearchWidget(text: query, onChanged: searchBook, hintText: 'Search');

  void searchBook(String query) {
    final category = categorys.where((category) {
      final titleLower = category.title.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();
    setState(() {
      this.query = query;
      this.categorys = category;
    });
  }
}

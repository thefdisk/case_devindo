part of 'widgets.dart';

class PostItem extends StatelessWidget {
  const PostItem({Key key, @required this.posts, @required this.onTap})
      : super(key: key);

  final Post posts;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 8, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(posts.id),
            Container(
              width: (MediaQuery.of(context).size.width - 40) * 7 / 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    posts.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(posts.body),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

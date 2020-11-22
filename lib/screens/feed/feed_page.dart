import 'package:flutter/material.dart';
import 'package:kisanseva/screens/feed/feed_details.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> posts = [
      postTemplate(
          context,
          "Planting of winter crops exceed last year’s level by 10%",
          "Nov 20, 2020",
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6avtIkaSwHvmeXV15IQmki9LgbHQ_dtx1KQ&usqp=CAU"),
      postTemplate(
          context,
          "Rabi sowing begins; wheat planted in 97.27 lakh hectare so far: Agriculture ministry",
          "Nov 20, 2020",
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4iZLIjOEstF-2gIBYXrL99zOXT26MWVt0ag&usqp=CAU"),
      postTemplate(
          context,
          "India to export 3.5-4 million tonnes of wheat to neighbouring countries till March if govt extends export subsidy",
          "Nov 18, 2020",
          "https://www.maiervidorno.com/wp-content/uploads/Agriculture-Industry-2018.gif"),
      postTemplate(
          context,
          "Rabi sowing begins; wheat planted in 97.27 lakh hectare so far: Agriculture ministry",
          "Nov 20, 2020",
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRT6gzDMpVeSCwKp69BC632zZM9mzpoN8brSYFBNzVEzRvK6D2KARvLitfiurxLfEr2M3XF-02bpalVLtkNj2j7UFAaT8vkJf8&usqp=CAU&ec=45725302"),
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text("Feed"),
          actions: [
            FlatButton(
              color: Colors.green,
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    "Bookmarks",
                    style: TextStyle(color: Colors.black87),
                  ),
                  Icon(Icons.bookmark)
                ],
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(1.0, 1.0),
                          blurRadius: 10.0,
                        ),
                      ]),
                  child: TextFormField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.search),
                        hintText: "Search...",
                        border: InputBorder.none),
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return posts[index];
                },
              ),
            ],
          ),
        ));
  }

  Widget postTemplate(
      BuildContext context, String headline, String date, String imgUrl) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FeedDetails(
                headline: headline,
                date: date,
                imgUrl: imgUrl,
              ),
            ),
          );
        },
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imgUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(1.0, 1.0),
                    blurRadius: 10.0,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.width - 36,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        headline,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        date,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

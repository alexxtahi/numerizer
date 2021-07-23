import 'package:flutter/material.dart';

class MyFavs extends StatefulWidget {
  //todo: Properties
  final String title;
  List favlist;
  //todo: Constructor
  MyFavs({
    this.title = 'Favoris',
    this.favlist = const [],
  });
  //todo: State
  @override
  MyFavsState createState() => MyFavsState();
}

class MyFavsState extends State<MyFavs> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    // Return building search bar
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //todo: Title
        Text(
          widget.title,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w900,
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 10)),
        //todo: Favoris Listview
        (widget.favlist.length == 0)
            // Container to show if we have nothing into the favorite list
            ? Container(
                width: screenWidth,
                height: 150,
                // rounded corner
                decoration: BoxDecoration(
                  //color: Color.fromRGBO(230, 230, 230, 1),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/img/outlinedUnhappyEmojiIcon.png',
                        width: 45,
                        height: 45,
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Text(
                        'Rien dans la catégorie favoris',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          //fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            // List to show if we have one or more element into the favorite list
            : Container(
                width: screenWidth,
                height: 150,
                child: ListView.separated(
                  itemCount: widget
                      .favlist.length, // number of card depending on favList
                  scrollDirection: Axis.horizontal, // direction of scrolling
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    // cards
                    return TextButton(
                      onPressed: () {
                        print('Fav card pressed');
                      },
                      style: ButtonStyle(
                        // no padding
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.zero),
                        // rounded corners
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            //side: BorderSide(color: Color.fromRGBO(111, 50, 50, 1)),
                          ),
                        ),
                      ),
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        //color: Colors.green,
                        child: Container(
                          width: 110,
                          // rounded corner
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(230, 230, 230, 1),
                            borderRadius: BorderRadius.circular(15),
                            //color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
      ],
    );
  }
}

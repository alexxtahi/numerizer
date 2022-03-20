import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyPhotos extends StatefulWidget {
  //todo: Properties
  List photos;
  //todo: Constructor
  MyPhotos({
    this.photos = const [],
  });
  //todo: State
  @override
  MyPhotosState createState() => MyPhotosState();
}

class MyPhotosState extends State<MyPhotos> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    // Return building search bar
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(bottom: 10)),
        //todo: Favoris Listview
        (widget.photos.length == 0)
            // Container to show if we have nothing into the favorite list
            ? Container(
                width: screenWidth,
                height: 150,
                // rounded corner
                decoration: BoxDecoration(
                  //color: Color.fromRGBO(230, 230, 230, 1),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Theme.of(context).shadowColor,
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
                margin: EdgeInsets.only(bottom: 10),
                width: screenWidth,
                height: 100,
                child: ListView.separated(
                  itemCount: widget
                      .photos.length, // number of card depending on photos
                  scrollDirection: Axis.horizontal, // direction of
                  physics: BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    if (index == 0 || index == widget.photos.length - 1) {
                      return SizedBox(width: 1);
                    } else {
                      // Cards
                      return InkWell(
                        onTap: () {
                          print('Photos $index card pressed');
                        },
                        child: Container(
                          width: 100,
                          // rounded corner
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15),
                            //color: Colors.white,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
      ],
    );
  }
}

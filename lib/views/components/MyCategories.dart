import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyCategories extends StatefulWidget {
  //todo: Properties
  final String title;
  List categorylist;
  //todo: Constructor
  MyCategories({
    this.title = 'Catégories',
    this.categorylist = const [
      'Cours',
      'Lettres',
      'Reçus',
      'Factures',
      'Fiches',
      'CV'
    ],
  });
  //todo: State
  @override
  MyCategoriesState createState() => MyCategoriesState();
}

class MyCategoriesState extends State<MyCategories> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    // Return building search bar
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //todo: Title
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w900,
              ),
            ),
            IconButton(
              onPressed: () {
                print('Add new category');
              },
              icon: Icon(
                Icons.add_rounded,
                size: 30,
              ),
            ),
          ],
        ),
        //Padding(padding: EdgeInsets.only(bottom: 5)),
        //todo: Categories Listview
        Container(
          width: screenWidth,
          height: 40,
          //color: Colors.red,
          child: ListView.separated(
            itemCount: widget.categorylist
                .length, // number of card depending on categoryList
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
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                  // rounded corners
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      //side: BorderSide(color: Colors.red), // debug
                    ),
                  ),
                ),
                child: Chip(
                  avatar: Icon(
                    //Icons.file_present,
                    Icons.insert_drive_file_outlined,
                    color: Colors.black,
                    size: 20,
                  ),
                  label: Text(
                    widget.categorylist[index],
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  side: BorderSide(color: Theme.of(context).shadowColor),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

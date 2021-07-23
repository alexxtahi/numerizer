import 'package:flutter/material.dart';

class MyHistoric extends StatefulWidget {
  //todo: Properties
  final String title;
  List historiclist;
  //todo: Constructor
  MyHistoric({
    this.title = 'Historique',
    this.historiclist = const [],
  });
  //todo: State
  @override
  MyHistoricState createState() => MyHistoricState();
}

class MyHistoricState extends State<MyHistoric> {
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
        //Spacer(),
        //todo: Historic Listview
        (widget.historiclist.length == 0)
            // Container to show if we have nothing into the favorite list
            ? Container(
                width: screenWidth,
                height: 300,
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
                        'assets/img/unhappyEmojiIcon.png',
                        width: 45,
                        height: 45,
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Text(
                        'Pas de fichiers récents à afficher',
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
                height: 350,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Center(
                    child: Wrap(
                      //crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.start,
                      children: [
                        for (var file in widget.historiclist)
                          TextButton(
                            onPressed: () {
                              print('Fav card pressed');
                            },
                            style: ButtonStyle(
                              // no padding
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.zero),
                              // rounded corners
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
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
                                width: 170,
                                height: 210,
                                // rounded corner
                                decoration: BoxDecoration(
                                  //color: Color.fromRGBO(230, 230, 230, 1),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: Color.fromRGBO(0, 0, 0, 0.5)),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
        /*Container(
                width: screenWidth,
                height: 210,
                color: Colors.red,
                child: ListView.separated(
                  itemCount: widget.historiclist
                      .length, // number of card depending on historiclist
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
                          width: 170,
                          // rounded corner
                          decoration: BoxDecoration(
                            //color: Color.fromRGBO(230, 230, 230, 1),
                            borderRadius: BorderRadius.circular(15),
                            border:
                                Border.all(color: Color.fromRGBO(0, 0, 0, 0.5)),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),*/
      ],
    );
  }
}

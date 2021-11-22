import 'package:flutter/material.dart';
import 'package:plasticity/config/AppTextStyle.dart';
import 'package:search_page/search_page.dart';
import 'message/message_screen.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();

}

class _SearchScreenState extends State<SearchScreen> {
  static final List<ChatModel> searchData = [
    ChatModel(
      avatarUrl: "https://randomuser.me/api/portraits/women/34.jpg",
      name: "Send message",
      datetime: "08:15 PM",
      message: "You are now a member of Basketball group",
    ),
    ChatModel(
      avatarUrl: "https://randomuser.me/api/portraits/women/49.jpg",
      name: "Send message",
      datetime: "08:15 PM",
      message: "It’s a match!",
    ),
    ChatModel(
      avatarUrl: "https://randomuser.me/api/portraits/women/77.jpg",
      name: "Send message",
      datetime: "08:15 PM",
      message: "Ammy Henry liked  your profile",
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title:   Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 18.0, vertical: 8),
          child: TextField(
            readOnly: true,
            onTap: () {
              showSearch(
                  context: context,
                  delegate:
                  SearchPage(
                    barTheme: ThemeData(
                        appBarTheme: AppBarTheme(
                            elevation: 0,
                            iconTheme:
                            IconThemeData(
                                color: Colors
                                    .black),
                            backgroundColor:
                            Colors.white),
                        iconTheme: IconThemeData(
                            color: Colors.black)),
                    onQueryUpdate: (s) {
                    },
                    items: searchData,
                    searchLabel: 'Search Product',
                    suggestion: Center(
                      child: Padding(
                        padding:
                        const EdgeInsets.only(
                            left: 8.0),
                        child: Text(
                            'Enter last the numbers of reference number for precise search'),
                      ),
                    ),
                    failure: Center(
                      child: Text(
                          'No products found'),
                    ),
                    filter: (product) => [
                     // product.productID,
                    ],
                    builder: (product) =>
                        GestureDetector(
                          onTap: () async {
                              //
                              // Navigator.of(context)
                              //     .pop();
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder:
                              //             (context) =>
                              //             ProductDetailsScreen(
                              //               showEditButtons:
                              //               true,
                              //               liked:
                              //               true,
                              //               productID:
                              //               product.productID,
                              //             )));
                          },
                          child: ListTile(
                            title: Text('ff'),
                            trailing:
                            Text('ffff'),
                          ),
                        ),
                  ));
            },
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                contentPadding:
                const EdgeInsets.only(
                    left: 14.0,
                    bottom: 12.0,
                    top: 0.0),
                filled: true,
                fillColor: Colors.grey.shade200,
                hintText: 'Search Product',
                hintStyle: AppTextStyle.poppins( fontWeight: FontWeight.w300),
                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(7.0),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 30,
                )),
          ),
        ),
      ),
    );
  }
}

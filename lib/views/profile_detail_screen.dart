import 'package:flutter/material.dart';
import 'package:plasticity/config/AppTextStyle.dart';

class ProfileDetailScreen extends StatefulWidget {
  const ProfileDetailScreen({Key key}) : super(key: key);

  @override
  _ProfileDetailScreenState createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 125),
            padding: EdgeInsets.only(bottom: 15),
            child: CustomScrollView(
              primary: true,
              shrinkWrap: false,
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Theme.of(context).accentColor.withOpacity(0.9),
                  expandedHeight: 275,
                  elevation: 0,
                  iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    background: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color:  Theme.of(context).accentColor,
                              image: DecorationImage(
                                  image: AssetImage('assets/icons/fish.jpeg'),
                                  fit: BoxFit.fill
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Wrap(
                      runSpacing: 8,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Crawfish',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: AppTextStyle.poppins(fontSize: 22 , fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    'Fresh Fish',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: Theme.of(context).textTheme.bodyText2,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    'Price \$35',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: AppTextStyle.poppins(fontSize: 18 , fontWeight: FontWeight.w500),

                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    'Discount \$10',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: AppTextStyle.poppins(fontSize: 14 , fontWeight: FontWeight.w300),
                                  ),



                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Product Description',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: AppTextStyle.poppins(fontSize: 20 , fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                              //overflow: TextOverflow.ellipsis,
                              // maxLines: 2,
                              style: AppTextStyle.poppins(fontSize: 14 , fontWeight: FontWeight.w500 , fontColor: Colors.grey),

                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 150,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                  boxShadow: [BoxShadow(color: Theme.of(context).focusColor.withOpacity(0.15), offset: Offset(0, -2), blurRadius: 5.0)]),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'Quantity',
                            style: AppTextStyle.poppins(fontSize: 18 , fontWeight: FontWeight.w500 , fontColor:Colors.white ),

                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                //  _con.decrementQuantity();
                              },
                              iconSize: 30,
                              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                              icon: Icon(Icons.remove_circle_outline ,   color: Colors.white,),
                              color: Theme.of(context).hintColor,
                            ),
                            Text('1',
                              style: AppTextStyle.poppins(fontSize: 18 , fontWeight: FontWeight.w500 , fontColor: Colors.white),
                             ),
                            IconButton(
                              onPressed: () {
                                // _con.incrementQuantity();
                              },
                              iconSize: 30,
                              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                              icon: Icon(Icons.add_circle_outline ,   color: Colors.white,),
                              color: Theme.of(context).hintColor,
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: OutlineButton(

                                padding: EdgeInsets.symmetric(vertical: 14),
                                color: Theme.of(context).primaryColor,
                                shape: StadiumBorder(),
                                borderSide: BorderSide(color: Theme.of(context).accentColor),
                                onPressed: () {  },
                                child: Icon(
                                  Icons.favorite,
                                  color: Theme.of(context).accentColor,
                                ))
                          // : MaterialButton(
                          // elevation: 0,
                          // onPressed: () {
                          //
                          // },
                          // padding: EdgeInsets.symmetric(vertical: 14),
                          // color: Theme.of(context).accentColor,
                          // shape: StadiumBorder(),
                          // child: Icon(
                          //   Icons.favorite_outline,
                          //   color: Theme.of(context).primaryColor,
                          // )),
                        ),
                        SizedBox(width: 10),
                        Stack(
                          fit: StackFit.loose,
                          alignment: AlignmentDirectional.centerEnd,
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 110,
                              child: MaterialButton(
                                elevation: 0,
                                onPressed: () {

                                },
                                padding: EdgeInsets.symmetric(vertical: 14),
                                color: Theme.of(context).accentColor,
                                shape: StadiumBorder(),
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    'Add to cart',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

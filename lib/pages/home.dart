
import 'dart:async';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexible/flexible.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_login/flutter_login.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:location/location.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:untitled1/pages/AsyncValue.dart';
import 'package:untitled1/pages/MyMap.dart';
import 'package:untitled1/pages/explore.dart';
//import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:untitled1/pages/extension.dart';
//import 'package:getahome/pages/messages.dart';
import 'package:untitled1/pages/settings.dart';
import 'package:untitled1/themes/apptheme.dart';
import 'package:untitled1/themes/color.dart';
import 'package:provider/provider.dart';
import '../utils/property.dart';
import 'BestOffer.dart';
import 'Categories.dart';
import 'Custom_appbar.dart';
import 'FilterPage.dart';
import 'Posts.dart';
import 'RecommendedHouse.dart';
import 'package:untitled1/pages/location.dart' as locations;

class HomePage extends StatefulWidget {
  //const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  List<Property> properties = getPropertyList();
 // GlobalKey<OSMFlutterState> mapKey = GlobalKey<OSMFlutterState>();
  String? mtoken = "";
  late Future<List<Property>> futureProperty;
  //late Future<List<OpDetailsBalanceByDriverNo>> futureOpDetailsBalanceByDriverNo;
  void initstate() {
    initstate();
    requestPermission();
    getToken();
    getCurrentUser();
     addCustomIcon();
    futureProperty ;
    //getPolyPoints();
    //getCurrentLocation();

    //futureProperty = opDetailsBalanceByDriverNoFromJson();
  }
  List<LatLng> polylineCoordinates = [];
  final google_api_key = "AIzaSyCh1RaQzJHki8GPHw3U5kOhhJsxkajr8Eo";
  //LocationData? currentLocation;
  final Completer<GoogleMapController> _controller = Completer();

 /** void getCurrentLocation() async {
    Location location = Location();
    location.getLocation().then(
          (location) {
        currentLocation = location;
      },
    );
    GoogleMapController googleMapController = await _controller.future;
    location.onLocationChanged.listen(
          (newLoc) {
        currentLocation = newLoc;
        googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              zoom: 13.5,
              target: LatLng(
                newLoc.latitude!,
                newLoc.longitude!,
              ),
            ),
          ),
        );
        setState(() {});
      },
    );
  }**/
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }
  final _auth = FirebaseAuth.instance;
  late User loggedinUser;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  static const LatLng sourceLocation = LatLng(36.302805, 47.371488);
  static const LatLng destination = LatLng(33.312805, 44.361488);
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
      }
    } catch (e) {
      print(e);
    }
  }
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);
  Duration get loginTime => Duration(milliseconds: 2000);
  void saveToken(String token) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: '',
        password: ''
   //"token": token
    );
  }

  Future<void> requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        //authorizationStatus: authorizationStatus,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        sound: true);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print("user granted permission");
      }
    } else
    if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print("User granted provisonal permission");
    } else {
      print('user declined or hasnot accepted permission');
    }
  }

  /** Future<String?> _recoverPassword(String name) {
      debugPrint('Name: $name');
      return Future.delayed(loginTime).then((_) {
      if (!user.containsKey(name)) {
      return 'User doesnot exist';
      }
      return null;
      });
      }**/
  //late List<Detail> properties;
  void getToken() async {
    await FirebaseMessaging.instance.getToken().then(
            (token) {
          setState(() {
            mtoken = token;
            if (kDebugMode) {
              print("My token is $mtoken");
            }
          });
          saveToken(token!);
        }
    );
  }

  final _navKey = GlobalKey<NavigatorState>();
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;


  /** List<Widget> lists = List.generate(categories.length,
      (index) => CategoryItem(
      data: categories[index],
      selected: index == selectedCategory,));**/
  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "assets/Location_marker.png")
        .then(
          (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }
  Future<bool> onLikeButtonTapped(bool isLiked) async{
    /// send your request here
     final bool success= await sendRequest();

    /// if failed, you can do nothing
     return success? !isLiked:isLiked;
  }

 sendRequest()async {
    await Future.delayed(Duration(milliseconds:200));
    return true;

}
  //var name;
  @override
  Widget build(BuildContext context) {
    //final propertyProvider = context.watch<PropertyProvider>();
    // final asyncValueOfProps = propertyProvider.asyncValueOfProps;
   // var property;
    return ScreenFlexibleWidget(
        child: MultiProvider(
            providers: [
              ChangeNotifierProvider<Posts>(
                create: (context) => Posts(),
              ),
              ChangeNotifierProvider<settings>(
                create: (context) =>
                    settings(
                        darkModeEnabled: true),
              ),
            ],
            child: Scaffold(
              appBar: AppBar(
                title: TextField(
                  style: TextStyle(
                      color: Colors.black,
                      height: 30,
                      fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                      hintText: "Search "
                    //color: colors.white
                   ),
                  // enabled: true,
                  //theme: ThemeData(
                ),
                actions: [
                  IconButton(
                    onPressed: () =>
                        context.push(const FilterPage()),
                    icon: Icon(
                      PhosphorIcons.scan,
                      color: AppColors.kDark,
                    ),
                  ),
                  /**  IconButton(
                      onPressed: (){
                      //_auth.signOut();
                      // Navigator.pop(context);
                      },
                      //  icon: Icon(Icons.close),
                      ),**/
                  FloatingActionButton(
                    child:Icon(Icons.location_history_rounded),

                    onPressed: () {
                      context.push(BuildMap());//pass any arguments
                      //settings: RouteSettings(name: "vendorScreen"))
                    },
                    tooltip: "Location",),
                  ]),
              body: SingleChildScrollView(
                physics: ScrollPhysics(),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                   Padding(
                       padding:
                      EdgeInsets.all(10) ),
                         TextField(
                          style: TextStyle(
                            fontSize: 28,
                            height: 1,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              fontSize: 28,
                              color: Colors.grey[400],
                            ),
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Icon(
                                Icons.search,
                                color: Colors.grey[400],
                                size: 28,
                              ),
                            ),
                          ), onTap: (){},
                        ),
                   Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                height: 106,
                      child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.tune),
                      color: AppColors.kGrey200,
                      onPressed: () {
                     //   onLikeButtonTapped(true);
                      },
                    ),
                    SizedBox(width: 15.0),
                    Expanded(
                      flex: 90,
                      child: ListView.builder(
                           padding: EdgeInsets.all(0),
                           physics: BouncingScrollPhysics(),
                           scrollDirection: Axis.horizontal,
                           shrinkWrap: true,
                           itemCount: 1,
                           itemBuilder: (BuildContext context, int index) {
                             return Row(
                               mainAxisAlignment: MainAxisAlignment
                                   .center,
                               children: [
                                 SizedBox(width: 1,),
                                 buildFilter("House"),
                                 buildFilter("price"),
                                 buildFilter("security"),
                                 buildFilter("bedrooms"),
                                 buildFilter("garage"),
                                 buildFilter("swimming pool"),
                                 buildFilter("smart home"),
                                 SizedBox(width: 5,)
                               ],
                             );
                           },
                      ),
                    ),
            ],
                      ),
        ),
             Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Categories(),
                    RecommendedHouse(),
                    BestOffer()
                  ],
                ),
             ], ),
              ),
              bottomNavigationBar:
              CustomAppBar(),

              ),
            ));

  }

  Widget buildFilter(String filterName) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      margin: EdgeInsets.only(right: 5, left:5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(
            color: Colors.transparent,
            width: 5,
          )
      ),child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightBlueAccent[900],
          foregroundColor: Colors.yellow[100],
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0)
        ),
    ),
       onPressed: () {
         Navigator.push(context,
         MaterialPageRoute(builder: (context)=> FilterPage() ));
       },
       child:   Center(
        child: Text(filterName,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),
      ),
    ));
  }
  List<String> filters = [
    'For Rent',
    '< \$1,201',
    'House, Condo',
    '> 3 Rooms'
  ];
  Widget BuildMap() {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps'),
          elevation: 2,
          actions: [
            IconButton(
              icon: Icon(CupertinoIcons.right_chevron,
            size: 25,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: /**currentLocation == null
            ? const Center(child: Text("Loading"))
            :**/ GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(
                33.312805, 44.361488
                //currentLocation!.latitude!, currentLocation!.longitude!
            ),
            zoom: 13.5,
          ),
          markers: {
            Marker(
              markerId: const MarkerId("currentLocation"),
              position: LatLng(
                  33.313806,
                  44.361588
                  //currentLocation!.latitude!, currentLocation!.longitude!
              ),
            ),
            const Marker(
              markerId: MarkerId("source"),
              position: sourceLocation,
            ),
            const Marker(
              markerId: MarkerId("destination"),
              position: destination,
            ),
          },
          onMapCreated: (mapController) {
            _controller.complete(mapController);
          },
          polylines: {
            Polyline(
              polylineId: const PolylineId("route"),
              points: polylineCoordinates,
              color: const Color(0xFF7B61FF),
              width: 6,
            ),
          },
        ),

      ),
    );
  }

}


// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hive/hive.dart';
import 'package:maa/dashboard/dashboard1.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Hive.initFlutter();
//   // await Hive.deleteBoxFromDisk('shopping_box');
//   await Hive.openBox('shopping_box');

//   runApp(const MyApp());
// }

class hiveformread extends StatelessWidget {
  const hiveformread({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KindaCode.com',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home:
          // home: Scaffold(
          //   appBar: AppBar(
          //     backgroundColor: Color.fromARGB(255, 192, 224, 236),
          //     elevation: .0,
          //     leading: Icon(
          //       Icons.history_edu,
          //       color: Colors.black,
          //     ),
          //     title: Text(
          //       'Your History',
          //       style: TextStyle(color: Colors.black),
          //     ),
          //     actions: <Widget>[
          //       FlatButton(
          //         child: Text('Save'),
          //         textColor: Colors.black,
          //         // onPressed: onSave,
          //         onPressed: () {
          //           Navigator.of(context).push(
          //             MaterialPageRoute(builder: (context) => dashboard()),
          //           );
          //         },
          //       ),
          //     ],
          //   ),
          //   body: HomePagehive(),
          // ),
          const HomePagehive(),
    );
  }
}

// Home Page
class HomePagehive extends StatefulWidget {
  const HomePagehive({Key? key}) : super(key: key);

  @override
  _HomePagehiveState createState() => _HomePagehiveState();
}

class _HomePagehiveState extends State<HomePagehive> {
  List<Map<String, dynamic>> _items = [];
  // double rating = 0;

  final _shoppingBox = Hive.box('shopping_box');

  @override
  void initState() {
    super.initState();
    _refreshItems(); // Load data when app starts
  }

  // Get all items from the database
  void _refreshItems() {
    final data = _shoppingBox.keys.map((key) {
      final value = _shoppingBox.get(key);
      return {
        "key": key,
        "Disease_name": value["Disease_name"],
        "Hospital_name": value["Hospital_name"],
        "Doctor_name": value["Doctor_name"],
        "rating_diasease": value["rating_diasease"]
        // "quantity": value['quantity']
      };
    }).toList();

    setState(() {
      _items = data.reversed.toList();
      // we use "reversed" to sort items in order from the latest to the oldest
    });
  }

  // Create new item
  Future<void> _createItem(Map<String, dynamic> newItem) async {
    await _shoppingBox.add(newItem);
    _refreshItems(); // update the UI
  }

  // Retrieve a single item from the database by using its key

  Map<String, dynamic> _readItem(int key) {
    final item = _shoppingBox.get(key);
    return item;
  }

  // Update a single item
  Future<void> _updateItem(int itemKey, Map<String, dynamic> item) async {
    await _shoppingBox.put(itemKey, item);
    _refreshItems(); // Update the UI
  }

  // Delete a single item
  Future<void> _deleteItem(int itemKey) async {
    await _shoppingBox.delete(itemKey);
    _refreshItems(); // update the UI

    // Display a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Medical History was deleted...')));
  }

  // TextFields' controllers
  final TextEditingController _diseasenameController = TextEditingController();
  final TextEditingController _doctornameController = TextEditingController();
  final TextEditingController _hospitalnameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  String rating_disease = '';
  // final TextEditingController _ratingController = TextEditingController();
  // final TextEditingController _quantityController = TextEditingController();

  // This function will be triggered when the floating button is pressed
  // It will also be triggered when you want to update an item
  void _showForm(BuildContext ctx, int? itemKey) async {
    // itemKey == null -> create new item
    // itemKey != null -> update an existing item

    if (itemKey != null) {
      final existingItem =
          _items.firstWhere((element) => element['key'] == itemKey);
      _diseasenameController.text = existingItem['Disease_name'];
      _hospitalnameController.text = existingItem['Hospital_name'];
      _doctornameController.text = existingItem['Doctor_name'];
      _nameController.text = existingItem['name'];
      // _ratingController.text = existingItem['rating'];
      rating_disease = existingItem['rating_diasease'];
      // _quantityController.text = existingItem['quantity'];
    }

    showModalBottomSheet(
        context: ctx,
        elevation: 5,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        builder: (_) => Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(ctx).viewInsets.bottom,
                  top: 15,
                  left: 15,
                  right: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: _diseasenameController,
                    // controller: _nameController,
                    decoration: const InputDecoration(hintText: 'Disease name'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _hospitalnameController,
                    // controller: _nameController,
                    decoration:
                        const InputDecoration(hintText: 'Hospital name'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _doctornameController,
                    // controller: _nameController,
                    decoration: const InputDecoration(hintText: 'Doctor name'),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // TextField(
                  //   controller: _quantityController,
                  //   keyboardType: TextInputType.number,
                  //   decoration: const InputDecoration(hintText: 'Quantity'),
                  // ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Text(
                      "Rate your experience...",
                      style: TextStyle(fontSize: 18),
                      // textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    // height: 500,
                    // color: Colors.amber,
                    child: Center(
                        child: RatingBar.builder(
                      //  initialRating: 3,
                      // initialRating: rating_disease,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                        var final_rate = rating;
                        print("kya hiaye ");
                        print(final_rate);
                        rating_disease = final_rate.toString();
                        print("kya hiaye ");
                        print(rating_disease);
                      },
                    )),
                  ),
                  // buildRating(),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Save new item
                      if (itemKey == null) {
                        _createItem({
                          "Disease_name": _diseasenameController.text,
                          "Hospital_name": _hospitalnameController.text,
                          "Doctor_name": _doctornameController.text,
                          "name": _nameController.text,
                          "rating_diasease": rating_disease
                          // "quantity": _quantityController.text
                        });
                      }

                      // update an existing item
                      if (itemKey != null) {
                        _updateItem(itemKey, {
                          'Disease_name': _diseasenameController.text.trim(),
                          'Hospital_name': _hospitalnameController.text.trim(),
                          'Doctor_name': _doctornameController.text.trim(),
                          'name': _nameController.text.trim(),
                          "rating_diasease": rating_disease.trim()
                          // 'quantity': _quantityController.text.trim()
                        });
                      }

                      // Clear the text fields
                      _diseasenameController.text = '';
                      _hospitalnameController.text = '';
                      _doctornameController.text = '';
                      rating_disease = '';
                      // _ratingController.text = '';
                      // _nameController.text = '';
                      // _quantityController.text = '';

                      Navigator.of(context).pop(); // Close the bottom sheet
                    },
                    child: Center(
                        child: Text(
                      itemKey == null ? 'Add New' : 'Update',
                      style: TextStyle(
                          // backgroundColor: Color.fromARGB(255, 106, 180, 240)
                          ),
                    )),
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('KindaCode.com'),
      // ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 192, 224, 236),
        elevation: .0,
        leading: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => dashboard()),
                ),
                // Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
            // Icon(
            //   Icons.history_edu,
            //   color: Colors.black,
            // ),
          ],
        ),
        title: Text(
          'Your History',
          style: TextStyle(color: Colors.black),
        ),
        // actions: <Widget>[
        //   FlatButton(
        //     child: Text('Save'),
        //     textColor: Colors.black,
        //     // onPressed: onSave,
        //     onPressed: () {
        //       Navigator.of(context).push(
        //         MaterialPageRoute(builder: (context) => dashboard()),
        //       );
        //     },
        //   ),
        // ],
      ),
      body: _items.isEmpty
          ? const Center(
              child: Text(
                'No Medical History',
                style: TextStyle(fontSize: 30),
              ),
            )
          : ListView.builder(
              // the list of items
              itemCount: _items.length,
              itemBuilder: (_, index) {
                final currentItem = _items[index];
                return Container(
                  height: 150,
                  child: Card(
                    color: Color.fromARGB(255, 119, 218, 218),
                    margin: const EdgeInsets.all(30),
                    elevation: 3,
                    child: ListTile(
                        leading: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Text("Rating",
                                  style: TextStyle(fontSize: 10)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(currentItem['rating_diasease'],
                                  style: TextStyle(fontSize: 25)),
                            ),
                          ],
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            currentItem['Disease_name'],
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        subtitle: Text(
                          "Hospital: " +
                              currentItem['Hospital_name'].toString(),
                          style: TextStyle(fontSize: 15),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Text(currentItem['rating_diasease'],
                            //     style: TextStyle(fontSize: 25)),
                            // Edit button
                            IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () =>
                                    _showForm(context, currentItem['key'])),
                            // Delete button
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => _deleteItem(currentItem['key']),
                            ),
                          ],
                        )),
                  ),
                );
              }),
      // Add new item button
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(context, null),
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF586894),
        child: const Icon(Icons.add),
      ),
    );
  }

  // Widget buildRating() => RatingBar.builder(
  //       minRating: 1,
  //       // direction: Axis.horizontal,
  //       allowHalfRating: true,
  //       itemCount: 5,
  //       updateOnDrag: true,
  //       itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
  //       itemBuilder: (context, _) => Icon(
  //         Icons.star,
  //         color: Colors.amber,
  //       ),
  //       onRatingUpdate: (rating) {
  //         setState() {
  //           this.rating = rating;
  //           controller:
  //           _ratingController;
  //         }

  //         ;
  //       },
  //     );
}

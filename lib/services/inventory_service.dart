import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:firebase_auth/firebase_auth.dart';

import '../models/custom_error.dart';
import '../models/inventory.dart';
import '../models/item.dart';

class InventoryService {
  final FirebaseFirestore firebaseFirestore;
  final fb_auth.FirebaseAuth firebaseAuth;

  InventoryService({required this.firebaseFirestore, required this.firebaseAuth});

  // Stream<QuerySnapshot<Map<String, dynamic>>> get inventory =>
  //     firebaseFirestore.collection('inventory').snapshots();

  // get inventory
  Future<QuerySnapshot<Map<String, dynamic>>> getInventory() async {
    // current user id
    User user = firebaseAuth.currentUser!;
    String userId = user.uid;
    try {
      return await firebaseFirestore
          .collection('inventory')
          .where('userId', isEqualTo: userId)
          .get();
    } on FirebaseException catch (e) {
      throw CustomError(message: e.message!, code: e.code, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
          message: e.toString(), code: 'Exception', plugin: 'ServerError: getInventory');
    }
  }

  // create inventory
  Future<void> createInventory({required Inventory inventory}) async {
    try {
      await firebaseFirestore.collection('inventory').doc(inventory.userId + inventory.name).set({
        'userId': inventory.userId,
        'name': inventory.name,
        'description': inventory.description,
        'category': inventory.category,
        'createdAt': Timestamp.now(),
      });
    } on FirebaseException catch (e) {
      throw CustomError(message: e.message!, code: e.code, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
          message: e.toString(), code: 'Exception', plugin: 'ServerError: createInventory');
    }
  }

  // update inventory
  Future<void> updateInventory({required Inventory inventory}) async {
    try {
      await firebaseFirestore
          .collection('inventory')
          .doc(inventory.userId + inventory.name)
          .update({
        'userId': inventory.userId,
        'name': inventory.name,
        'description': inventory.description,
        'category': inventory.category,
        'updatedAt': Timestamp.now(),
      });
    } on FirebaseException catch (e) {
      throw CustomError(message: e.message!, code: e.code, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
          message: e.toString(), code: 'Exception', plugin: 'ServerError: updateInventory');
    }
  }

  // delete inventory
  Future<void> deleteInventory(String userId) async {
    try {
      await firebaseFirestore.collection('inventory').doc(userId).delete();
    } on FirebaseException catch (e) {
      throw CustomError(message: e.message!, code: e.code, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
          message: e.toString(), code: 'Exception', plugin: 'ServerError: deleteInventory');
    }
  }

  // add item  to inventory
  Future<void> addItemtoInventory(
      {required Item item, required String userId, required String inventoryName}) async {
    try {
      await firebaseFirestore
          .collection('inventory')
          .doc(userId + inventoryName)
          .collection('items')
          .doc(item.id.toString())
          .set({
        'id': item.id,
        'name': item.name,
        'description': item.description,
        'category': item.category,
        'price': item.price,
        'quantity': item.quantity,
        'createdAt': Timestamp.now(),
      });
    } on FirebaseException catch (e) {
      throw CustomError(message: e.message!, code: e.code, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
          message: e.toString(), code: 'Exception', plugin: 'ServerError: addItemtoInventory');
    }
  }

  // delete item in inventory
  Future<void> deleteIteminInventory(
      {required Item item, required String userId, required String inventoryName}) async {
    try {
      await firebaseFirestore
          .collection('inventory')
          .doc(userId + inventoryName)
          .collection('items')
          .doc(item.id.toString())
          .delete();
    } on FirebaseException catch (e) {
      throw CustomError(message: e.message!, code: e.code, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
          message: e.toString(), code: 'Exception', plugin: 'ServerError: deleteIteminInventory');
    }
  }

  // update item in inventory
  Future<void> updateIteminInventory(
      {required Item item, required String userId, required String inventoryName}) async {
    try {
      await firebaseFirestore
          .collection('inventory')
          .doc(userId + inventoryName)
          .collection('items')
          .doc(item.id.toString())
          .update({
        'id': item.id,
        'name': item.name,
        'description': item.description,
        'category': item.category,
        'updatedAt': Timestamp.now(),
      });
    } on FirebaseException catch (e) {
      throw CustomError(message: e.message!, code: e.code, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
          message: e.toString(), code: 'Exception', plugin: 'ServerError: updateIteminInventory');
    }
  }
}

import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:org_templatev2/services/inventory_service.dart';

import '../../../models/custom_error.dart';
import '../../../models/inventory.dart';

part 'inventory_state.dart';

class InventoryCubit extends Cubit<InventoryState> {
  late final InventoryService inventoryService;
  InventoryCubit({required this.inventoryService})
      : super(InventoryState.initial());

  // create inventory
  Future<void> createInventory(Inventory inventory) async {
    try {
      await inventoryService.createInventory(inventory: inventory);
      emit(
        state.copyWith(
          inventory: [...state.inventory, inventory],
        ),
      );
    } on FirebaseException catch (e) {
      throw CustomError(message: e.message!, code: e.code, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
          message: e.toString(),
          code: 'Exception',
          plugin: 'ServerError: createInventory');
    }
  }

  // update inventory
  Future<void> updateInventory(Inventory inventory) async {
    try {
      await inventoryService.updateInventory(inventory: inventory);
      emit(
        state.copyWith(
          inventory: [
            for (final inv in state.inventory)
              if (inv.name == inventory.name) inventory else inv
          ],
        ),
      );
    } on FirebaseException catch (e) {
      throw CustomError(message: e.message!, code: e.code, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
          message: e.toString(),
          code: 'Exception',
          plugin: 'ServerError: updateInventory');
    }
  }

  // delete inventory
  Future<void> deleteInventory(Inventory inventory) async {
    try {
      await inventoryService.deleteInventory(inventory.userId);
      emit(
        state.copyWith(
          inventory: [
            for (final inv in state.inventory)
              if (inv.name != inventory.name) inv
          ],
        ),
      );
    } on FirebaseException catch (e) {
      throw CustomError(message: e.message!, code: e.code, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
          message: e.toString(),
          code: 'Exception',
          plugin: 'ServerError: deleteInventory');
    }
  }
}

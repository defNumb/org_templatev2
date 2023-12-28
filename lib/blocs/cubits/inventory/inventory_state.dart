// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'inventory_cubit.dart';

class InventoryState extends Equatable {
  final List<Inventory> inventory;
  const InventoryState({
    required this.inventory,
  });
  // initial
  factory InventoryState.initial() {
    return const InventoryState(
      inventory: <Inventory>[],
    );
  }
  @override
  List<Object> get props => [inventory];

  @override
  bool get stringify => true;

  InventoryState copyWith({
    List<Inventory>? inventory,
  }) {
    return InventoryState(
      inventory: inventory ?? this.inventory,
    );
  }
}

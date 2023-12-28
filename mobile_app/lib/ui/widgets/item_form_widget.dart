import 'package:flutter/material.dart';
import '../../model/item.dart';
import '../../util/item_crud_util.dart';

class ItemForm extends StatefulWidget {
  const ItemForm({super.key});

  @override
  State<ItemForm> createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  final _descriptionController = TextEditingController();
  final _qtyOnHandController = TextEditingController();
  final _unitPriceController = TextEditingController();
  final _itemCrudUtil = ItemCrudUtil();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Add Item',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description',
              ),
              controller: _descriptionController,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Quantity On Hand',
              ),
              controller: _qtyOnHandController,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Unit Price',
              ),
              controller: _unitPriceController,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    final res = await _itemCrudUtil.createItem(
                      Item(
                        description: _descriptionController.text,
                        qtyOnHand: int.parse(_qtyOnHandController.text),
                        unitPrice: double.parse(_unitPriceController.text),
                      ),
                    );
                    SnackBar snackBar = SnackBar(
                      content: Text(res),
                    );
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: const Text('Save'),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

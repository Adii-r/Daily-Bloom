import 'package:flutter/material.dart';
import '../../app_data/app_data.dart';
import '../../models/category.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  void _showAddCategoryDialog(BuildContext context) {
    final nameController = TextEditingController();
    final iconController = TextEditingController();
    final descriptionController = TextEditingController();

    String status = "Published";

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              title: const Text(
                "Add Category",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              content: SizedBox(
                width: 500,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: "Category Name",
                          prefixIcon: const Icon(Icons.category_rounded),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      TextField(
                        controller: iconController,
                        decoration: InputDecoration(
                          labelText: "Icon (Emoji or Icon Name)",
                          prefixIcon: const Icon(Icons.emoji_emotions_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      TextField(
                        controller: descriptionController,
                        maxLines: 4,
                        decoration: InputDecoration(
                          labelText: "Description",
                          alignLabelWithHint: true,
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(bottom: 70),
                            child: Icon(Icons.description_outlined),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      DropdownButtonFormField<String>(
                        value: status,
                        decoration: InputDecoration(
                          labelText: "Status",
                          prefixIcon: const Icon(Icons.public),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        items: const [

                          DropdownMenuItem(
                            value: "Published",
                            child: Text("Published"),
                          ),

                          DropdownMenuItem(
                            value: "Draft",
                            child: Text("Draft"),
                          ),
                        ],
                        onChanged: (value) {
                          setDialogState(() {
                            status = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              actionsPadding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              actions: [

                OutlinedButton(

                  onPressed: () {
                    Navigator.pop(context);

                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                ),

                ElevatedButton(


                    onPressed: () {
                    AppData.categories.add(
                    Category(
                    name: nameController.text,
                    description: descriptionController.text,
                    status: status,
                    ),
                    );

                    setState(() {});

                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6FCF97),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                const Text(
                  "Categories",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                ElevatedButton.icon(
                  onPressed: () {
                    _showAddCategoryDialog(context);
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Add Category"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6FCF97),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 18,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 35),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 1200),
                  child: DataTable(
                  headingRowColor: WidgetStateProperty.all(
                    const Color(0xFFF4F4F4),
                  ),
                  headingTextStyle: const TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                  ),
                  columns: [

                    DataColumn(
                      label: Text("Name"),
                    ),

                    DataColumn(
                      label: Text("Icon"),
                    ),

                    DataColumn(
                      label: Text("Quotes"),
                    ),

                    DataColumn(
                      label: Text("Status"),
                    ),

                    DataColumn(
                      label: Text("Actions"),
                    ),
                  ],

                    rows: AppData.categories.map((category) {
                      return DataRow(
                        cells: [

                          DataCell(
                            Text(category.name),
                          ),

                          DataCell(
                            Text("🌱"),
                          ),

                          DataCell(
                            Text("0"),
                          ),

                          DataCell(
                            Text(category.status),
                          ),

                          DataCell(
                            Row(
                              children: [

                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.orange,
                                  ),
                                ),

                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      AppData.categories.remove(category);
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
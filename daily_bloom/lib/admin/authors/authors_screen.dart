import 'package:flutter/material.dart';
import '../../app_data/app_data.dart';
import '../../models/author.dart';

class AuthorsScreen extends StatefulWidget {
  const AuthorsScreen({super.key});

  @override
  State<AuthorsScreen> createState() => _AuthorsScreenState();
}

class _AuthorsScreenState extends State<AuthorsScreen> {
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
                  "Authors",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                ElevatedButton.icon(
                  onPressed: () {
                    _showAddAuthorDialog(context);
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Add Author"),
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
                    headingRowColor:
                    WidgetStateProperty.all(const Color(0xFFF4F4F4)),
                    headingTextStyle: const TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                    ),
                    columns: const [

                      DataColumn(
                        label: Text("Name"),
                      ),

                      DataColumn(
                        label: Text("Tag"),
                      ),

                      DataColumn(
                        label: Text("Quotes"),
                      ),

                      DataColumn(
                        label: Text("Actions"),
                      ),
                    ],

                    rows: AppData.authors.map((author) {
                      return DataRow(
                        cells: [

                          DataCell(Text(author.name)),

                          DataCell(Text(author.tag)),

                          const DataCell(Text("0")),

                          DataCell(
                            Row(
                              children: [

                                IconButton(
                                  icon: const Icon(Icons.edit, color: Colors.orange),
                                  onPressed: () {},
                                ),

                                IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                    setState(() {
                                      AppData.authors.remove(author);
                                    });
                                  },
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

  void _showAddAuthorDialog(BuildContext context) {
    final nameController = TextEditingController();
    final tagController = TextEditingController();
    final bioController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          title: const Text(
            "Add Author",
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          content: SizedBox(
            width: 520,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: "Author Name",
                      prefixIcon: const Icon(Icons.person_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  TextField(
                    controller: tagController,
                    decoration: InputDecoration(
                      labelText: "Tag",
                      hintText: "Stoicism",
                      prefixIcon: const Icon(Icons.sell_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  TextField(
                    controller: bioController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      labelText: "Short Bio",
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

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                      },
                      icon: const Icon(Icons.upload_file_rounded),
                      label: const Text(
                        "Upload Photo",
                        style: TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
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
                  horizontal: 30,
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
                AppData.authors.add(
                  Author(
                    name: nameController.text,
                    tag: tagController.text,
                    bio: bioController.text,
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
                  horizontal: 34,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "Save Author",
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
  }
}
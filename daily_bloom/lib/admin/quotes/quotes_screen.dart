import 'package:flutter/material.dart';
import '../../app_data/app_data.dart';
import '../../models/quote.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {

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
                  "Quotes",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                ElevatedButton.icon(
                  onPressed: () {
                    _showQuoteDialog(context);
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Add Quote"),
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
                  constraints: const BoxConstraints(minWidth: 1500),
                  child: DataTable(
                    headingRowColor: WidgetStateProperty.all(
                      const Color(0xFFF4F4F4),
                    ),
                    headingTextStyle: const TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                    ),
                    columnSpacing: 45,
                    columns: const [

                      DataColumn(label: Text("Quote")),
                      DataColumn(label: Text("Author")),
                      DataColumn(label: Text("Category")),
                      DataColumn(label: Text("Media")),
                      DataColumn(label: Text("Status")),
                      DataColumn(label: Text("Actions")),

                    ],
                    rows: AppData.quotes.map((quote) {
                      return DataRow(
                        cells: [

                          DataCell(
                            SizedBox(
                              width: 250,
                              child: Text(
                                quote.text,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),

                          DataCell(
                            Text(quote.author),
                          ),

                          DataCell(
                            Text(quote.category),
                          ),

                          const DataCell(
                            Text("🎵 🖼️"),
                          ),

                          DataCell(
                            Text(quote.status),
                          ),

                          DataCell(
                            Row(
                              children: [

                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.orange,
                                  ),
                                  onPressed: () {
                                      _showQuoteDialog(
                                        context,
                                        quote: quote,
                                      );
                                  },
                                ),

                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      AppData.quotes.remove(quote);
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

  void _showQuoteDialog(
      BuildContext context, {
        Quote? quote,}) {

    final quoteController =
    TextEditingController(text: quote?.text ?? "");

    String? selectedAuthor = quote?.author;
    String? selectedCategory = quote?.category;
    String status = quote?.status ?? "Published";

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              title: Text(
                quote == null
                    ? "Add Quote"
                    : "Edit Quote",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              content: SizedBox(
                width: 550,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: quoteController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          labelText: "Quote Text",
                          alignLabelWithHint: true,
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(bottom: 80),
                            child: Icon(Icons.format_quote),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      DropdownButtonFormField<String>(
                        value: selectedAuthor,
                        decoration: InputDecoration(
                          labelText: "Author",
                          prefixIcon: const Icon(Icons.person_outline),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        items: AppData.authors.map((author) {
                          return DropdownMenuItem(
                            value: author.name,
                            child: Text(author.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setDialogState(() {
                            selectedAuthor = value;
                          });
                        },
                      ),

                      const SizedBox(height: 18),
                      DropdownButtonFormField<String>(
                        value: selectedCategory,
                        decoration: InputDecoration(
                          labelText: "Category",
                          prefixIcon: const Icon(Icons.category_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        items: AppData.categories.map((category) {
                          return DropdownMenuItem(
                            value: category.name,
                            child: Text(category.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setDialogState(() {
                            selectedCategory = value!;
                          });
                        },
                      ),

                      const SizedBox(height: 18),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.image_outlined),
                          label: const Text(
                            "Upload Background Image",
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

                      const SizedBox(height: 18),

                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.audiotrack_outlined),
                          label: const Text(
                            "Upload Audio",
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

                    if (quote == null) {

                      AppData.quotes.add(
                        Quote(
                          text: quoteController.text,
                          author: selectedAuthor!,
                          category: selectedCategory!,
                          status: status,
                        ),
                      );

                    } else {

                      quote.text = quoteController.text;
                      quote.author = selectedAuthor!;
                      quote.category = selectedCategory!;
                      quote.status = status;

                    }

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
                    "Save Quote",
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
}
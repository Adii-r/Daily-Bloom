import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  Widget _buildCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Icon(
            icon,
            size: 34,
            color: const Color(0xFF6FCF97),
          ),

          const SizedBox(height: 18),

          Text(
            value,
            style: const TextStyle(
              fontFamily: "Poppins",
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            title,
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 16,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
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

            const Text(
              "Dashboard",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 35),

            Row(
              children: [

                Expanded(
                  child: _buildCard(
                    title: "Categories",
                    value: "12",
                    icon: Icons.category_rounded,
                  ),
                ),

                const SizedBox(width: 20),

                Expanded(
                  child: _buildCard(
                    title: "Authors",
                    value: "35",
                    icon: Icons.person_outline,
                  ),
                ),

                const SizedBox(width: 20),

                Expanded(
                  child: _buildCard(
                    title: "Quotes",
                    value: "320",
                    icon: Icons.format_quote_rounded,
                  ),
                ),

                const SizedBox(width: 20),

                Expanded(
                  child: _buildCard(
                    title: "Published",
                    value: "280",
                    icon: Icons.check_circle_outline,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            const Text(
              "Library Summary",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
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
                    headingRowColor: WidgetStateProperty.all(const Color(0xFFF3F3F3)),
                    headingTextStyle: const TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    columns: const [
                      DataColumn(
                        label: Text("Category"),
                      ),
                      DataColumn(
                        label: Text("Quotes"),
                      ),
                      DataColumn(
                        label: Text("Share of Library"),
                      ),
                    ],
                    rows: const [
                      DataRow(
                        cells: [
                          DataCell(Text("Motivation")),
                          DataCell(Text("95")),
                          DataCell(Text("30%")),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text("Mindfulness")),
                          DataCell(Text("70")),
                          DataCell(Text("22%")),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text("Success")),
                          DataCell(Text("55")),
                          DataCell(Text("17%")),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text("Stoicism")),
                          DataCell(Text("52")),
                          DataCell(Text("16%")),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text("Happiness")),
                          DataCell(Text("48")),
                          DataCell(Text("15%")),
                        ],
                      ),
                    ],
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
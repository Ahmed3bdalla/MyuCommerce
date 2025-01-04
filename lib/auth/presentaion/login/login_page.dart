import 'package:flutter/material.dart';
import 'package:myucommerce/auth/presentaion/signup/signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Credit Card Comparison")),
      body: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Enables horizontal scrolling
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical, // Enables vertical scrolling
              child: Table(
                defaultColumnWidth: const IntrinsicColumnWidth(),
                border: TableBorder.all(color: Colors.purple),
                children: [
                  _buildRow('Attribute', 'Credit Card 1', 'Credit Card 2'),
                  _buildRow('Annual Fee', '\$95', '\$0'),
                  _buildRow('APR', '13.99%', '15.99%'),
                  _buildRow('Cashback', '2%', '1.5%'),
                  _buildRow('Sign-up Bonus', '\$300', '\$200'),
                  _buildRow('Attribute', 'Credit Card 1', 'Credit Card 2'),
                  _buildRow('Annual Fee', '\$95', '\$0'),
                  _buildRow('APR', '13.99%', '15.99%'),
                  _buildRow('Cashback', '2%', '1.5%'),
                  _buildRow('Sign-up Bonus', '\$300', '\$200'),
                  _buildRow('Attribute', 'Credit Card 1', 'Credit Card 2'),
                  _buildRow('Annual Fee', '\$95', '\$0'),
                  _buildRow('APR', '13.99%', '15.99%'),
                  _buildRow('Cashback', '2%', '1.5%'),
                  _buildRow('Sign-up Bonus', '\$300', '\$200'),
                  _buildRow('Attribute', 'Credit Card 1', 'Credit Card 2'),
                  _buildRow('Annual Fee', '\$95', '\$0'),
                  _buildRow('APR', '13.99%', '15.99%'),
                  _buildRow('Cashback', '2%', '1.5%'),
                  _buildRow('Sign-up Bonus', '\$300', '\$200'),

                  // Add more rows as needed
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TableRow _buildRow(String attribute, String card1Value, String card2Value, {bool isHeader = true}) {
    const TextStyle headerStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white);
    const Color headerBackgroundColor = Colors.purple; // Choose your header color
    const Color defaultBackgroundColor = Colors.transparent;

    return TableRow(
      children: [
        _buildCell(attribute, isHeader, headerStyle, headerBackgroundColor),
        _buildCell(card1Value, false, headerStyle, defaultBackgroundColor),
        _buildCell(card2Value, false, headerStyle, defaultBackgroundColor),
      ],
    );
  }

  Widget _buildCell(String text, bool isHeader, TextStyle headerStyle, Color headerBackgroundColor) {
    return Container(
      decoration: BoxDecoration(
        border: const Border(
            bottom: BorderSide(
          color: Colors.white,
          width: 1.0,
        )),
        color: isHeader ? Colors.purple : Colors.transparent,
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(text, style: isHeader ? headerStyle : null),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListPage(),
    );
  }
}

class ProductListPage extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Pixel 1', description: 'Pixel is the most featureful phone ever', price: 800, rating: 4),
    Product(name: 'Laptop', description: 'Laptop is the most productive development tool', price: 2000, rating: 5),
    Product(name: 'Tablet', description: 'Tablet is the most useful device ever for meeting', price: 1500, rating: 3),
    Product(name: 'Pen Drive', description: 'Pen Drive is the most stylish storage device ever', price: 100, rating: 2),
    // Add more products if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Navigation'),
        backgroundColor: Colors.blue, // Set the background color of the navbar
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            color: _getProductColor(products[index].name), // Set the card color based on the product
            child: ListTile(
              title: Text(products[index].name, style: TextStyle(fontSize: 24, color: Colors.white)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(products[index].description, style: TextStyle(color: Colors.white)),
                  Text('Price: \$${products[index].price}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  Row(
                    children: List.generate(5, (starIndex) {
                      return Icon(
                        starIndex < products[index].rating ? Icons.star : Icons.star_border,
                        color: Colors.red,
                      );
                    }),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsPage(product: products[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
          ],
        ),
      ),
    );
  }

  Color _getProductColor(String productName) {
    switch (productName) {
      case 'Pixel 1':
        return Colors.blue;
      case 'Laptop':
        return Colors.green;
      case 'Tablet':
        return Colors.yellow;
      case 'Pen Drive':
        return Colors.red;
      default:
        return Colors.white;
    }
  }
}

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.blue, // Set the background color of the navbar
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.blue,
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              child: Text(
                product.name,
                style: TextStyle(fontSize: 32, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
            Text(
              product.description,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Price: \$${product.price}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < product.rating ? Icons.star : Icons.star_border,
                  color: Colors.red,
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
          ],
        ),
      ),
    );
  }
}

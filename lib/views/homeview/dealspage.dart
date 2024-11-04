import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DealsPage extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      "imgUrl": "https://m.media-amazon.com/images/I/71D6nVTS8lL._AC_UF894,1000_QL80_.jpg",
      "title": "Akıllı Duman Dedektörü Yangın Alarmı: Uygulama Bildirimleri ile WiFi Duman Dedektörü, Ev için Fotoelektrik Sensörlü Kablosuz Duman Alarmı, Tuya Uygulaması Uzaktan Kumanda, ",
      "price": "59,92 TL",
      "discount": "74,90 TL",
    },
    {
      "imgUrl": "https://m.media-amazon.com/images/I/71D6nVTS8lL._AC_UF894,1000_QL80_.jpg",
      "title": "Akıllı Duman Dedektörü Yangın Alarmı: Uygulama Bildirimleri ile WiFi Duman Dedektörü, Ev için Fotoelektrik Sensörlü Kablosuz Duman Alarmı, Tuya Uygulaması Uzaktan Kumanda, ",
      "price": "19,99 TL",
      "discount": "29,99 TL",
    },
    {
      "imgUrl": "https://m.media-amazon.com/images/I/71D6nVTS8lL._AC_UF894,1000_QL80_.jpg",
      "title": "Akıllı Duman Dedektörü Yangın Alarmı: Uygulama Bildirimleri ile WiFi Duman Dedektörü, Ev için Fotoelektrik Sensörlü Kablosuz Duman Alarmı, Tuya Uygulaması Uzaktan Kumanda, ",
      "price": "45,00 TL",
      "discount": "50,00 TL",
    },
    {
      "imgUrl": "https://m.media-amazon.com/images/I/71D6nVTS8lL._AC_UF894,1000_QL80_.jpg",
      "title": "Akıllı Duman Dedektörü Yangın Alarmı: Uygulama Bildirimleri ile WiFi Duman Dedektörü, Ev için Fotoelektrik Sensörlü Kablosuz Duman Alarmı, Tuya Uygulaması Uzaktan Kumanda, ",
      "price": "89,99 TL",
      "discount": "120,00 TL",
    },
  ];

  DealsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Image
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'images/icon1.png', // PNG dosyanızın yolunu buraya yazın
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),

          // Carousel Slider for Product Cards
          CarouselSlider(
            options: CarouselOptions(
              height: 250,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              autoPlay: true,
            ),
            items: products.map((product) {
              return Builder(
                builder: (BuildContext context) {
                  return _buildProductCard(
                    imgUrl: product["imgUrl"]!,
                    title: product["title"]!,
                    price: product["price"]!,
                    discount: product["discount"],
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard({
    required String imgUrl,
    required String title,
    required String price,
    String? discount,
  }) {
    return Container(
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                imgUrl,
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Title
                  Text(
                    title,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  // Discount and Price
                  Row(
                    children: [
                      if (discount != null) ...[
                        Text(
                          discount,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 4),
                      ],
                      Text(
                        price,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // "Fırsatı Gör" Button
                  TextButton(
                    onPressed: () {
                      // Ürün detayına yönlendirme işlemi yapılabilir.
                    },
                    child: const Text('Fırsatı Gör', style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

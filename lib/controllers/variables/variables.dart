import 'package:akillisehir/models/colors/colors.dart';
import 'package:flutter/material.dart';
// TODO: DEĞİŞKENLERİ BURADA TANIMLA

var appBarTextStyle =
    TextStyle(fontWeight: FontWeight.bold, color: acikRenkBeyaz2);

String selectedPage = '';
String selectedIndex = '';

const edgeInsetsCard = EdgeInsets.all(8.0);

const edgeInsetsRow = EdgeInsets.only(top: 20);

final PageController pageController = PageController();

// Görsellerin yollarını liste olarak tanımlayın
final List<String> imagePaths = [
  'images/icons12.png',
  'images/icons14.png',
  'images/icons15.png',
  'images/icons16.png',
  'images/icons17.png',
  'images/icons18.png',
];

final Map<String, List<Map<String, String>>> solutions = {
  "Sağlık": [
    {
      "imgUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbLcKbsogNAAkThzflzCHyoL3fCvF0FebTgg&s",
      "title": "Akıllı Serum Sistemi",
      "subtitle": "HealthTech Corp.",
      "description":
          "Hastanın hayati değerlerine göre sıvı akışını izleyen ve ayarlayan sistem."
    },
    {
      "imgUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKFy7HZOVXn6B8fObEi17IjYQ2eiyQ0eRgig&s",
      "title": "Uzaktan Hasta Takibi",
      "subtitle": "MedConnect",
      "description": "Evdeki hastalar için gerçek zamanlı sağlık takibi sağlar."
    },
    {
      "imgUrl":
          "https://creativedestructionlab.com/wp-content/uploads/2024/06/biosense.jpg",
      "title": "Giyilebilir Sağlık Takibi",
      "subtitle": "BioSense Systems",
      "description":
          "Akıllı bileklikler ve saatlerle sağlığı izleyerek hastanelere veri aktarır."
    },
  ],
  "Ulaşım": [
    {
      "imgUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShTrC6ivKbr1WgWHfQD2GLLN4ALuV3SAArYQ&s",
      "title": "Akıllı Trafik Lambaları",
      "subtitle": "MoveSmart",
      "description":
          "Trafik yoğunluğuna göre ayarlanan yapay zeka tabanlı trafik ışıkları."
    },
    {
      "imgUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSVXfWtSDx-1eFT7n9eOCccRaPS0hrBQb891hhlRY_jLz86WU_GSjNYys0nWMmhvOXUaw&usqp=CAU",
      "title": "Otonom Servis Araçları",
      "subtitle": "UrbanFlow",
      "description": "Kentsel alanlar için sürücüsüz otonom servis araçları."
    },
    {
      "imgUrl":
          "https://mir-s3-cdn-cf.behance.net/project_modules/1400/b10c2999341905.5ef0df0f0bee2.png",
      "title": "Akıllı Park Sistemi",
      "subtitle": "ParkEase",
      "description":
          "Boş park yerlerini gösteren ve rezervasyon yapan akıllı park sistemi."
    },
  ],
  "Enerji Yönetimi": [
    {
      "imgUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-nWql_LQ8F0J_jFwlItI-cN9FzbmuSKWnuA&s",
      "title": "Akıllı Şebeke",
      "subtitle": "GreenCity Power",
      "description": "Gerçek zamanlı talebe göre enerji dağıtımını ayarlar."
    },
    {
      "imgUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBPZWhkz2u2rCrfs3PQw8_mJOVuU4V7w4csQ&s",
      "title": "Akıllı Güneş Panelleri",
      "subtitle": "SolarInnovate",
      "description": "Gerçek zamanlı performans takibi sunan güneş panelleri."
    },
    {
      "imgUrl":
          "https://media.licdn.com/dms/image/v2/C4D0BAQHB0BISkZ451Q/company-logo_200_200/company-logo_200_200/0/1636578978687/ecovolt_scooters_logo?e=2147483647&v=beta&t=XP0ECbM9Nd6jzXotlzmfRXabH7rz5JRZHJXIkme58sM",
      "title": "Enerji Talep Tahmini",
      "subtitle": "EcoVolt",
      "description":
          "Enerji talep tahminleri ile kaynakların verimli kullanımını sağlar."
    },
  ],
  "Kamu Güvenliği": [
    {
      "imgUrl":
          "https://www.safecitysolutions.com/wp-content/uploads/2015/02/SC_New_REV.png",
      "title": "Akıllı Gözetim Sistemi",
      "subtitle": "SafeCity Solutions",
      "description":
          "Olağandışı aktiviteleri izleyen ve uyarı veren yapay zeka tabanlı kamera sistemi."
    },
    {
      "imgUrl":
          "https://www.ffeta.co.za/storage/companies/fire-alert-prevention-appliances/RsyCzssEXLdyhbtFAUP1vLqqZxNt0ERJ5nyJV9X1.JPG",
      "title": "Akıllı Yangın Algılama",
      "subtitle": "FireAlert",
      "description":
          "Binalarda gerçek zamanlı yangın riski algılayan sensörler."
    },
    {
      "imgUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_G8N_HHTGa41G6-hW63mT0SxKAqmB-zpXYw&s",
      "title": "Yapay Zeka Suç Tahmini",
      "subtitle": "SecureZone",
      "description":
          "Suç tahminine dayalı güvenlik ekiplerini yönlendiren yapay zeka sistemi."
    },
  ],
  "Atık Yönetimi": [
    {
      "imgUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtAUULa1xc7xE_1MdkNlTjcp1HLj17GyWAQQ&s",
      "title": "Akıllı Çöp Kutuları",
      "subtitle": "CleanCity",
      "description":
          "Doluluk oranına göre atık toplama hizmetlerine bildirim gönderen çöp kutuları."
    },
    {
      "imgUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtMwy6OYWjvdRUyvdsjST1w94JagbOY4lubxW5wcRO61PXaWXxQdykIEk0RsTQTicZTjQ&usqp=CAU",
      "title": "Yapay Zeka Atık Ayrıştırma",
      "subtitle": "GreenEco",
      "description":
          "Geri dönüştürülebilir atıkları otomatik olarak ayrıştıran sistem."
    },
    {
      "imgUrl":
          "https://mir-s3-cdn-cf.behance.net/projects/404/9c3123181336637.Y3JvcCwzMjMyLDI1MjgsMCww.png",
      "title": "Gerçek Zamanlı Çöp İzleme",
      "subtitle": "BinTech",
      "description":
          "Çöp kutusu doluluğunu izleyerek optimize edilmiş atık toplama sağlar."
    },
  ],
  "Çevre": [
    {
      "imgUrl": "https://avatars.githubusercontent.com/u/111458300?s=280&v=4",
      "title": "Hava Kalitesi İzleme",
      "subtitle": "AirSense Labs",
      "description":
          "Kirlilik seviyelerini izler ve yüksek riskli bölgelerde uyarılar sağlar."
    },
    {
      "imgUrl":
          "https://www.shutterstock.com/image-vector/water-guard-logo-template-illustration-260nw-2236080207.jpg",
      "title": "Akıllı Su İzleme",
      "subtitle": "WaterGuard",
      "description": "Nehirlerde ve göllerde su kalitesini izleyen sistem."
    },
    {
      "imgUrl":
          "https://media.licdn.com/dms/image/v2/C4E0BAQG3eAdSzwR2WQ/company-logo_200_200/company-logo_200_200/0/1630629375010?e=2147483647&v=beta&t=IoBKSGDuSdek8n_mQmX3rYjeOALm5v61dopvw6HyH5I",
      "title": "Kentsel Sera Kontrolü",
      "subtitle": "GreenAir Solutions",
      "description":
          "Şehir içindeki yeşil alanları optimize eden ve nem kontrolü yapan sistem."
    },
  ]
};

final List<Map<String, String>> products = [
  {
    "imgUrl":
        "https://m.media-amazon.com/images/I/71D6nVTS8lL._AC_UF894,1000_QL80_.jpg",
    "title":
        "Akıllı Duman Dedektörü Yangın Alarmı: Uygulama Bildirimleri ile WiFi Duman Dedektörü, Ev için Fotoelektrik Sensörlü Kablosuz Duman Alarmı, Tuya Uygulaması Uzaktan Kumanda, ",
    "price": "599,92 TL",
    "discount": "445,90 TL",
  },
  {
    "imgUrl":
        "https://productimages.hepsiburada.net/s/777/375/110000782373790.jpg/format:webp",
    "title":
        "Petkit Pura Max 2 Akıllı Kedi Tuvaleti",
    "price": "29999,99 TL",
    "discount": "26999,99 TL",
  },
  {
    "imgUrl":
        "https://cdn.dsmcdn.com/mnresize/400/-/ty609/product/media/images/20221123/19/220241770/629909664/1/1_org.jpg",
    "title":
        "Xiaomi Mi Air Purifier 4 Compact, Tuya Uygulaması Uzaktan Kumanda, ",
    "price": "5000 TL",
    "discount": "3599,00 TL",
  },
  {
    "imgUrl":
        "https://m.media-amazon.com/images/I/61+9y7FSNHL._AC_UF350,350_QL50_.jpg",
    "title":
        "Smarter Living - WiFi Gas Alarm Leak Detector for Natural Gas, Propane, Methane, ",
    "price": "2000 TL",
    "discount": "1699 TL",
  },
  {
    "imgUrl":
        "https://m.media-amazon.com/images/I/71D6nVTS8lL._AC_UF894,1000_QL80_.jpg",
    "title":
        "Akıllı Duman Dedektörü Yangın Alarmı: Uygulama Bildirimleri ile WiFi Duman Dedektörü, Ev için Fotoelektrik Sensörlü Kablosuz Duman Alarmı, Tuya Uygulaması Uzaktan Kumanda, ",
    "price": "599,92 TL",
    "discount": "445,90 TL",
  },
  {
    "imgUrl":
        "https://productimages.hepsiburada.net/s/777/375/110000782373790.jpg/format:webp",
    "title":
        "Petkit Pura Max 2 Akıllı Kedi Tuvaleti",
    "price": "29999,99 TL",
    "discount": "26999,99 TL",
  },
];


final List<String> imgList = [
  'https://hizliresim.com/bl82r5m', // Görsellerin URL'leri
  'https://hizliresim.com/lhbh7m5',
  'https://hizliresim.com/sif4lfv',
  'https://hizliresim.com/os67w3i',
];

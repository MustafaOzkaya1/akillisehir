import 'package:akillisehir/controllers/variables/variables.dart';
import 'package:akillisehir/models/colors/colors.dart';
import 'package:akillisehir/views/homeview/chatscreen/chat_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<List<String>> fetchImages() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    return [
      'images/1.png', // Görsellerin URL'leri
      'images/2.png', // Görsellerin URL
      'images/3.png', // Gör
      'images/4.png', // Gör
    ];
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
          ),
        ],
        title: Image.asset(
          'images/onsmart.png', // Görsel yolunu buraya yazın
          height: 60, // Görselin yüksekliği
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[renkKoyuMavi, koyuMavi],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Messages'),
              onTap: () {
                setState(() {
                  selectedPage = 'Messages';
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Profile'),
              onTap: () {
                setState(() {
                  selectedPage = 'Profile';
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                setState(() {
                  selectedPage = 'Settings';
                });
              },
            ),
          ],
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          // İlk sayfa
          SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [renkKoyuMavi, koyuMavi]),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: edgeInsetsRow,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: edgeInsetsCard,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.white70, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const _SampleCard(
                              cardImage: "images/akilliot.png",
                              cardName: '',
                              cardColor: "amber",
                            ),
                          ),
                        ),
                        Padding(
                          padding: edgeInsetsCard,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.white70, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const _SampleCard(
                              cardImage: "images/akillibe.png",
                              cardName: '',
                              cardColor: "purple",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: edgeInsetsCard,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.white70, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const _SampleCard(
                            cardImage: "images/akilliha.png",
                            cardName: '',
                            cardColor: "red",
                          ),
                        ),
                      ),
                      Padding(
                        padding: edgeInsetsCard,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.white70, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const _SampleCard(
                            cardImage: "images/akilliso.png",
                            cardName: '',
                            cardColor: "blue",
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: edgeInsetsCard,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.white70, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    image: AssetImage("images/ai.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                width: 350,
                                height: 150,
                                child: const Center(child: Text("")),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16), // Yukarıdan biraz boşluk bırak
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: SizedBox(
                      height: 100, // ListView için sabit yükseklik ayarla
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: imagePaths.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor:
                                  Colors.orangeAccent, // Arka plan rengi
                              child: ClipOval(
                                child: Image.asset(
                                  imagePaths[index],
                                  fit: BoxFit.cover,
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                   Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: SizedBox(
                      height: 100, // ListView için sabit yükseklik ayarla
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: imagePaths.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor:
                                  Colors.orangeAccent, // Arka plan rengi
                              child: ClipOval(
                                child: Image.asset(
                                  imagePaths[index],
                                  fit: BoxFit.cover,
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16), // Yukarıdan biraz boşluk bırak
                ],
              ),
            ),
          ),
          // İkinci sayfa

          SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [renkKoyuMavi, koyuMavi]),
              ),
              child: const Column(
                children: [
                  NewsCard(
                    imgUrl:
                        'https://www.evrensel.net/images/840/upload/dosya/275262.jpg',
                    title:
                        '''4. İzmir Uluslararası Film ve Müzik Festivali başladı''',
                    description:
                        '''4. İzmir Uluslararası Film ve Müzik Festivali başladı. İzmir Büyükşehir Belediyesi’nin düzenlediği festivalde, 6 kıtadan 30 ülkeden 60’a yakın film izleyiciyle buluşacak.

4. İzmir Uluslararası Film ve Müzik Festivali 30 Ekim’de başladı. İzmir Büyükşehir Belediyesi’nin düzenlediği festivalde, 6 kıtadan 30 ülkeden 60’a yakın film izleyiciyle buluşacak.

İzmir Büyükşehir Belediye Başkanı Dr. Cemil Tugay, festivalin açılışında yaptığı konuşmada, İzmir’in kültür ve sanat hayatına önemli bir katkı sunan bu etkinliğin kurumsallaşması için çalıştıklarını vurguladı. Festival Direktörü Vecdi Sayar ise festivalin, dünyada ilgi çeken organizasyonlardan biri olduğunu belirterek İzmir seyircisinin de sahip çıkması gerektiğini belirtti.


  
Festivalde, ulusal ve uluslararası olmak üzere iki yarışma düzenleniyor. Ulusal yarışmada 2023-2024 yapımı 9 yerli film, uluslararası yarışmadaysa müzik dünyasına odaklanan 9 film yer alacak. Yurt içi ve yurt dışından isimlerin yer aldığı jüriler, Kristal Flamingo ödüllerini kazananları belirleyecek.


Sinema ve müzik dünyasına dair söyleşi ve atölyeler festival boyunca sürecek. İzmir Uluslararası Film ve Müzik Festivali, 3 Kasım’da yapılacak kapanış töreniyle sona erecek. Detaylı program için İzmir Büyükşehir Belediyesi web sitesini ziyaret edebilirsiniz. (KÜLTÜR SERVİSİ)

 ''',
                  ),
                  NewsCard(
                    imgUrl:
                        'https://cdn.iha.com.tr/Contents/images/2024/10/31/20241031aw319511-0.jpg',
                    title: 'İzmir’de emniyet ve jandarmaya 688 yeni araç',
                    description:
                        '''İzmir’de emniyet ve jandarma teşkilatına yeni tahsis edilen 688 aracın teslim töreni, İzmir Valiliği önünde gerçekleştirildi. Yeni tahsis edilen araçlar Konak Meydanı’nda sirenler çalarak İzmir caddelerinde kortej yaptı.


İzmir’de emniyet ve jandarma kolluk güçlerine yeni tahsis edilen, motosiklet, ATV, otomobil, minibüs ve kamyondan oluşan 988 yeni görev aracı, tören gerçekleştirilerek emniyet ve jandarma mensuplarına teslim edildi. Teslim törenine İzmir Valisi Süleyman Elban, İzmir İl Emniyet Müdürü Celal Sel, İzmir İl Jandarma Komutanı Tümgeneral Metin Düz, AK Parti İzmir İl Başkanı Bilal Saygılı, MHP İzmir İl Başkanı Veysel Şahin ile emniyet ve jandarma personelleri katıldı.



"Daha kaliteli hizmet ve daha huzurlu bir şehir sağlamak için çalışmaya devam edeceğiz"


Törende konuşma yapan İzmir Valisi Süleyman Elban, "Vatandaşımızın huzur ve güvenliği için, emniyet ve asayiş hizmetlerinin daha üst seviye verilmesi, suç ve suçluyla mücadele, terörle mücadele olmak üzere, tüm alanlarda başarıyla hizmet vermek, hizmet kalitesini arttırmak için, 7 gün 24 dört saat tüm kolluk birimlerimiz görev yapmaktalar. Bu görevlerini yaparken elbette ki çağın gerektirdiği her türlü teknik, araç ve gereçlerden de üst düzeyde yararlanmaları gerekiyor ki hizmet kalitesi daha da artsın. Bu anlamda, hem emniyet teşkilatımızın hem de jandarma teşkilatımızın birçok teknik ihtiyaçları bakanlığımız tarafından ve Valiliğimiz tarafından sürekli takviye edilmekte ve yenilenmektedir. Bugün de hem emniyet müdürlüğümüzün hem jandarma komutanlığımızın hizmetlerinde kullanmak için, İçişleri Bakanlığımız bütçesinde alınan araçları, son 1 yıldan beri Valilik imkanlarımız ve özellikle hayırsever İzmirli hemşerilerimizin bağışlarıyla aldığımız araçları bugün hizmete sunacağız. Emniyet ve jandarmamızla, biraz sonra bunları göreve gönderdiğimizde hizmet aldığımızda onlar da hizmete girecekler. Bugün itibariyle bu hizmete verdiğimiz araçların toplam sayısı 988 adet. Bunun 154’ü motosiklet, 136’sı panelvan ve minibüs, 4 tanesi kamyon, 20 tanesi ATV diye tabir ettiğimiz araç ve 676 tanesi binek ve SUV modelden oluşan araçlardır. Dolayısıyla bu araçlarla inşallah vatandaşımıza daha kaliteli hizmet ve daha huzurlu bir şehir sağlamak için çalışmaya devam edeceğiz. Polisimiz ve jandarmamızın bu araçları, vatandaşımızın huzur ve güvenliği için kullanırken, kazasız, belasız kullanmalarını ve huzur içerisinde görev yapmalarını diliyorum. Araçlarımızın hayırlı uğurlu olmasını temenni ediyor, bu güzel araçların teşkilatlarımıza kazandırılmasında başta Sayın Cumhurbaşkanımız Recep Tayyip Erdoğan, İçişleri Bakanımız Sayın Ali Yerlikaya’ya ve siz kıymetli İzmirli hemşehrilerimize şükranlarımızı sunuyor, tekrar hayırlı uğurlu olsun diyorum" açıklamasında bulundu.


Vali Elban’ın açıklamasının ardından İzmir İl Müftüsü Sinan Kazancı dua okudu. Törenin sonunda sirenlerle meydandan çıkış yapan yeni araçlar, İzmir caddelerinde kortej gerçekleştirdi.''',
                  ),
                  NewsCard(
                    imgUrl:
                        'https://i.ekonomim.com/2/1280/720/storage/files/images/2024/10/31/izmirde-enerji-tuketimi-dijital-cozumlerle-karbondan-arindirilacak-2vvy_cover.jpg.webp',
                    title:
                        'İzmir’de enerji tüketimi dijital çözümlerle karbondan arındırılacak',
                    description:
                        '''İzmir Büyükşehir Belediyesi, 2030 yılında sıfır karbon hedefiyle çalışmalarını sürdürüyor. 2030 yılına kadar 100 Avrupa şehrinin iklim nötrlüğüne ulaşmasını hedefleyen ve bu doğrultudaki çalışmaları destekleyen NetZeroCities programının çağrısına katılan İzmir, sunduğu proje ile 12 ülkeden, 25 pilot şehir ve 21 farklı pilot aktive kapsamında desteklenmeye hak kazanan şehir oldu.

İzmir’de enerji tüketimi dijital çözümlerle karbondan arındırılacak


İzmir’i sıfır karbon hedefine ulaştırmak için İzmir Büyükşehir Belediyesi öncülüğünde kurulan ve kent paydaşlarının da içinde yer aldığı Küresel İklim Topluluğu (KİT) İzmir tarafından hazırlanan “Dijital Çözümlerle Elektrikte Karbonsuzlaşma (GCC-SYNERGY)” projesi ile ilgili çalışmalar eylül ayında başladı.

Proje, İzmir Büyükşehir Belediyesi koordinatörlüğünde ENSİA (Enerji Sanayicileri ve İş İnsanları Derneği), Ege Üniversitesi, GDZ Elektrik AŞ, Ege Orman Vakfı ve İZENERJİ ortaklığında 2 yıl boyunca devam edecek. Proje ile sera gazı salımının en önemli nedenlerinden biri olan enerji tüketimi üzerine pilot farkındalık oluşturma çalışmaları yürütülerek İzmir’deki enerji tüketiminin karbondan arındırılması hedefleniyor.

Akıllı Şehirler Şube Müdürlüğü kuruldu
Proje kapsamında İzmir’in akıllı şehir vizyonunun bir parçası olarak; dijital platformlarla enerji tüketiminin izlenmesi, analiz edilmesi ve yenilenebilir enerji kaynaklarının kullanımının teşvik edilmesi amaçlanıyor. Çalışmalar İzmir Büyükşehir Belediyesi Bilgi İşlem Dairesi Başkanlığı Akıllı Şehir Şube Müdürlüğü’nün koordinasyonunda yürütülecek. Temmuz 2024’te kurulan Akıllı Şehir Şube Müdürlüğü, dünyadaki akıllı şehir stratejileri, uygulamaları ve mevzuatlarını araştırarak ulusal ve uluslararası düzeyde gösterge ve performans kriterleri belirlemek, bu kriterleri izlemek, teknolojik altyapıları geliştirmek ve akıllı şehir projelerinin koordinasyonunu sağlamak amacıyla çalışmalarını sürdürüyor.

İzmir’in uluslararası gücü arttı
Avrupa Komisyonu tarafından AB Şehirler Misyonu Etiketi ile ödüllendirilen İzmir’in bu unvanı ile iklim değişikliği çalışmalarına yönelik yapılacak faaliyetlerde Avrupa Birliği tarafından sağlanan hibe ve fonlara erişimi de kolaylaştı. İzmir, Avrupa Birliği üyesi ülke kentleri dışında bu unvanı taşıyan ilk kent. GCC-SYNERGY gibi projelerle iklim nötrlüğüne ulaşma hedefine hız kazandıran İzmir, Avrupa’nın akıllı şehirler ağı içinde güçlü bir pozisyon elde etti.''',
                  ),
                  NewsCard(
                    imgUrl:
                        'https://habereksprescomtr.teimg.com/haberekspres-com-tr/uploads/2024/10/izmirde-tarihe-saygi-yerel-koruma-odullerinde-kazananlar-aciklandi4.jpg',
                    title:
                        'İzmir’de Tarihe Saygı Yerel Koruma Ödülleri’nde kazananlar açıklandı!',
                    description:
                        '''İzmir Büyükşehir Belediyesi’nin 20 yıldır düzenlediği “Tarihe Saygı Yerel Koruma Ödülleri” kapsamında bu yıl kazanan projeler belli oldu. 62 başvuru arasından seçilen başarılı projeler, kamuoyuna tanıtılacak. Bu yıl ilk kez verilen “Korumada Süreklilik Ödülü” kapsamında 12 proje ödüllendirildi. Bu projeler Yeni Foça, Urla, Birgi ve Menemen gibi bölgelerden katılımlar içeriyor. 

Korumada Süreklilik Ödülü kazananları:
- Gülsen Ertürk Evi (Yeni Foça)
- Mahmut Karnas Evi (Yeni Foça)
- Nazmiye Arabacı Evi (Yeni Foça)
- Ali Rıza Cakubey Evi (Yeni Foça)
- Ahmet Can Taşkan, Köprübaşı Fırını (Urla)
- Mehmet Erol, Saatçi (Urla)
- Çetin & Sevil Özgül Evi (Urla)
- Yılmaz Eren, Terzi (Urla)
- Füsun & Güven Çağatay Evi (Varyant)
- Arife Döner Evi (Birgi)
- Ayşe Adalet Süzer Can Evi (Birgi)
- Ali Haydar Ayla, Kubbeli Bakkal (Menemen)

“Tarihine Sahip Çıkan Okul Projeleri” kategorisinde birçok okul kültürel miras projeleriyle teşekkür ve teşvik belgelerine layık görüldü. Ödül alan okullardan bazıları:
- Özel İzmir Sev İlkokulu, Liman Kenti İzmir
- İstek İzmir Okulları, Çocukların Gözü ile Kültür Mirası İzmir
- UKEB Okulları, Geçmişten Günümüze Bergama Antik Kenti
- Özel İzmir Amerikan Koleji, Vebanın İzinde; Seferihisar Veba Mezarlığı
- TED İzmir Koleji Ortaokulu, Geçmişin İzinde Kamanlı Yerleşkesi
- İzmir Özel Türk Koleji Bornova Kampüsü, Evliya Çelebi'nin İzinde Kemeraltı

Geleneksel zanaatların yaşatılmasına katkı sağlayan ustalar ödüllendirildi. Bu yılki Jüri Özel Ödülü kazananları:
- Feti Pamukoğlu - Saatçi (Kemeraltı)
- Ozan Özdemir - Çalgı Yapım Ustası (Kemeraltı)
- Cihangir Dinç - Fıçıcı (Kemeraltı)
- Ali Demirci - Kalaycı Ustası (Bergama)
- Hulki İpek, Hilkat İpek - Saz Yapım Ustası

“Tarihi Yapıda Yaşam Ödülü” sahipleri:
- Yahya & Fatma Şahinkoç, Şahinkoç Aile Apartmanı (Bergama)
- Sermin Demirutku Evi (Tire)
- Gülten & Halil Yeniyurt, Sakaoğlu Fırını (Basmane)
- Erdem Tok, Tokoğlu Fırını (Birgi)
- Nuran & Ayfer Yağcier Evi (Birgi)

“Özgün İşlevin Değiştirildiği Esaslı Onarım Ödülü” kazananları:
- Ziraat Bankası İzmir Sanat Müzesi (Konak)

“Özgün İşlevin Korunduğu Esaslı Onarım Ödülü” sahipleri:
- Ender Hanım Gülcüoğlu Konağı (Tire)
- Balcıoğlu Evi (Foça)

“Basit Onarım Ödülü” kazananı:
- Natırzade Evi (Kemeraltı)

“Kültür Varlıklarını Koruma Dalında Katkı Ödülü” kazananları:
- Tire Bandosu; Yüz Yıllık Seslerin İzinde (Belgesel)
- Bedriye Gülay Beşikçi, Basmane Semtinin Kültürel Miras Resimleri
- Prof. Dr. Yavuz Çorapçıoğlu, İzmir Görsel Koleksiyonu''',
                  ),
                  NewsCard(
                    imgUrl:
                        'https://www.evrensel.net/images/840/upload/dosya/266195.jpg',
                    title: 'İzmir Barosu: Halkın iradesine saygı duyun',
                    description:
                        '''İzmir Barosu, Esenyurt Belediye Başkanı Ahmet Özer’in evinden gözaltına alınarak yerine kayyum atanmasına ilişkin yazılı bir açıklama yayınladı.

Özer’in keyfi bir şekilde evinden gözaltına alındığı, makam odasına ise zor kullanarak girildiği ve arama yapıldığı ifade edilen açıklamada, “Gözaltı sonrası tutuklama talebiyle mahkemeye sevk edilen ve tutuklanan Prof. Dr. Ahmet Özer hakkındaki soruşturma dosyasından verilen kısıtlılık kararı nedeniyle müdafilerin dahi bilgi alamazken dosya içeriği hakkında basına bilgi sızdırılması, belediyeye kayyum atanacağı haberinin yayılması hatta kayyumun adının kamuoyu ile paylaşılması Anayasa'nın temel ilkelerinden biri olan hukuki güvenlik ilkesini ciddi anlamda zedelemektedir. Siyasi iktidarın seçilmiş muhalif belediye başkanlarına yönelik hukuk dışı tutumu, çeşitli suçlamalara dayanarak keyfi şekilde başkanlık makamlarına kayyum ataması halk iradesinin esaret altına alınması, yok sayılması anlamına gelir. Bu keyfiyeti ve hukuksuzluğu kabul etmiyor, sürecin takipçisi olacağımızı kamuoyuna duyuruyoruz. ''',
                  ),
                  NewsCard(
                    imgUrl:
                        'https://iaysr.tmgrup.com.tr/a4c2e7/780/411/0/101/358/290?u=https://iysr.tmgrup.com.tr/2024/10/30/1730318095733.jpeg',
                    title: 'İZSU’dan temizlik harekâtı',
                    description:
                        '''İZMİR Büyükşehir Belediyesi İZSU Genel Müdürlüğü, İzmir Körfezi'nin temizliği için yoğun bir çalışma yürütüyor. İZSU ekipleri bir yandan dere yataklarında temizlik yaparken diğer yandan da kentin atık sularını Çiğli Arıtma Tesisi'ne ulaştıran 60 kilometrelik hattı mercek altına aldı. 500 metrelik kısmında evsel atık yoğunluğu tespit edilen Fatih Caddesi'ndeki kolektör hattında yirmi dört saat kesintisiz çalışma yapılıyor. Tıkanıklığı genellikle giderlere atılan ıslak mendillerin oluşturduğunu ifade eden yetkililer, "Bu atıklar bertaraf edilmiyor ve hatta dibe oturma yapıyor. Bu yüzden suyun akışını engelliyor. Vatandaşlarımızdan daha duyarlı olmasını diliyoruz. Lütfen ıslak mendil ve peçetelerinizi tuvalete atıp sifonu çekmeyin" şeklinde konuştu.''',
                  ),
                  NewsCard(
                    imgUrl:
                        'https://cdn1.ntv.com.tr/gorsel/8Bwemz3CjkeciiyA864mCA.jpg?width=1000&mode=both&scale=both&v=1730299301762',
                    title:
                        '''İzmir depreminin 4'üncü yıl dönümünde hayatını kaybedenler anıldı''',
                    description:
                        '''İzmir'de, Seferihisar ilçesi açıklarında 30 Ekim 2020'de meydana gelen 6,6 büyüklüğündeki depremde hayatını kaybeden 117 kişi için anma programları düzenlendi. Törende, depremin meydana geldiği saat 14.51'de itfaiye araçları siren çaldı, hayatını kaybedenler anısına saygı duruşunda bulunuldu, Deprem Anıtı'na karanfil bırakıldı.

İzmir depreminin 4'üncü yıl dönümünde hayatını kaybedenler anıldı - 2
Kentin yapı stokunun çok kötü olduğunu belirten Elban, "Eğer Allah korusun 6 ve üzeri bir depremin ilimizde ciddi yıkıcı sonuçlara yol açacağı da kesin. Bunu korkutmak için ya da felaket tellallığı için söylemiyoruz, bilimsel bir durumu söylüyoruz. Bununla ilgili en temel çözümlerden birisinin de kentsel dönüşüm olduğunu söylüyoruz." dedi.

İzmir depreminin 4'üncü yıl dönümünde hayatını kaybedenler anıldı - 3
Elban, şehirlerde kentsel dönüşümden önce zihinlerde bir kentsel dönüşüme ihtiyaç olduğunu dile getirdi.

İzmir depreminin 4'üncü yıl dönümünde hayatını kaybedenler anıldı - 4
Elban, yaraların sarılması noktasında devletin ve ilgili kurumların kısa sürede çok önemli işlere imza attığını sözlerine ekledi.



İzmir depreminin 4'üncü yıl dönümünde hayatını kaybedenler anıldı - 5
30 EKİM DEPREM ANITI'NA KARANFİL BIRAKILDI
İzmir Büyükşehir Belediyesi tarafından da Bayraklı ilçesindeki 30 Ekim Deprem Anıtı'nda anma töreni düzenlendi.

İzmir depreminin 4'üncü yıl dönümünde hayatını kaybedenler anıldı - 6
Kur'an-ı Kerim okunmasıyla başlayan törende, depremin meydana geldiği saat 14.51'de itfaiye araçları siren çaldı, hayatını kaybedenler anısına saygı duruşunda bulunuldu, Deprem Anıtı'na karanfil bırakıldı.

İzmir depreminin 4'üncü yıl dönümünde hayatını kaybedenler anıldı - 7
Depremden hayatını kaybeden vatandaşların yakınlarının gözyaşlarına hakim olamadıkları görüldü.



İzmir depreminin 4'üncü yıl dönümünde hayatını kaybedenler anıldı - 8
İzmir Büyükşehir Belediye Başkanı Cemil Tugay, buradaki konuşmasında, depremde yıkılan binaların birçoğunun 1999 yılından önceki standartlara göre yapıldığını söyledi.

İnsanların risk altında yaşamasına engel olmak istediklerini belirten Tugay, "Göreve geldiğimizden beri ne yapacağımızı bilen bir yol yürüyoruz. Elimizden geleni yapıyoruz. Özellikle riskli yapıların 6,5 ve 7 arası şiddette yıkılabilecek yapıların bir an önce mümkünse yeniden yapılması, değilse güçlendirilmesi için bir şeyler yapmak zorundayız." dedi.''',
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[renkKoyuMavi, koyuMavi],
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Image
                    SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        'images/akillico.png', width: 100,
                        height: 80, // PNG dosyanızın yolunu buraya yazın
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 16),

                    Center(
                      child: FutureBuilder<List<String>>(
                        future: fetchImages(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            // Veriler yüklenene kadar CircularProgressIndicator göster
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            // Hata durumunda mesaj göster
                            return const Text("Veriler yüklenemedi.");
                          } else if (snapshot.hasData) {
                            // Veriler başarıyla yüklendiğinde CarouselSlider göster
                            return CarouselSlider(
                              options: CarouselOptions(
                                height: 200, // Carousel'in yüksekliği
                                autoPlay: true, // Otomatik geçiş
                                enlargeCenterPage:
                                    true, // Merkezdeki görseli büyüt
                                viewportFraction:
                                    0.8, // Görsellerin ekran genişliği oranı
                                autoPlayInterval:
                                    const Duration(seconds: 3), // Geçiş süresi
                              ),
                              items: snapshot.data!.map((imgUrl) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        imgUrl,
                                        fit: BoxFit.cover,
                                        width: double
                                            .infinity, // Görseli tam genişlikte yapar
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            );
                          } else {
                            // Veri yoksa boş bir widget döndür
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ),
                     SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        'images/akilliev.png', width: 100,
                        height: 80, // PNG dosyanızın yolunu buraya yazın
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 0),

                    // Carousel Slider for Product Cards
                    // Ürünlerin listelendiği alan
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          shrinkWrap:
                              true, // GridView'in boyutunu sarmasını sağlar
                          physics:
                              const NeverScrollableScrollPhysics(), // Sayfanın kaydırmasını sağlar, GridView kendi kaymaz
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Her satırda 3 ürün
                            crossAxisSpacing: 8.0, // Ürünler arası yatay boşluk
                            mainAxisSpacing: 3.0, // Ürünler arası dikey boşluk
                            childAspectRatio:
                                0.86, // Kartların yüksekliğini ayarlamak için oran
                          ),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return _buildProductCard(
                              imgUrl: products[index]["imgUrl"]!,
                              title: products[index]["title"]!,
                              price: products[index]["price"]!,
                              discount: products[index]["discount"],
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(
                        height: 10), 
                          SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        'images/diger.png', width: 100,
                        height: 80, // PNG dosyanızın yolunu buraya yazın
                        fit: BoxFit.contain,
                      ),
                    ),// Ürünler ile çözümler arasında boşluk

                    // Şirketler ve çözümler bölümü
                    ...solutions.entries.map((entry) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${entry.key}:",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          _buildHorizontalCardList(entry.value),
                          const SizedBox(height: 24),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

          floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.circular(20), // Köşeleri yuvarlak yap
        child: Container(
          width: 70,
          height: 70,
          decoration: const BoxDecoration(
            
          ),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatScreen()));
            }, // Üzerinde gösterilecek resim
            backgroundColor: Colors.transparent,
            child: Image.asset('images/s.png', fit: BoxFit.cover, width: 110,height: 110,), // Arka plan rengini transparan yap
          ),
        ),
      ),
      bottomNavigationBar: SlidingClippedNavBar.colorful(
        backgroundColor: Colors.black,
        onButtonPressed: (index) {
          setState(() {
            selectedIndex = index;
          });
          pageController.animateToPage(selectedIndex,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutQuad);
        },
        iconSize: 30,
        selectedIndex: selectedIndex,
        barItems: [
          BarItem(
            icon: Icons.home_outlined,
            title: 'Anasayfa',
            activeColor: Colors.white,
            inactiveColor: Colors.white,
          ),
          BarItem(
            icon: Icons.newspaper_outlined,
            title: 'Haberler',
            activeColor: Colors.white,
            inactiveColor: Colors.white,
          ),
          BarItem(
            icon: Icons.search_rounded,
            title: 'Search',
            activeColor: Colors.white,
            inactiveColor: Colors.white,
          ),
          BarItem(
            icon: Icons.newspaper_outlined,
            title: 'Haberler',
            activeColor: Colors.white,
            inactiveColor: Colors.white,
          )
          // Eğer daha fazla BarItem eklemek isterseniz buraya ekleyin
        ],
      ),
    );
  }
}

class _SampleCard extends StatelessWidget {
  const _SampleCard({
    required this.cardName,
    required this.cardColor,
    required this.cardImage,
  });

  final String cardName;
  final String cardColor;
  final String cardImage;

  Color _getColorFromName(String colorName) {
    Map<String, Color> colorMap = {
      "red": const Color.fromARGB(255, 255, 133, 124),
      "green": Colors.green,
      "blue": const Color.fromARGB(255, 100, 180, 246),
      "amber": const Color.fromARGB(255, 255, 218, 106),
      "purple": const Color.fromARGB(255, 217, 104, 237),
      "teal": Colors.teal,
      "orange": Colors.orange,
      // İstediğiniz kadar renk ekleyebilirsiniz
    };
    return colorMap[colorName.toLowerCase()] ?? Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 160,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(cardImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              // Arka planı biraz karartmak için
              padding: const EdgeInsets.all(8),
              child: Text(
                cardName,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NewsCard extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String description;

  const NewsCard({super.key, 
    required this.imgUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Card(
        shadowColor: Colors.black,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.purple,
                koyuMavi,
              ],
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.network(imgUrl),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: AutoSizeText(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  minFontSize: 12,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetailPage(
                        imgUrl: imgUrl,
                        title: title,
                        description: description,
                      ),
                    ),
                  );
                },
                child: const Text('Read More', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewsDetailPage extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String description;

  const NewsDetailPage({super.key, 
    required this.imgUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    imgUrl,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewsGrid extends StatelessWidget {
  final List<Map<String, String>> newsData = [
    {
      "imgUrl": "https://via.placeholder.com/150",
      "title": "News Title 1",
      "description": "A short description for News 1",
    },
    {
      "imgUrl": "https://via.placeholder.com/150",
      "title": "News Title 2",
      "description": "A short description for News 2",
    },
    {
      "imgUrl": "https://via.placeholder.com/150",
      "title": "News Title 3",
      "description": "A short description for News 3",
    },
    {
      "imgUrl": "https://via.placeholder.com/150",
      "title": "News Title 4",
      "description": "A short description for News 4",
    },
    {
      "imgUrl": "https://via.placeholder.com/150",
      "title": "News Title 5",
      "description": "A short description for News 5",
    },
    {
      "imgUrl": "https://via.placeholder.com/150",
      "title": "News Title 6",
      "description": "A short description for News 6",
    },
  ];

   NewsGrid({super.key});

  @override
  Widget build(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
    return Scaffold(
      
      appBar: AppBar(
        title: const Text("News Grid"),
        centerTitle: true,
      ),
      body: Padding(

        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two cards per row
            childAspectRatio: 0.8, // Adjust the aspect ratio for card height
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
          itemCount: newsData.length,
          itemBuilder: (context, index) {
            return NewsCard(
              imgUrl: newsData[index]["imgUrl"]!,
              title: newsData[index]["title"]!,
              description: newsData[index]["description"]!,
            );
          },
        ),
      ),
    );
  }
}

Widget _buildCard(
    {required String imgUrl,
    required String title,
    required String subtitle,
    String? description}) {
  return Container(
    width: 250,
    margin: const EdgeInsets.only(right: 8),
    child: Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 3,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imgUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  width: 100,
                  height: 120,
                  color: Colors.grey[200],
                  child: const Center(child: CircularProgressIndicator()),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 100,
                  height: 120,
                  color: Colors.grey[200],
                  child: const Center(child: Icon(Icons.error)),
                );
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (description != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 12, color: Colors.black),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildHorizontalCardList(List<Map<String, String>> items) {
  return SizedBox(
    height: 150, // Kartın yüksekliği ile uyumlu olmalı
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _buildCard(
          imgUrl: items[index]["imgUrl"]!,
          title: items[index]["title"]!,
          subtitle: items[index]["subtitle"]!,
          description: items[index]["description"],
        );
      },
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
  width: 80, // Genişliği azalttık
  height: 120, // Yüksekliği azalttık
  margin: const EdgeInsets.symmetric(horizontal: 8),
  child: Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    elevation: 3,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[Colors.purple, Colors.blueAccent],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              imgUrl,
              width: double.infinity,
              height: 100, // Resim yüksekliği azaltıldı
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0), // Padding azaltıldı
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Title
                Text(
                  title,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white), // Yazı boyutu azaltıldı
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                // Discount and Price
                Row(
                  children: [
                    if (discount != null) ...[
                      Text(
                        discount,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(width: 4),
                    ],
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
          
                // "Fırsatı Gör" Button
                TextButton(
                  
                  onPressed: () {
                    // Ürün detayına yönlendirme işlemi yapılabilir.
                  },
                  child: const Text('Fırsatı Gör',
                      style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 10,)),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
);

}

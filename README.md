# Akıllı Şehir Uygulaması

Bu proje, İzmir Akıllı Şehir Hackathonu 2024 için geliştirilen bir Flutter uygulamasıdır. Uygulama, şehirdeki çeşitli hizmetleri ve bilgileri kullanıcılarla buluşturmayı amaçlamaktadır.

## Özellikler

- **Haberler:** Şehirdeki güncel haberleri ve etkinlikleri kullanıcılarla paylaşır.
- **Akıllı Çözümler:** Otopark yerleri, hava kirliliği, atık toplama, deniz temizliği gibi şehirde karşılaşılan sorunlara yönelik akıllı çözümler sunar.
- **Chatbot:** Kullanıcıların sorularını yanıtlayan ve onlara yardımcı olan bir chatbot içerir.
- **Ürünler ve Fırsatlar:** Şehirdeki çeşitli ürünler ve fırsatlar hakkında bilgi verir.

## Kurulum

Projeyi yerel ortamınızda çalıştırmak için aşağıdaki adımları izleyin:

1. **Depoyu klonlayın:**
    ```sh
    git clone https://github.com/kullanici-adi/akillisehir.git
    cd akillisehir
    ```

2. **Gerekli bağımlılıkları yükleyin:**
    ```sh
    flutter pub get
    ```

3. **Uygulamayı çalıştırın:**
    ```sh
    flutter run
    ```

## Kullanılan Teknolojiler

- **Flutter:** Uygulamanın temelini oluşturan mobil uygulama geliştirme çerçevesi.
- **HTTP:** API istekleri için kullanılır.
- **Font Awesome Flutter:** Uygulamada kullanılan ikonlar için.
- **Carousel Slider:** Ürün ve fırsatların gösterimi için.
- **Flutter TTS:** Chatbot'un sesli yanıt vermesi için.

## Dosya Yapısı

- **lib/**: Uygulamanın ana kaynak kodları.
  - **controllers/**: Uygulama kontrolörleri ve değişkenler.
  - **models/**: Renk ve diğer model tanımlamaları.
  - **views/**: Uygulama ekranları ve widget'ları.
    - **homeview/**: Ana ekran ve alt ekranlar.
    - **chatscreen/**: Chatbot ekranı ve ilgili dosyalar.
- **assets/**: Uygulamada kullanılan görseller ve diğer varlıklar.
- **android/**, **ios/**, **macos/**, **windows/**, **linux/**: Platforma özgü dosyalar ve ayarlar.

## Katkıda Bulunma

Katkıda bulunmak isterseniz, lütfen bir pull request gönderin veya bir sorun bildirin. Her türlü katkı ve geri bildirim memnuniyetle karşılanır.

## Lisans

Bu proje MIT Lisansı ile lisanslanmıştır. Daha fazla bilgi için [LICENSE](LICENSE) dosyasına bakın.

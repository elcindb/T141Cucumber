
@E2E
Feature: US1006 kullanici fake bilgilerle facebook'ta kayit olusturur

  Scenario: TC12 Kullanici fake bilgilerle facebook'da kayit olusturabilmeli

    Given kullanici "faceUrl" anasayfaya gider
    Then facebook cookies kabul eder
    And facebook'da yeni hesap olustur butonuna basar

Feature: US1010 liste olarak verilen gecersiz bilgilerle giris yapilamaz

  Scenario Outline: TC16 Yanlis bilgilerle giris yapilamamali

    Given kullanici "toUrl" anasayfaya gider
    Then account butonuna basar
    When email olarak "<verilenEmail>" girer
    And password olarak "<verilenPassword>" girer
    Then signIn butonuna basar
    And giris yapilamadigini test eder
    And 1 saniye bekler
    Then sayfayi kapatir

    Examples:
      |verilenEmail    	|verilenPassword    	|
      |toGecerliEmail  	|toGecersizPassword 	|
      |toGecersizEmail 	|toGecerliPassword  	|
      |toGecersizEmail 	|toGecersizPassword 	|
      |toGecersizEmail2	|toGecersizPassword2	|
      |toGecersizEmail3	|toGecersizPassword3	|

    And 1 saniye be

Feature: US1011 Direk verilen yanlis bilgilerle giris yapilamaz

  Scenario Outline: TC17 direk verilen gecersiz bilgilerle giris yapilamamali

    Given kullanici "toUrl" anasayfaya gider
    Then account butonuna basar
    When email olarak direk verilen "<verilenEmail>" girer
    And password olarak direk verilen "<verilenPassword>" girer
    And 3 saniye bekler
    Then signIn butonuna basar
    And giris yapilamadigini test eder
    And 1 saniye bekler
    #Then sayfayi kapatir

    Examples:
      |verilenEmail    	|verilenPassword    	|
      |murat@akar.com  	|76jrf6 	|
      |selcuk@gmail.com	|53535  	|
      |selin@wise.com 	|rdgdtds 	|
      |damra@gmail.com	|g56435 	|
      |bugra@gmail.com	|23456  	|
  kler
    When Faker class'indan bilgilerle facebook kayit formunu doldurur
    Then 2 saniye bekler
    And facebook kayit ol tusuna basar
    Then 8 saniye bekler
    And sayfayi kapatir
class NationalIdInfo {
  int year;
  int month;
  int day;
  String gender;
  String birthplace;
  String cardNumber;

  NationalIdInfo({
    required this.year,
    required this.month,
    required this.day,
    required this.gender,
    required this.birthplace,
    required this.cardNumber,
  });
 // national id consist from 14 digit
  // a b c d e f g h i j k l m n
  // a = century ... 1900:1999=> a=2 ... 2000:2099 => a=3
  // bc = year ... de = month ... fg = day
  // hi = birthplaceCode
  // jklm = gender % 2 ? female : male
  // n = check digit
//   30304051601509
  // 5 4 2003
  static NationalIdInfo parseInfo(String nationalId) {
    String birthYear = nationalId.substring(1, 3);// 03
    String birthMonth = nationalId.substring(3, 5); // 04
    String birthDay = nationalId.substring(5, 7);// 05
    String birthplaceCode = nationalId.substring(7, 9);// 16
    String genderDigit = nationalId.substring(12, 13);// 0
    String cardNumber = nationalId.substring(13);// 9
    int birthYearInt = int.parse(birthYear);
    int currentYear = DateTime.now().year;

    int prefix = (birthYearInt <= (currentYear % 100)) ? 20 : 19;
    int birthYearFull = int.parse("$prefix$birthYear");
    String gender = (int.parse(genderDigit) % 2 == 0) ? "Female" : "Male";
    String birthplace = getBirthplaceLocation(birthplaceCode);


    return NationalIdInfo(
      year: birthYearFull,
      month: int.parse(birthMonth),
      day: int.parse(birthDay),
      gender: gender,
      birthplace: birthplace,
      cardNumber: cardNumber,
    );
  }

  static String getBirthplaceLocation(String code) {
    Map<String, String> birthplaceMap = {
      '01': 'Cairo',
      '03': 'Alexandria',
      '03': 'Port Said',
      '04': 'Suez',
      '11': 'Damietta',
      '12': 'Dakahlia',
      '13': 'Sharqia',
      '14': 'Qalyubia',
      '15': 'Kafr El-Sheikh',
      '16': 'Gharbia',
      '17': 'Menoufia',
      '18': 'Beheira',
      '19': 'Ismailia',
      '21': 'Giza',
      '22': 'Beni Suef',
      '23': 'Fayoum',
      '24': 'Minya',
      '25': 'Assiut',
      '26': 'Sohag',
      '27': 'Qena',
      '28': 'Aswan',
      '29': 'Luxor',
      '31': 'Red Sea',
      '32': 'New Valley',
      '33': 'Matrouh',
      '34': 'North Sinai',
      '35': 'South Sinai',
      '88': 'Outside the Republic',
    };
    return birthplaceMap[code] ?? 'Unknown';
  }
}
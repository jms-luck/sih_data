import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi', 'ta'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
    String? taText = '',
  }) =>
      [enText, hiText, taText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // start
  {
    '0hur4vay': {
      'en': 'Farm',
      'hi': '',
      'ta': '',
    },
    'dxe8bvla': {
      'en': 'Assure',
      'hi': '',
      'ta': '',
    },
    'zkxvy0zq': {
      'en': 'Get Started',
      'hi': '',
      'ta': '',
    },
    'cb0pb9r9': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // home
  {
    's413ccrc': {
      'en': 'Farm',
      'hi': '',
      'ta': '',
    },
    'cwcwmrcz': {
      'en': 'Assure',
      'hi': '',
      'ta': '',
    },
    '1w727wge': {
      'en': 'Product Categories...',
      'hi': '',
      'ta': '',
    },
    '8nw2mcqn': {
      'en': 'Vegetables..',
      'hi': '',
      'ta': '',
    },
    'wrzz316n': {
      'en': 'Tomato(organic)',
      'hi': '',
      'ta': '',
    },
    'd2xaj7db': {
      'en': 'Mushroom',
      'hi': '',
      'ta': '',
    },
    '1gkkhh0w': {
      'en': 'Carrot',
      'hi': '',
      'ta': '',
    },
    '3x17m43y': {
      'en': 'Grains & Pulses...',
      'hi': '',
      'ta': '',
    },
    'a21094tc': {
      'en': 'Rice',
      'hi': '',
      'ta': '',
    },
    'wf0qcwh6': {
      'en': 'Wheat',
      'hi': '',
      'ta': '',
    },
    'lfxdynxz': {
      'en': 'Moong Dhal',
      'hi': '',
      'ta': '',
    },
    'gl7aps8u': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // OrderHistory
  {
    'i3p2nn9t': {
      'en': 'check.io',
      'hi': '',
      'ta': '',
    },
    '23qsw881': {
      'en': 'Platform Navigation',
      'hi': '',
      'ta': '',
    },
    'epcaim03': {
      'en': 'Dashboard',
      'hi': '',
      'ta': '',
    },
    '0zavcyby': {
      'en': 'Chats',
      'hi': '',
      'ta': '',
    },
    'xmwz0hqc': {
      'en': 'Projects',
      'hi': '',
      'ta': '',
    },
    'pdc2tz66': {
      'en': 'Recent Orders',
      'hi': '',
      'ta': '',
    },
    '4k4z2d8a': {
      'en': '12',
      'hi': '',
      'ta': '',
    },
    '045aznk8': {
      'en': 'Settings',
      'hi': '',
      'ta': '',
    },
    'y85bhvc2': {
      'en': 'Billing',
      'hi': '',
      'ta': '',
    },
    'iso2gzmu': {
      'en': 'Explore',
      'hi': '',
      'ta': '',
    },
    '46c7dkme': {
      'en': 'Light Mode',
      'hi': '',
      'ta': '',
    },
    'vcv9me5v': {
      'en': 'Dark Mode',
      'hi': '',
      'ta': '',
    },
    'v6o9sp3x': {
      'en': 'Andrew D.',
      'hi': '',
      'ta': '',
    },
    '96ykpory': {
      'en': 'admin@gmail.com',
      'hi': '',
      'ta': '',
    },
    '9lt09yzx': {
      'en': 'Below are your most recent orders',
      'hi': '',
      'ta': '',
    },
    'z0t9fg4a': {
      'en': 'Order Number',
      'hi': '',
      'ta': '',
    },
    'waowost2': {
      'en': 'Weight',
      'hi': '',
      'ta': '',
    },
    'w0ebmydz': {
      'en': 'Status',
      'hi': '',
      'ta': '',
    },
    'xsrjq6yf': {
      'en': 'Amount',
      'hi': '',
      'ta': '',
    },
    'em7w16ql': {
      'en': 'Order #: ',
      'hi': '',
      'ta': '',
    },
    'n3co0fra': {
      'en': '429242424',
      'hi': '',
      'ta': '',
    },
    'i4hy5c5f': {
      'en': 'quantity:2000kg',
      'hi': '',
      'ta': '',
    },
    'ewvgeju2': {
      'en': 'Mon. July 3rd',
      'hi': '',
      'ta': '',
    },
    'j5ml1yru': {
      'en': '2.5 lbs',
      'hi': '',
      'ta': '',
    },
    '2xysnk6s': {
      'en': 'Shipped',
      'hi': '',
      'ta': '',
    },
    '07amzpbw': {
      'en': '₹4000',
      'hi': '',
      'ta': '',
    },
    'qx50dvy9': {
      'en': 'Shipped',
      'hi': '',
      'ta': '',
    },
    'qr5kagkc': {
      'en': 'Order #: ',
      'hi': '',
      'ta': '',
    },
    'xciaibsg': {
      'en': '429242424',
      'hi': '',
      'ta': '',
    },
    '73opvmlr': {
      'en': 'Quantity:50000 kg',
      'hi': '',
      'ta': '',
    },
    '2zsidrsb': {
      'en': 'Mon. July 3rd',
      'hi': '',
      'ta': '',
    },
    'qm5m0psi': {
      'en': '2.5 lbs',
      'hi': '',
      'ta': '',
    },
    '95dbg1ee': {
      'en': 'Shipped',
      'hi': '',
      'ta': '',
    },
    '6brxsy4z': {
      'en': '₹5000',
      'hi': '',
      'ta': '',
    },
    'ahj1u4w2': {
      'en': 'Shipped',
      'hi': '',
      'ta': '',
    },
    'mwbk1mr6': {
      'en': 'Order #: ',
      'hi': '',
      'ta': '',
    },
    'it8e552x': {
      'en': '429242424',
      'hi': '',
      'ta': '',
    },
    'y630mm3w': {
      'en': 'Quantity:10000 kg',
      'hi': '',
      'ta': '',
    },
    'ssteswn0': {
      'en': 'Mon. July 3rd',
      'hi': '',
      'ta': '',
    },
    '8zuzpupp': {
      'en': '2.5 lbs',
      'hi': '',
      'ta': '',
    },
    'f9oxvryk': {
      'en': 'Accepted',
      'hi': '',
      'ta': '',
    },
    '9dtu4upc': {
      'en': '₹7000',
      'hi': '',
      'ta': '',
    },
    'yimru3qf': {
      'en': 'Accepted',
      'hi': '',
      'ta': '',
    },
    'ptisapy2': {
      'en': 'Order #: ',
      'hi': '',
      'ta': '',
    },
    'yxhavsoe': {
      'en': '429242424',
      'hi': '',
      'ta': '',
    },
    'n5541693': {
      'en': 'Quantity:45000Kg',
      'hi': '',
      'ta': '',
    },
    'yh7r9dnm': {
      'en': 'Mon. July 3rd',
      'hi': '',
      'ta': '',
    },
    '0rr0igl9': {
      'en': '2.5 lbs',
      'hi': '',
      'ta': '',
    },
    'ujuxatwh': {
      'en': 'Accepted',
      'hi': '',
      'ta': '',
    },
    '9gyj5l3s': {
      'en': '₹9000 ',
      'hi': '',
      'ta': '',
    },
    'hgurh9d1': {
      'en': 'Accepted',
      'hi': '',
      'ta': '',
    },
    'c39hxyth': {
      'en': 'Recent Orders',
      'hi': '',
      'ta': '',
    },
    'pdypjoaq': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // checkout
  {
    '7utcjh43': {
      'en': 'check out the item',
      'hi': '',
      'ta': '',
    },
    'hdon0gd6': {
      'en': 'No pest Tomato',
      'hi': '',
      'ta': '',
    },
    'uspeoghr': {
      'en': '₹40000',
      'hi': '',
      'ta': '',
    },
    'zjinxprp': {
      'en': 'Base Quanity: 100KG',
      'hi': '',
      'ta': '',
    },
    '29ydwggp': {
      'en': 'Price Breakdown',
      'hi': '',
      'ta': '',
    },
    'wpudli2d': {
      'en': 'Base Price',
      'hi': '',
      'ta': '',
    },
    'efppaozr': {
      'en': '₹5000',
      'hi': '',
      'ta': '',
    },
    'k563h4wp': {
      'en': 'Negotiated Price',
      'hi': '',
      'ta': '',
    },
    'mzmmodpg': {
      'en': '₹4250',
      'hi': '',
      'ta': '',
    },
    'cgqs814f': {
      'en': 'Total',
      'hi': '',
      'ta': '',
    },
    'pqi427wq': {
      'en': '₹4250',
      'hi': '',
      'ta': '',
    },
    '8h0druzh': {
      'en': 'Checkout (₹4250)\nPay now',
      'hi': '',
      'ta': '',
    },
    'cgdb5hde': {
      'en': 'cherry tomato',
      'hi': '',
      'ta': '',
    },
    'vviiuv56': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // trackorder
  {
    'p8xbqmu0': {
      'en': 'check.io',
      'hi': '',
      'ta': '',
    },
    '64detv65': {
      'en': 'Platform Navigation',
      'hi': '',
      'ta': '',
    },
    'czt4ozso': {
      'en': 'Dashboard',
      'hi': '',
      'ta': '',
    },
    't5uhm2b8': {
      'en': 'Chats',
      'hi': '',
      'ta': '',
    },
    'slclaqvr': {
      'en': 'All Tasks',
      'hi': '',
      'ta': '',
    },
    'sk47jadt': {
      'en': '12',
      'hi': '',
      'ta': '',
    },
    'efs6xbzs': {
      'en': 'Projects',
      'hi': '',
      'ta': '',
    },
    '3nqkdtjn': {
      'en': 'Settings',
      'hi': '',
      'ta': '',
    },
    'buzfjp7j': {
      'en': 'Billing',
      'hi': '',
      'ta': '',
    },
    '9agmrojw': {
      'en': 'Explore',
      'hi': '',
      'ta': '',
    },
    'jvknssu6': {
      'en': 'Light Mode',
      'hi': '',
      'ta': '',
    },
    'i755ktzj': {
      'en': 'Dark Mode',
      'hi': '',
      'ta': '',
    },
    'i6d23zcf': {
      'en': 'Andrew D.',
      'hi': '',
      'ta': '',
    },
    'adzij3ua': {
      'en': 'admin@gmail.com',
      'hi': '',
      'ta': '',
    },
    'jxd4b4xd': {
      'en': 'Team Activity',
      'hi': '',
      'ta': '',
    },
    'rk5bde9z': {
      'en': 'Track your order using Ref. No.',
      'hi': '',
      'ta': '',
    },
    'm7gqoxqs': {
      'en': 'Search all tasks...',
      'hi': '',
      'ta': '',
    },
    'xuokoz8o': {
      'en': 'Farmer',
      'hi': '',
      'ta': '',
    },
    'tpdap3k9': {
      'en': '18/09/24',
      'hi': '',
      'ta': '',
    },
    'ykhbx8h9': {
      'en': 'Started',
      'hi': '',
      'ta': '',
    },
    'oieasw77': {
      'en': 'shippment',
      'hi': '',
      'ta': '',
    },
    'o57e26ud': {
      'en': 'mr. Jai (farmer) has started shippmenting process',
      'hi': '',
      'ta': '',
    },
    '31gk5cwk': {
      'en': 'Logistics centre',
      'hi': '',
      'ta': '',
    },
    'c1aay2wr': {
      'en': '6hrs to go',
      'hi': '',
      'ta': '',
    },
    '9u69qq4y': {
      'en': 'Order received',
      'hi': '',
      'ta': '',
    },
    'b2mxftic': {
      'en': 'shippmenting process has started',
      'hi': '',
      'ta': '',
    },
    '2e1dqlhc': {
      'en': 'Driver id',
      'hi': '',
      'ta': '',
    },
    'mtsxkn2l': {
      'en': '3 hrs to go',
      'hi': '',
      'ta': '',
    },
    'sqlzyhte': {
      'en': 'Near outlet',
      'hi': '',
      'ta': '',
    },
    'kxwnzmgn': {
      'en': '4m ago',
      'hi': '',
      'ta': '',
    },
    'k4n0un3z': {
      'en': 'Product Delivered',
      'hi': '',
      'ta': '',
    },
    'kli85zvg': {
      'en': 'done',
      'hi': '',
      'ta': '',
    },
    'd3k4p5vf': {
      'en': 'Track Orders',
      'hi': '',
      'ta': '',
    },
    '7wuu29nt': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // list
  {
    'duwmyp2m': {
      'en': 'Our products is below',
      'hi': '',
      'ta': '',
    },
    'sf2wrktj': {
      'en': 'cherry tomato',
      'hi': '',
      'ta': '',
    },
    '6zxvfe8k': {
      'en': 'quantity:1000',
      'hi': '',
      'ta': '',
    },
    'usr7m26t': {
      'en': '₹80000',
      'hi': '',
      'ta': '',
    },
    'wdt4vrmk': {
      'en': 'bell tomato',
      'hi': '',
      'ta': '',
    },
    '3a7nv3af': {
      'en': 'Quantity:10000',
      'hi': '',
      'ta': '',
    },
    'o1txu1iw': {
      'en': '₹50000',
      'hi': '',
      'ta': '',
    },
    'd8nlwbub': {
      'en': 'bell tomato',
      'hi': '',
      'ta': '',
    },
    'rxrjyfq5': {
      'en': 'Quantity:10000',
      'hi': '',
      'ta': '',
    },
    'cuifdt8i': {
      'en': '₹50000',
      'hi': '',
      'ta': '',
    },
    'pn5zpzh5': {
      'en': 'cherry tomato',
      'hi': '',
      'ta': '',
    },
    '0f7tojrh': {
      'en': 'quantity:1000',
      'hi': '',
      'ta': '',
    },
    '07ybtng3': {
      'en': '₹80000',
      'hi': '',
      'ta': '',
    },
    'u132z92d': {
      'en': 'bell tomato',
      'hi': '',
      'ta': '',
    },
    '1y7hcbih': {
      'en': 'Quantity:10000',
      'hi': '',
      'ta': '',
    },
    'q0t826iy': {
      'en': '₹50000',
      'hi': '',
      'ta': '',
    },
    '3sp5ur9u': {
      'en': 'bell tomato',
      'hi': '',
      'ta': '',
    },
    'fwsiaxbb': {
      'en': 'Quantity:10000',
      'hi': '',
      'ta': '',
    },
    '43gnepye': {
      'en': '₹50000',
      'hi': '',
      'ta': '',
    },
    '076lgsa7': {
      'en': 'Products',
      'hi': '',
      'ta': '',
    },
    'sszayq8k': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // transcationsuccess
  {
    'ioe3ju7j': {
      'en': 'Transaction Success',
      'hi': '',
      'ta': '',
    },
    'j4lqq3ew': {
      'en': '₹1',
      'hi': '',
      'ta': '',
    },
    '0ui035xx': {
      'en': 'Quantity:1000 KG',
      'hi': '',
      'ta': '',
    },
    '8pq2la4x': {
      'en': 'Bank Address\n',
      'hi': '',
      'ta': '',
    },
    '857me1br': {
      'en': 'boys hostel, st. josephs college of ',
      'hi': '',
      'ta': '',
    },
    'z1pwq3yy': {
      'en': 'Bank Name: ',
      'hi': '',
      'ta': '',
    },
    'q69tqy35': {
      'en': 'Indian Bank',
      'hi': '',
      'ta': '',
    },
    'ezzf5i47': {
      'en': 'Account #: ',
      'hi': '',
      'ta': '',
    },
    'au8y2j3c': {
      'en': '6374014661',
      'hi': '',
      'ta': '',
    },
    'amsluqm8': {
      'en': 'Ref. No: ',
      'hi': '',
      'ta': '',
    },
    'ww277tht': {
      'en': '345345543453',
      'hi': '',
      'ta': '',
    },
    'op3f88jy': {
      'en': 'Recipient',
      'hi': '',
      'ta': '',
    },
    'a3bwda25': {
      'en': 'Jai Varun',
      'hi': '',
      'ta': '',
    },
    'e8qcfa6c': {
      'en': 'Track Your Order',
      'hi': '',
      'ta': '',
    },
    '9dttaary': {
      'en': 'Return Home',
      'hi': '',
      'ta': '',
    },
    'nd8pmt65': {
      'en': 'Receipt Details',
      'hi': '',
      'ta': '',
    },
    'p4eezucx': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // pricesupport
  {
    'dvgpwhr9': {
      'en': 'Welcome to support',
      'hi': '',
      'ta': '',
    },
    'uz3uc7ch': {
      'en': 'How can we help you?',
      'hi': '',
      'ta': '',
    },
    'uhzwc19v': {
      'en': 'VoiceCall ',
      'hi': '',
      'ta': '',
    },
    'wyjkeaab': {
      'en': 'RealTime Chat',
      'hi': '',
      'ta': '',
    },
    'oo4hsa6l': {
      'en': 'VideoCall',
      'hi': '',
      'ta': '',
    },
    'wg5tgwlh': {
      'en': 'Review FAQ\'s below',
      'hi': '',
      'ta': '',
    },
    '9n0scut8': {
      'en': 'How do I download Code?',
      'hi': '',
      'ta': '',
    },
    '63q1aw40': {
      'en':
          'Showcase a couple of eye-catching screenshots or mockups of your UI Kit to capture attention and give users a glimpse of what they can expect.',
      'hi': '',
      'ta': '',
    },
    '6c8m8eb2': {
      'en': 'How do I download Code?',
      'hi': '',
      'ta': '',
    },
    'lozqrcy1': {
      'en':
          'Showcase a couple of eye-catching screenshots or mockups of your UI Kit to capture attention and give users a glimpse of what they can expect.',
      'hi': '',
      'ta': '',
    },
    'tl3qt1rh': {
      'en': 'Negotiation Bot',
      'hi': '',
      'ta': '',
    },
    'epl6kh4b': {
      'en': 'Accept Price',
      'hi': '',
      'ta': '',
    },
    'j9p64gl2': {
      'en': 'Price Support',
      'hi': '',
      'ta': '',
    },
    'pudksxul': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // productdetail
  {
    '8e26p3tw': {
      'en': 'Base price',
      'hi': '',
      'ta': '',
    },
    'ww2zc0qv': {
      'en': '₹20000',
      'hi': '',
      'ta': '',
    },
    'rl2w8laa': {
      'en': '/100 kg',
      'hi': '',
      'ta': '',
    },
    'mzlfaq93': {
      'en': '5.0',
      'hi': '',
      'ta': '',
    },
    'evm5vxaz': {
      'en': 'Organic tomato with no pest',
      'hi': '',
      'ta': '',
    },
    'f0upwpdl': {
      'en':
          'These vine-ripened tomatoes are handpicked at the peak of freshness, offering a burst of flavor with every bite. Perfect for salads, sauces, sandwiches, and more, our tomatoes are naturally grown without harmful pesticides, ensuring you get the best quality. Their vibrant red color and firm texture make them an ideal choice for any kitchen. Each tomato is packed with essential nutrients like Vitamin C, potassium, and antioxidants.\n\nAvailable in different sizes and quantities, get your fresh tomatoes today and elevate your meals with natural goodness!',
      'hi': '',
      'ta': '',
    },
    'jvnbasky': {
      'en': 'Farmer detail',
      'hi': '',
      'ta': '',
    },
    'b4mlntkm': {
      'en': 'jai varun',
      'hi': '',
      'ta': '',
    },
    'vumk6tuv': {
      'en': '4 yrs exp',
      'hi': '',
      'ta': '',
    },
    '58a82bx5': {
      'en': 'FarmerId: 63740',
      'hi': '',
      'ta': '',
    },
    'skvwrkkz': {
      'en': '5.0',
      'hi': '',
      'ta': '',
    },
    'e794qmmd': {
      'en': 'Price Support',
      'hi': '',
      'ta': '',
    },
    'ddrvyjkv': {
      'en': 'Details',
      'hi': '',
      'ta': '',
    },
    '9tdllmcp': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // gateway1
  {
    'm0ymmm7q': {
      'en': 'Page Title',
      'hi': '',
      'ta': '',
    },
    'f816iwvg': {
      'en': 'Select Payment Mode',
      'hi': '',
      'ta': '',
    },
    'id0etdeh': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // gateway2
  {
    'jj4sn2ge': {
      'en': 'Page Title',
      'hi': '',
      'ta': '',
    },
    'btzvhjbw': {
      'en': 'Pay Now',
      'hi': '',
      'ta': '',
    },
    'rbpbj1xt': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // gateway3
  {
    'fqb41waf': {
      'en': 'Page Title',
      'hi': '',
      'ta': '',
    },
    '4p03ufow': {
      'en': 'Redirecting.......',
      'hi': '',
      'ta': '',
    },
    'n0q9ghwt': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // settings
  {
    '09mqzo43': {
      'en': 'Settings Page',
      'hi': '',
      'ta': '',
    },
    'b7g0gnmh': {
      'en': 'Please evaluate your options below.',
      'hi': '',
      'ta': '',
    },
    'itdi4eti': {
      'en': 'My profile',
      'hi': '',
      'ta': '',
    },
    'ezls1ux5': {
      'en': 'View Orders',
      'hi': '',
      'ta': '',
    },
    'x2w4u5my': {
      'en': 'Terms & Conditions',
      'hi': '',
      'ta': '',
    },
    'fsishkbu': {
      'en': 'App Versions',
      'hi': '',
      'ta': '',
    },
    '22dguopk': {
      'en': 'v0.0.1',
      'hi': '',
      'ta': '',
    },
    'oxo0cr81': {
      'en': 'Log Out',
      'hi': '',
      'ta': '',
    },
    '08x2xr94': {
      'en': 'Back',
      'hi': '',
      'ta': '',
    },
    '835shwhm': {
      'en': 'Page Title',
      'hi': '',
      'ta': '',
    },
    'wnl4zu5k': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // gateway2Copy
  {
    'ua3xrwoe': {
      'en': 'Page Title',
      'hi': '',
      'ta': '',
    },
    'kk84sb12': {
      'en': 'Redirecting.......',
      'hi': '',
      'ta': '',
    },
    'fz3gow5p': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // Contract
  {
    'oqlnaywo': {
      'en': 'Digital Signature',
      'hi': '',
      'ta': '',
    },
    '834lzq4w': {
      'en': 'proceed',
      'hi': '',
      'ta': '',
    },
    'yqcifgza': {
      'en': 'Cuztomize contract',
      'hi': '',
      'ta': '',
    },
    'wlwdqeau': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // terms
  {
    'kxcgkt1w': {
      'en':
          'Welcome to Farm Assurance App, a platform designed to connect farmers and vendors directly with buyers for the purchase of fresh produce and goods. By accessing or using the App, you agree to be bound by the following terms and conditions (\"Terms\"). Please read them carefully.\n\n1. Acceptance of Terms\n\nBy using the App, you agree to comply with and be bound by these Terms and all applicable laws and regulations. If you do not agree to these Terms, please do not use the App.\n\n2. Use of the App\n\nEligibility: You must be at least 18 years old or have the consent of a parent or guardian to use the App.\nAccount Registration: To access certain features, you may need to create an account. You agree to provide accurate, current, and complete information during registration and to update such information to keep it accurate, current, and complete.\nAccount Security: You are responsible for safeguarding your account and all activities that occur under your account. Notify us immediately of any unauthorized use of your account.\n3. User Responsibilities\n\nVendors: Must ensure that all products listed are compliant with local health and safety regulations. Vendors are responsible for fulfilling orders as described in their listings.\nBuyers: Are responsible for providing accurate information and ensuring they are purchasing products that meet their needs. Buyers should communicate directly with vendors regarding any questions or concerns about products.\n4. Transactions\n\nDirect Transactions: All transactions occur directly between the buyer and vendor. The App does not mediate transactions or handle payment processing.\nPayment: The App is not responsible for any financial transactions between users. Vendors and buyers must handle payments through their chosen methods.\nDisputes: Any disputes arising from transactions should be resolved directly between the buyer and vendor. The App is not liable for any disputes or issues that arise.\n5. Content\n\nUser Content: You retain ownership of any content you post on the App. By posting content, you grant us a non-exclusive, royalty-free, worldwide license to use, display, and distribute such content.\nProhibited Content: You agree not to post content that is illegal, harmful, or infringes on the rights of others.\n6. Termination\n\nTermination by Us: We reserve the right to terminate or suspend your account if you violate these Terms or for any other reason at our sole discretion.\nTermination by You: You may terminate your account at any time by contacting us.\n7. Limitation of Liability\n\nNo Warranty: The App is provided on an \"as is\" and \"as available\" basis. We make no warranties, express or implied, regarding the App’s operation or content.\nLimitation: In no event shall we be liable for any indirect, incidental, special, or consequential damages arising from your use of the App.\n8. Indemnification\n\nYou agree to indemnify and hold harmless Your Company , its affiliates, and their respective officers, directors, employees, and agents from any claims, liabilities, damages, losses, and expenses arising out of or in any way connected to your use of the App or any violation of these Terms.\n\n9. Changes to Terms\n\nWe reserve the right to modify these Terms at any time. Any changes will be effective when posted on the App. Your continued use of the App following the posting of changes constitutes your acceptance of such changes.\n\n10. Governing Law\n\nThese Terms shall be governed by and construed in accordance with the laws of India, without regard to its conflict of law principles.\n\n11. Contact Us\n\nIf you have any questions about these Terms, please contact us at FarmAssurance@gmai.com.',
      'hi': '',
      'ta': '',
    },
    '6kpzyixl': {
      'en': 'On selecting agree to terms & conditions',
      'hi': '',
      'ta': '',
    },
    'z691scu3': {
      'en': 'Continue',
      'hi': '',
      'ta': '',
    },
    '1gfjg0o5': {
      'en': 'Terms & Conditions',
      'hi': '',
      'ta': '',
    },
    'd3313seu': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // FArmerprofile
  {
    'arh62hqg': {
      'en': 'Our Farmer',
      'hi': '',
      'ta': '',
    },
    '0tdbrcbt': {
      'en': 'Jai Varun ',
      'hi': '',
      'ta': '',
    },
    'n8q4ad76': {
      'en': 'Season Stat Highlights',
      'hi': '',
      'ta': '',
    },
    'dyr9zzjd': {
      'en': 'Bio',
      'hi': '',
      'ta': '',
    },
    'hzjz8g0f': {
      'en':
          'Jai Varun is an experienced farmer from Tamil Nadu with over 15 years of expertise in sustainable agriculture, specializing in organic farming and modern techniques to improve crop yields. He cultivates a variety of crops, including rice, maize, and pulses, while incorporating innovative irrigation systems and eco-friendly pest management. Jai is passionate about empowering small-scale farmers by educating them on the latest farming technologies and facilitating market access through digital platforms, helping them secure fair prices for their produce. His dedication to sustainable farming has made him a respected leader in his community.',
      'hi': '',
      'ta': '',
    },
    'g4k2qkiw': {
      'en': 'Recent Ratings',
      'hi': '',
      'ta': '',
    },
    '3ffjvr3j': {
      'en': '9.5',
      'hi': '',
      'ta': '',
    },
    'pqfa0muy': {
      'en': 'AUG',
      'hi': '',
      'ta': '',
    },
    'gynjwdh0': {
      'en': '3.0',
      'hi': '',
      'ta': '',
    },
    'wgsddwl8': {
      'en': 'MAR',
      'hi': '',
      'ta': '',
    },
    '8jj4re1q': {
      'en': '5.3',
      'hi': '',
      'ta': '',
    },
    '2tzxv7sg': {
      'en': 'JAN',
      'hi': '',
      'ta': '',
    },
    'ahzouqer': {
      'en': 'Farmer Details',
      'hi': '',
      'ta': '',
    },
    'chbkdm52': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // ForgotPassword
  {
    'juv36jb6': {
      'en': 'Back',
      'hi': '',
      'ta': '',
    },
    'ht9n7hhj': {
      'en': 'Forgot Password',
      'hi': '',
      'ta': '',
    },
    'd60dcyus': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'hi': '',
      'ta': '',
    },
    'hy4fde0e': {
      'en': 'Your email address...',
      'hi': '',
      'ta': '',
    },
    '474x400n': {
      'en': 'Enter your email...',
      'hi': '',
      'ta': '',
    },
    'wridbpyg': {
      'en': 'Send Link',
      'hi': '',
      'ta': '',
    },
    'iwx0zs54': {
      'en': 'Back',
      'hi': '',
      'ta': '',
    },
    '6ggohinb': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // flipcards
  {
    'untoabnb': {
      'en': 'Customized Contract Farming ',
      'hi': '',
      'ta': '',
    },
    'hgtyboqw': {
      'en': 'New App With Cool Features',
      'hi': '',
      'ta': '',
    },
    'aaixboax': {
      'en': 'Awesome Features',
      'hi': '',
      'ta': '',
    },
    'csn4h73f': {
      'en': 'Organic product Selling app',
      'hi': '',
      'ta': '',
    },
    'cyzcz3m0': {
      'en': 'Customized Contract FArming',
      'hi': '',
      'ta': '',
    },
    'ii5150bf': {
      'en': 'Next',
      'hi': '',
      'ta': '',
    },
    'g25j9nzr': {
      'en': 'Terms & Conditions',
      'hi': '',
      'ta': '',
    },
    'a29jc6mh': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // verification
  {
    'kim3qguk': {
      'en': 'Upload Required Documents',
      'hi': '',
      'ta': '',
    },
    'khu1ibr0': {
      'en': 'To continue Further Process',
      'hi': '',
      'ta': '',
    },
    '1rjiskp5': {
      'en': 'send verify mail ',
      'hi': '',
      'ta': '',
    },
    'yhnoq2ck': {
      'en': 'Verify Documents',
      'hi': '',
      'ta': '',
    },
    'vvnf06q5': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // Cuztomize
  {
    'dwpf76z9': {
      'en': 'Full name*',
      'hi': '',
      'ta': '',
    },
    'g37efbvz': {
      'en': 'Age*',
      'hi': '',
      'ta': '',
    },
    'yx7lldbo': {
      'en': 'Phone number',
      'hi': '',
      'ta': '',
    },
    '4ca6vfr8': {
      'en': 'Date of birth*',
      'hi': '',
      'ta': '',
    },
    '5fibsdwx': {
      'en': 'Insurance Provider 1',
      'hi': '',
      'ta': '',
    },
    'mrnjiyer': {
      'en': 'Insurance Provider 2',
      'hi': '',
      'ta': '',
    },
    'c3qah1rj': {
      'en': 'Insurance Provider 3',
      'hi': '',
      'ta': '',
    },
    '7lcxk6pc': {
      'en': 'Select one...',
      'hi': '',
      'ta': '',
    },
    'tyee13wp': {
      'en': 'Search for an item...',
      'hi': '',
      'ta': '',
    },
    'glqxf3bt': {
      'en': 'Gender',
      'hi': '',
      'ta': '',
    },
    '5fqseze6': {
      'en': 'Female',
      'hi': '',
      'ta': '',
    },
    'lh8cfdy7': {
      'en': 'Male',
      'hi': '',
      'ta': '',
    },
    'bybym6cj': {
      'en': 'Other',
      'hi': '',
      'ta': '',
    },
    '8vgplzky': {
      'en': 'Please describe your symptoms...',
      'hi': '',
      'ta': '',
    },
    'skizwyc8': {
      'en': 'Submit Form',
      'hi': '',
      'ta': '',
    },
    'x06zao38': {
      'en': 'Please enter the patients full name.',
      'hi': '',
      'ta': '',
    },
    'r5vjzoho': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'ta': '',
    },
    '870rbk0a': {
      'en': 'Please enter an age for the patient.',
      'hi': '',
      'ta': '',
    },
    'rq0ojw1v': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'ta': '',
    },
    'rs98xqix': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'ta': '',
    },
    'i9g2obmy': {
      'en': 'Please enter the date of birth of the patient.',
      'hi': '',
      'ta': '',
    },
    'ijfjusgr': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'ta': '',
    },
    'ctbdof9a': {
      'en': 'Field is required',
      'hi': '',
      'ta': '',
    },
    'zxovm90c': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'ta': '',
    },
    '562t70z4': {
      'en': 'Contract Customization',
      'hi': '',
      'ta': '',
    },
    'kd19bz9o': {
      'en': 'Please fill out the form below to continue.',
      'hi': '',
      'ta': '',
    },
    '57xr0x6r': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // login
  {
    '0g8ba95t': {
      'en': 'FARM ASSURE',
      'hi': '',
      'ta': '',
    },
    'f37ycus1': {
      'en': 'Create Account',
      'hi': '',
      'ta': '',
    },
    'j4yrj6v5': {
      'en': 'Create Account',
      'hi': '',
      'ta': '',
    },
    '5gqphqu3': {
      'en': 'Let\'s get started by filling out the form below.',
      'hi': '',
      'ta': '',
    },
    '2yam5d1v': {
      'en': 'Name',
      'hi': '',
      'ta': '',
    },
    'vdnpg00g': {
      'en': 'farmer',
      'hi': '',
      'ta': '',
    },
    '09bct43s': {
      'en': 'retailers',
      'hi': '',
      'ta': '',
    },
    'mi6f3nvk': {
      'en': 'Exporters',
      'hi': '',
      'ta': '',
    },
    '9idx8204': {
      'en': 'restaurents',
      'hi': '',
      'ta': '',
    },
    '23o92j5j': {
      'en': 'user type',
      'hi': '',
      'ta': '',
    },
    'qn2up3vx': {
      'en': 'Search...',
      'hi': '',
      'ta': '',
    },
    '9avxf6bb': {
      'en': 'Phone number',
      'hi': '',
      'ta': '',
    },
    '03kevmer': {
      'en': 'Aadhar Number',
      'hi': '',
      'ta': '',
    },
    'nu4i93fr': {
      'en': 'Email',
      'hi': '',
      'ta': '',
    },
    'tzneula2': {
      'en': 'Create Password',
      'hi': '',
      'ta': '',
    },
    'n3wzzsgd': {
      'en': 'Confirm Password',
      'hi': '',
      'ta': '',
    },
    '5a011y39': {
      'en': 'Get Started',
      'hi': '',
      'ta': '',
    },
    'j0ogbgs8': {
      'en': 'Or sign up with',
      'hi': '',
      'ta': '',
    },
    'qjpqwjml': {
      'en': 'Continue with Google',
      'hi': '',
      'ta': '',
    },
    '2rn1kfoz': {
      'en': 'Continue with Apple',
      'hi': '',
      'ta': '',
    },
    '8riy9hhs': {
      'en': 'Log In',
      'hi': '',
      'ta': '',
    },
    '09gh8mqy': {
      'en': 'Welcome Back',
      'hi': '',
      'ta': '',
    },
    '5dcv5iap': {
      'en': 'Fill out the information below in order to access your account.',
      'hi': '',
      'ta': '',
    },
    '92m4i5yt': {
      'en': 'Email',
      'hi': '',
      'ta': '',
    },
    'cl2v2ymg': {
      'en': 'Password',
      'hi': '',
      'ta': '',
    },
    'lvapy2px': {
      'en': 'Sign In',
      'hi': '',
      'ta': '',
    },
    'sobn4x6m': {
      'en': 'Or sign in with',
      'hi': '',
      'ta': '',
    },
    '7punpiwx': {
      'en': 'Continue with Google',
      'hi': '',
      'ta': '',
    },
    'lwwovt6h': {
      'en': 'Continue with Apple',
      'hi': '',
      'ta': '',
    },
    '8qmerlxo': {
      'en': 'Forgot Password?',
      'hi': '',
      'ta': '',
    },
    'jost161x': {
      'en': 'Page Title',
      'hi': '',
      'ta': '',
    },
    'th85kj1u': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // farmereprofilesssss
  {
    'xkjzj5a7': {
      'en': 'Profile',
      'hi': '',
      'ta': '',
    },
    'lznsdeq7': {
      'en': 'Welcome to profile',
      'hi': '',
      'ta': '',
    },
    'o76w8lvf': {
      'en': 'Submit to verify',
      'hi': '',
      'ta': '',
    },
    'zx7zbkmq': {
      'en': 'Phone Number',
      'hi': '',
      'ta': '',
    },
    'mkp73ije': {
      'en': 'Verify',
      'hi': '',
      'ta': '',
    },
    'whbchro7': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // termssetting
  {
    'qno7r9i1': {
      'en':
          'Welcome to Farm Assurance App, a platform designed to connect farmers and vendors directly with buyers for the purchase of fresh produce and goods. By accessing or using the App, you agree to be bound by the following terms and conditions (\"Terms\"). Please read them carefully.\n\n1. Acceptance of Terms\n\nBy using the App, you agree to comply with and be bound by these Terms and all applicable laws and regulations. If you do not agree to these Terms, please do not use the App.\n\n2. Use of the App\n\nEligibility: You must be at least 18 years old or have the consent of a parent or guardian to use the App.\nAccount Registration: To access certain features, you may need to create an account. You agree to provide accurate, current, and complete information during registration and to update such information to keep it accurate, current, and complete.\nAccount Security: You are responsible for safeguarding your account and all activities that occur under your account. Notify us immediately of any unauthorized use of your account.\n3. User Responsibilities\n\nVendors: Must ensure that all products listed are compliant with local health and safety regulations. Vendors are responsible for fulfilling orders as described in their listings.\nBuyers: Are responsible for providing accurate information and ensuring they are purchasing products that meet their needs. Buyers should communicate directly with vendors regarding any questions or concerns about products.\n4. Transactions\n\nDirect Transactions: All transactions occur directly between the buyer and vendor. The App does not mediate transactions or handle payment processing.\nPayment: The App is not responsible for any financial transactions between users. Vendors and buyers must handle payments through their chosen methods.\nDisputes: Any disputes arising from transactions should be resolved directly between the buyer and vendor. The App is not liable for any disputes or issues that arise.\n5. Content\n\nUser Content: You retain ownership of any content you post on the App. By posting content, you grant us a non-exclusive, royalty-free, worldwide license to use, display, and distribute such content.\nProhibited Content: You agree not to post content that is illegal, harmful, or infringes on the rights of others.\n6. Termination\n\nTermination by Us: We reserve the right to terminate or suspend your account if you violate these Terms or for any other reason at our sole discretion.\nTermination by You: You may terminate your account at any time by contacting us.\n7. Limitation of Liability\n\nNo Warranty: The App is provided on an \"as is\" and \"as available\" basis. We make no warranties, express or implied, regarding the App’s operation or content.\nLimitation: In no event shall we be liable for any indirect, incidental, special, or consequential damages arising from your use of the App.\n8. Indemnification\n\nYou agree to indemnify and hold harmless Your Company , its affiliates, and their respective officers, directors, employees, and agents from any claims, liabilities, damages, losses, and expenses arising out of or in any way connected to your use of the App or any violation of these Terms.\n\n9. Changes to Terms\n\nWe reserve the right to modify these Terms at any time. Any changes will be effective when posted on the App. Your continued use of the App following the posting of changes constitutes your acceptance of such changes.\n\n10. Governing Law\n\nThese Terms shall be governed by and construed in accordance with the laws of India, without regard to its conflict of law principles.\n\n11. Contact Us\n\nIf you have any questions about these Terms, please contact us at FarmAssurance@gmai.com.',
      'hi': '',
      'ta': '',
    },
    'ebyl4fdg': {
      'en': 'Terms & Conditions',
      'hi': '',
      'ta': '',
    },
    'z75cygty': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // Miscellaneous
  {
    '11db7uns': {
      'en': 'ALLOC TO ACCESS CAMERA',
      'hi': '',
      'ta': '',
    },
    '7qoraep0': {
      'en': 'ALLOW ACCESS TO MEDIA',
      'hi': '',
      'ta': '',
    },
    'v5af103g': {
      'en': 'ALLOW TO ACESS LOCATION',
      'hi': '',
      'ta': '',
    },
    'm09tcceh': {
      'en': 'ALLOW TO SEND NOTIFICATION',
      'hi': '',
      'ta': '',
    },
    'z3mqnxjv': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'w8s6edlt': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'f5t3ows5': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'inejw59r': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'kdgxyooq': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'j0krv2t7': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'iflevtqk': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'uyjnwcxo': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'heqhw8v8': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'iaye1my1': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    '75d5kczg': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'k9wboo53': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    '1rn86por': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'ccbmutza': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'wsobj870': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'o50ug1ak': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'l6xmivis': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'c8fsbf80': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'v83suuji': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'tfixymnt': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    '3z4l00mw': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'anh78a13': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    '3vsst6a4': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    '24wvkuua': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'ihpsm1jf': {
      'en': '',
      'hi': '',
      'ta': '',
    },
  },
].reduce((a, b) => a..addAll(b));

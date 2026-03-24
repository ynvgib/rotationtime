import 'package:finallyicanlearn/zb/data/zb_listdb.dart';
import 'package:finallyicanlearn/zb/data/zb_classes.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

abstract class ZBStory {
  static List<Color> get zbColors =>
      ZBStory.zbfrequencies.map((f) => f.zbcolor).toList();

  static List<ZBFrequency> get zbfrequencies => const [
        ZBFrequency(
            zbstate: 0,
            zbcoin: '0',
            zbcoinimg: 'zbempty.png',
            zbcolor: Colors.transparent,
            zbopacity: 0.0,
            zbanimal: '',
            zbanimalimg: '',
            zbanimaldualimg: ''),
        ZBFrequency(
            zbstate: 1,
            zbcoin: 'idkm',
            zbcoinimg: 'zb1256fr.png',
            zbcolor: Colors.black,
            zbopacity: 0.1,
            zbanimal: 'pussycat',
            zbanimalimg: 'zblackcat.png',
            zbanimaldualimg: 'zblackcat2.png'),
        ZBFrequency(
            zbstate: 2,
            zbcoin: 'silence',
            zbcoinimg: 'silence.png',
            zbcolor: Colors.red,
            zbopacity: 0.2,
            zbanimal: 'bitch',
            zbanimalimg: 'zbredog.png',
            zbanimaldualimg: 'zbredog2.png'),
        ZBFrequency(
            zbstate: 3,
            zbcoin: 'Breath',
            zbcoinimg: 'breath.png',
            zbcolor: Colors.yellow,
            zbopacity: 0.3,
            zbanimal: 'octopussy',
            zbanimalimg: 'zbyellowoctopussy.png',
            zbanimaldualimg: 'zbyellowoctopussy2.png'),
        ZBFrequency(
            zbstate: 4,
            zbcoin: 'Simple',
            zbcoinimg: 'simple.png',
            zbcolor: Colors.green,
            zbopacity: 0.4,
            zbanimal: 'octopus',
            zbanimalimg: 'zbgreenoctopus.png',
            zbanimaldualimg: 'zbgreenoctopus2.png'),
        ZBFrequency(
            zbstate: 5,
            zbcoin: 'COMPLEX',
            zbcoinimg: 'complex.png',
            zbcolor: Colors.blue,
            zbopacity: 0.5,
            zbanimal: 'DOG',
            zbanimalimg: 'zbluedog.png',
            zbanimaldualimg: 'zbluedog2.png'),
        ZBFrequency(
            zbstate: 6,
            zbcoin: 'WHITE CAMEL',
            zbcoinimg: 'zwcb.png',
            zbcolor: Colors.white,
            zbopacity: 0.6,
            zbanimal: 'Camel',
            zbanimalimg: 'zbwhitecamel.png',
            zbanimaldualimg: 'zbwhitecamel2.png'),
      ];

  static ZBFrequency getfrequency(int state) {
    return zbfrequencies.firstWhere(
      (f) => f.zbstate == state,
      orElse: () => zbfrequencies[0], // Fallback to state 0 (Transparent)
    );
  }
}

abstract class ZBData {
  static String getcounterforwallet(int walletId) {
    return counterMap.entries
        .firstWhere(
          (e) => e.value.wallets.contains(walletId),
          orElse: () => MapEntry(
              'unknown', ZBCounter(name: 'unknown', id: 0, wallets: [])),
        )
        .key;
  }

  /// The Main POC wallet for the Mandala and UI
  static final List<int> walletstatelist = List.filled(65, 0, growable: false);

  static Map<String, ZBCounter> counterMap = {
    'head': ZBCounter(
      id: 9,
      name: 'head',
      hebname: 'ראש',
      hdname: 'Head Center',
      wallets: [64, 61, 63],
    ),
    'ajna': ZBCounter(
      id: 8,
      name: 'ajna',
      hebname: 'אג-נה',
      hdname: 'Ajna Center',
      wallets: [47, 24, 4, 17, 11, 43],
    ),
    'throat': ZBCounter(
      id: 7,
      name: 'throat',
      hebname: 'גרון',
      hdname: 'Throat Center',
      wallets: [62, 23, 56, 35, 12, 45, 33, 8, 31, 20, 16],
    ),
    'self': ZBCounter(
      id: 6,
      name: 'self',
      hebname: 'עצמי',
      hdname: 'G Center',
      wallets: [7, 1, 13, 25, 15, 46, 2, 10],
    ),
    'heart': ZBCounter(
      id: 5,
      name: 'heart',
      hebname: 'לב',
      hdname: 'Heart Center',
      wallets: [21, 40, 26, 51],
    ),
    'spleen': ZBCounter(
      id: 4,
      name: 'spleen',
      hebname: 'טחול',
      hdname: 'Spleen Center',
      wallets: [48, 57, 44, 50, 32, 28, 18],
    ),
    'sacral': ZBCounter(
      id: 3,
      name: 'sacral',
      hdname: 'Sacral Center',
      wallets: [5, 14, 29, 59, 9, 3, 42, 27, 34],
    ),
    'solar': ZBCounter(
      id: 2,
      name: 'solar',
      hebname: 'מקלעת שמש',
      hdname: 'Solar Plexus',
      wallets: [36, 22, 37, 6, 49, 55, 30],
    ),
    'root': ZBCounter(
      id: 1,
      name: 'root',
      hebname: 'שורש',
      hdname: 'Root Center',
      wallets: [53, 60, 52, 19, 38, 39, 41, 58, 54],
    ),
  };

  // The Silence (Red/Generated) Gates
  static List<int> get silencewallets => getzbwallets
      .where((w) => w.zbcoin == 'silence')
      .map((w) => w.wallet)
      .toList();

  static List<int> get breathwallets => getzbwallets
      .where((w) => w.zbcoin == 'Breath')
      .map((w) => w.wallet)
      .toList();

  static List<int> get complexwallets => getzbwallets
      .where((w) => w.zbcoin == 'COMPLEX')
      .map((w) => w.wallet)
      .toList();

// zb planets

  static List<ZBPlanet> get getzbplanets => const [
        // --- FOUNDATION (IDs 1-4) ---
        ZBPlanet(
          id: 1,
          name: 'Sun',
          color: Colors.blue,
          asset: 'assets/planets/sun.png',
          orbit: '1 Year',
          role: 'Foundation',
          keynote: 'The Life Force. Personality expression and vitality.',
          keynoteHeb: 'כוח החיים. ביטוי האישיות והחיוניות.',
        ),
        ZBPlanet(
          id: 2,
          name: 'Earth',
          color: Colors.red,
          asset: 'assets/planets/earth.png',
          orbit: '1 Year',
          role: 'Foundation',
          keynote: 'Grounding. Physical form and balance on the plane.',
          keynoteHeb: 'קרקוע. הצורה הפיזית ואיזון.',
        ),
        ZBPlanet(
          id: 3,
          name: 'North Node',
          color: Colors.green,
          asset: 'assets/planets/northnode.png',
          orbit: '18.6 Years',
          role: 'Direction',
          keynote: 'The Future. Direction and the environment you move toward.',
          keynoteHeb: 'העתיד. הכיוון והסביבה אליה נעים.',
        ),
        ZBPlanet(
          id: 4,
          name: 'South Node',
          color: Colors.yellow,
          asset: 'assets/planets/southnode.png',
          orbit: '18.6 Years',
          role: 'Direction',
          keynote: 'The Past. Foundations and what you are leaving behind.',
          keynoteHeb: 'העבר. יסודות ומה שמשאירים מאחור.',
        ),

        // --- SIMPLE (IDs 5-8: Green / Days) ---
        ZBPlanet(
          id: 5,
          name: 'Moon',
          color: Colors.green,
          asset: 'assets/planets/moon.png',
          orbit: '27.3 Days',
          role: 'Simple',
          keynote: 'The Driver. Emotional pressure and what moves you.',
          keynoteHeb: 'הנהג. לחץ רגשי ומה שמניע אותך.',
        ),
        ZBPlanet(
          id: 6,
          name: 'Mercury',
          color: Colors.green,
          asset: 'assets/planets/mercury.png',
          orbit: '88 Days',
          role: 'Simple',
          keynote: 'Communication. Conceptualizing and expressing truth.',
          keynoteHeb: 'תקשורת. המשגה וביטוי האמת.',
        ),
        ZBPlanet(
          id: 7,
          name: 'Venus',
          color: Colors.green,
          asset: 'assets/planets/venus.png',
          orbit: '225 Days',
          role: 'Simple',
          keynote: 'Values. Internal law, aesthetics, and beauty.',
          keynoteHeb: 'ערכים. חוק פנימי, אסתטיקה ויופי.',
        ),
        ZBPlanet(
          id: 8,
          name: 'Mars',
          color: Colors.green,
          asset: 'assets/planets/mars.png',
          orbit: '687 Days',
          role: 'Simple',
          keynote: 'Vitality. Raw energy and execution.',
          keynoteHeb: 'חיוניות. אנרגיה גולמית וביצוע.',
        ),

        // --- BREATH (IDs 9-11: Yellow / Years) ---
        ZBPlanet(
          id: 9,
          name: 'Jupiter',
          color: Colors.yellow,
          asset: 'assets/planets/jupiter.png',
          orbit: '11.86 Years',
          role: 'Breath',
          keynote: 'Expansion. Personal law and protection.',
          keynoteHeb: 'התפשטות. חוק אישי והגנה.',
        ),
        ZBPlanet(
          id: 10,
          name: 'Saturn',
          color: Colors.yellow,
          asset: 'assets/planets/saturn.png',
          orbit: '29.5 Years',
          role: 'Breath',
          keynote: 'Discipline. Constraints and maturity.',
          keynoteHeb: 'משמעת. מגבלות ובגרות.',
        ),
        ZBPlanet(
          id: 11,
          name: 'Uranus',
          color: Colors.yellow,
          asset: 'assets/planets/uranus.png',
          orbit: '84 Years',
          role: 'Breath',
          keynote: 'Innovation. The unusual and sudden shifts.',
          keynoteHeb: 'חדשנות. הבלתי רגיל ושינויים פתאומיים.',
        ),

        // --- SILENCE (IDs 12-13: Red / Long-Orbit Years) ---
        ZBPlanet(
          id: 12,
          name: 'Neptune',
          color: Colors.red,
          asset: 'assets/planets/neptune.png',
          orbit: '165 Years',
          role: 'Silence',
          keynote: 'Mysticism. Spirituality and dissolving of ego.',
          keynoteHeb: 'מיסטיקה. רוחניות והתמוססות האגו.',
        ),
        ZBPlanet(
          id: 13,
          name: 'Pluto',
          color: Colors.red,
          asset: 'assets/planets/pluto.png',
          orbit: '248 Years',
          role: 'Silence',
          keynote: 'Transformation. Deep truth and rebirth.',
          keynoteHeb: 'טרנספורמציה. אמת עמוקה ולידה מחדש.',
        ),

        // --- CHIRON (ID 14: Yellow / Bridge) ---
        ZBPlanet(
          id: 14,
          name: 'Chiron',
          color: Colors.white,
          asset: 'assets/planets/chiron.png',
          orbit: '50 Years',
          role: 'Breath',
          keynote: 'The Bridge. Healing and integration.',
          keynoteHeb: 'הגשר. ריפוי ואינטגרציה.',
        ),
      ];

// zb transactions

  static List<ZBTransaction> get getzbtransactions => [
        // --- COMPLEX (State 5 - Blue) ---
        ZBTransaction(
            count: 1,
            id: '36.35',
            zbstate: 5,
            zbcoin: 'COMPLEX',
            color: Colors.blue,
            name: 'Transitoriness',
            hebname: 'ארעיות',
            zbhebname: 'מורכב התחלף',
            zbheblongname: 'הן רכבו על ברת החלוף',
            description: 'jack of all trades'),
        ZBTransaction(
            count: 2,
            id: '22.12',
            zbstate: 5,
            zbcoin: 'COMPLEX',
            color: Colors.blue,
            name: 'Openness',
            hebname: 'פתיחות',
            zbhebname: 'מורכב פותח',
            zbheblongname: 'זה מרכיב את הפתיחות',
            description: 'Being Social'),
        ZBTransaction(
            count: 3,
            id: '21.45',
            zbstate: 5,
            zbcoin: 'COMPLEX',
            color: Colors.blue,
            name: 'Money Line',
            hebname: 'קו הכסף',
            zbhebname: 'מורכב חומר',
            zbheblongname: 'מורכב משמות עצם',
            description: 'Materialist'),

        // --- BREATH (State 3 - Yellow) ---
        ZBTransaction(
            count: 4,
            id: '1.8',
            zbstate: 3,
            zbcoin: 'breath',
            color: Colors.yellow,
            name: 'Inspiration',
            hebname: 'השראה',
            zbhebname: 'נשימה מכוונת',
            zbheblongname: 'אני נושמת את ההשראה',
            description: 'creative role model'),
        ZBTransaction(
            count: 5,
            id: '4.63',
            zbstate: 3,
            zbcoin: 'breath',
            color: Colors.yellow,
            name: 'Logic',
            hebname: 'לוגיקה',
            zbhebname: 'נשימות תהגה',
            zbheblongname: 'הם ינשמו את ההגיון',
            description: 'mental ease mixed with doubt'),
        ZBTransaction(
            count: 6,
            id: '7.31',
            zbstate: 3,
            zbcoin: 'breath',
            color: Colors.yellow,
            name: 'Alpha',
            hebname: 'אלפא',
            zbhebname: 'נשימות תדריכנה',
            zbheblongname: 'אנחנו ננשים את בראשית',
            description: 'leadership for "good or bad"'),
        ZBTransaction(
            count: 7,
            id: '10.20',
            zbstate: 3,
            zbcoin: 'breath',
            color: Colors.yellow,
            name: 'Awakening',
            hebname: 'התעוררות',
            zbhebname: 'הנשימה מתעוררת',
            zbheblongname: 'אני נושם בהתעוררות',
            description: 'Commitment to higher principles'),
        ZBTransaction(
            count: 8,
            id: '57.10',
            zbstate: 3,
            zbcoin: 'breath',
            color: Colors.yellow,
            name: 'Perfected Form',
            hebname: 'צורה מושלמת',
            zbhebname: 'הנשימה שורדת',
            zbheblongname: 'אני נושמת בצורה שלמה',
            description: 'survival awareness'),
        ZBTransaction(
            count: 9,
            id: '11.56',
            zbstate: 3,
            zbcoin: 'breath',
            color: Colors.yellow,
            name: 'Curiosity',
            hebname: 'סקרנות',
            zbhebname: 'נשימות הסתקרנו',
            zbheblongname: 'הם נשמו בסקרנות',
            description: 'searcher'),
        ZBTransaction(
            count: 10,
            id: '13.33',
            zbstate: 3,
            zbcoin: 'breath',
            color: Colors.yellow,
            name: 'Prodigal',
            hebname: 'הבן האובד',
            zbhebname: 'נשימות העידו',
            zbheblongname: 'נשמנו את העדויות',
            description: 'witness'),
        ZBTransaction(
            count: 11,
            id: '48.16',
            zbstate: 3,
            zbcoin: 'breath',
            color: Colors.yellow,
            name: 'Wavelength',
            hebname: 'אורך גל',
            zbhebname: 'נשימות תשכללנה',
            zbheblongname: 'הם ינשמו את הכשרונות',
            description: 'design of talent'),
        ZBTransaction(
            count: 12,
            id: '17.62',
            zbstate: 3,
            zbcoin: 'breath',
            color: Colors.yellow,
            name: 'Acceptance',
            hebname: 'קבלה',
            zbhebname: 'נשימות תבינה',
            zbheblongname: 'הם ינשמו את קבלת השפה',
            description: 'organizational being'),
        ZBTransaction(
            count: 13,
            id: '18.58',
            zbstate: 3,
            zbcoin: 'breath',
            color: Colors.yellow,
            name: 'Judgment',
            hebname: 'שיפוטיות',
            zbhebname: 'נשימות תשפוטנה',
            zbheblongname: 'הם ינשמו את השיפוט',
            description: 'insatiability'),
        ZBTransaction(
            count: 14,
            id: '49.19',
            zbstate: 3,
            zbcoin: 'breath',
            color: Colors.yellow,
            name: 'Synthesis',
            hebname: 'סינתזה',
            zbhebname: 'נשימות משולבות',
            zbheblongname: 'נשימות ימניות תחתונות',
            description: 'sensitivity'),
        ZBTransaction(
            count: 15,
            id: '57.20',
            zbstate: 3,
            zbcoin: 'breath',
            color: Colors.yellow,
            name: 'Brainwave',
            hebname: 'גל מוח',
            zbhebname: 'נשימה נרגעת',
            zbheblongname: 'זה נושם בבהירות מיידית',
            description: 'penetrating awareness'),
        ZBTransaction(
            count: 16,
            id: '43.23',
            zbstate: 3,
            zbcoin: 'breath',
            color: Colors.yellow,
            name: 'Structuring',
            hebname: 'מבניות',
            zbhebname: 'נשימה יודעת',
            zbheblongname: 'זה נושם את המבנה',
            description: 'Genius to Freak'),
        ZBTransaction(
            count: 17,
            id: '24.61',
            zbstate: 3,
            zbcoin: 'breath',
            color: Colors.yellow,
            name: 'Awareness',
            hebname: 'מודעות',
            zbhebname: 'נשימה מודעת',
            zbheblongname: 'זה נושם את המודעות',
            description: 'Thinker'),
        ZBTransaction(
            count: 18,
            id: '51.25',
            zbstate: 3,
            zbcoin: 'breath',
            color: Colors.yellow,
            name: 'Initiation',
            hebname: 'חניכה',
            zbhebname: 'נשימה חונכת',
            zbheblongname: 'אני נושמת את החניכה',
            description: 'needing to be first'),
        ZBTransaction(
            count: 19,
            id: '44.26',
            zbstate: 3,
            zbcoin: 'breath',
            color: Colors.yellow,
            name: 'Surrender',
            hebname: 'כניעה',
            zbhebname: 'נשימה מקיימת',
            zbheblongname: 'נשימה שמאלית עליונה',
            description: 'entrepreneur'),
        ZBTransaction(
            count: 20,
            id: '28.38',
            zbstate: 3,
            zbcoin: 'breath',
            color: Colors.yellow,
            name: 'Struggle',
            hebname: 'מאבק',
            zbhebname: 'נשימה נאבקת',
            zbheblongname: 'זה נושם את המאבק',
            description: 'stubbornness'),
        ZBTransaction(
            count: 21,
            id: '30.41',
            zbstate: 3,
            zbcoin: 'breath',
            color: Colors.yellow,
            name: 'Recognition',
            hebname: 'זיהוי',
            zbhebname: 'נשימות הורגשו',
            zbheblongname: 'הן נשמו את ההכרה',
            description: 'focused energy'),
        ZBTransaction(
            count: 22,
            id: '32.54',
            zbstate: 3,
            zbcoin: 'breath',
            color: Colors.yellow,
            name: 'Transformation',
            hebname: 'טרנספורמציה',
            zbhebname: 'נשימה קיימת',
            zbheblongname: 'נשימה שמאלית תחתונה',
            description: 'ambition'),
        ZBTransaction(
            count: 23,
            id: '37.40',
            zbstate: 3,
            zbcoin: 'breath',
            color: Colors.yellow,
            name: 'Community',
            hebname: 'קהילה',
            zbhebname: 'נשימות קהילתיות',
            zbheblongname: 'נשימות ימניות עליונות',
            description: 'part seeking a whole'),
        ZBTransaction(
            count: 24,
            id: '55.39',
            zbstate: 3,
            zbcoin: 'breath',
            color: Colors.yellow,
            name: 'Emoting',
            hebname: 'רגשנות',
            zbhebname: 'נשימות רוחניות',
            zbheblongname: 'זו נושמת מצב רוח',
            description: 'moodiness'),
        ZBTransaction(
            count: 25,
            id: '47.64',
            zbstate: 3,
            zbcoin: 'breath',
            color: Colors.yellow,
            name: 'Confusion',
            hebname: 'בלבול',
            zbhebname: 'נשימות התפשטו',
            zbheblongname: 'הם נשמו את המופשט',
            description: 'mental activity'),

        // --- SILENCE (State 2 - Red) ---
        ZBTransaction(
            count: 26,
            id: '14.2',
            zbstate: 2,
            zbcoin: 'silence',
            color: Colors.red,
            name: 'The Beat',
            hebname: 'הקצב',
            zbhebname: 'שתיקה פועמת',
            zbheblongname: 'אני שותקת בפעימה',
            description: 'keeper of keys'),
        ZBTransaction(
            count: 27,
            id: '3.60',
            zbstate: 2,
            zbcoin: 'silence',
            color: Colors.red,
            name: 'Mutation',
            hebname: 'מוטציה',
            zbhebname: 'שתיקה משונה',
            zbheblongname: 'זו משתיקה את המוטציה',
            description: 'energy that fluctuates'),
        ZBTransaction(
            count: 28,
            id: '5.15',
            zbstate: 2,
            zbcoin: 'silence',
            color: Colors.red,
            name: 'Rhythm',
            hebname: 'ריתמיקה',
            zbhebname: 'שתיקות תזרומנה',
            zbheblongname: 'אנחנו נשתוק בקצב',
            description: 'being in the flow'),
        ZBTransaction(
            count: 29,
            id: '6.59',
            zbstate: 2,
            zbcoin: 'silence',
            color: Colors.red,
            name: 'Mating',
            hebname: 'זיווג',
            zbhebname: 'שתיקות פוריות',
            zbheblongname: 'שתיקות ימניות',
            description: 'intimacy and reproduction'),
        ZBTransaction(
            count: 30,
            id: '9.52',
            zbstate: 2,
            zbcoin: 'silence',
            color: Colors.red,
            name: 'Concentration',
            hebname: 'ריכוז',
            zbhebname: 'שתיקות תתרכזנה',
            zbheblongname: 'הן תשתוקנה בריכוז',
            description: 'focus and determination'),
        ZBTransaction(
            count: 31,
            id: '34.10',
            zbstate: 2,
            zbcoin: 'silence',
            color: Colors.red,
            name: 'Exploration',
            hebname: 'חקר',
            zbhebname: 'שתיקה אוהבת',
            zbheblongname: 'אני שותקת באהבה',
            description: 'following convictions'),
        ZBTransaction(
            count: 32,
            id: '34.20',
            zbstate: 2,
            zbcoin: 'silence',
            color: Colors.red,
            name: 'Charisma',
            hebname: 'כריזמה',
            zbhebname: 'השתיקה נעה',
            zbheblongname: 'להשתיק את התנועה',
            description: 'thoughts become deeds'),
        ZBTransaction(
            count: 33,
            id: '27.50',
            zbstate: 2,
            zbcoin: 'silence',
            color: Colors.red,
            name: 'Preservation',
            hebname: 'שימור',
            zbhebname: 'שתיקה שמורה',
            zbheblongname: 'שתיקה שמאלית',
            description: 'custodianship'),
        ZBTransaction(
            count: 34,
            id: '29.46',
            zbstate: 2,
            zbcoin: 'silence',
            color: Colors.red,
            name: 'Discovery',
            hebname: 'גילוי',
            zbhebname: 'שתיקות התגלו',
            zbheblongname: 'אנחנו שתקנו את הגילוי',
            description: 'succeeding where others fail'),
        ZBTransaction(
            count: 35,
            id: '34.57',
            zbstate: 2,
            zbcoin: 'silence',
            color: Colors.red,
            name: 'Power',
            hebname: 'עוצמה',
            zbhebname: 'השתיקה בריאה',
            zbheblongname: 'להשתיק את הכוח',
            description: 'archetype power'),
        ZBTransaction(
            count: 36,
            id: '42.53',
            zbstate: 2,
            zbcoin: 'silence',
            color: Colors.red,
            name: 'Maturation',
            hebname: 'התבגרות',
            zbhebname: 'שתיקות הבשילו',
            zbheblongname: 'הן שתקו בהתבגרות',
            description: 'balanced development'),
      ];

  static List<int> walletsByZBState(int zbstate) {
    return getzbtransactions
        .where((tx) => tx.zbstate == zbstate)
        .expand((tx) {
          // Split '22.12' into [22, 12]
          final parts = tx.id.split('.');
          final main = int.tryParse(parts[0]) ?? 0;
          final sub = parts.length > 1 ? (int.tryParse(parts[1]) ?? 0) : 0;

          return [main, sub];
        })
        .where((id) => id > 0) // Remove any 0s from failed parses
        .toSet()
        .toList();
  }

  // zb error add all wallets field

  static List<ZBWallet> get getzbwallets => [
        ZBWallet(
            wallet: 1,
            hdname: 'Self Expression',
            hdnameheb: 'ביטוי עצמי',
            hex: 'The Creative',
            adjective: 'Creative',
            subject: 'Creativity',
            verb: 'Creates',
            adverb: 'Creatively'),
        ZBWallet(
            wallet: 2,
            hdname: 'Direction of the Self',
            hdnameheb: 'כיוון עצמי',
            hex: 'Memory',
            adjective: 'Responsive',
            subject: 'Response',
            verb: 'Responds',
            adverb: 'Responsively'),
        ZBWallet(
            wallet: 3,
            hdname: 'Ordering',
            hdnameheb: 'סידור',
            hex: 'Fiery',
            adjective: 'Different',
            subject: 'Mutation',
            verb: 'Mutates',
            adverb: 'Differently'),
        ZBWallet(
            wallet: 4,
            hdname: 'Formulization',
            hdnameheb: 'ניסוח',
            hex: 'Begin',
            adjective: 'Chaotic',
            subject: 'Answer',
            verb: 'will Answer',
            adverb: 'Chaotically'),
        ZBWallet(
            wallet: 5,
            hdname: 'Fixed Patterns',
            hdnameheb: 'תבנית קבועה',
            hex: 'Waiting',
            adjective: 'Patient',
            subject: 'Patience',
            verb: 'will Wait',
            adverb: 'Patiently'),
        ZBWallet(
            wallet: 6,
            hdname: 'Friction',
            hdnameheb: 'חיכוך',
            hex: 'Revolutionary',
            adjective: 'Conflicting',
            subject: 'Conflict',
            verb: 'Conflicts',
            adverb: 'Conflictingly'),
        ZBWallet(
            wallet: 7,
            hdname: 'Role of the Self',
            hdnameheb: 'תפקיד מפגש עצמי',
            hex: 'Revolutionary',
            adjective: 'Interactive',
            subject: 'Interaction',
            verb: 'will Interact',
            adverb: 'Interactively'),
        ZBWallet(
            wallet: 8,
            hdname: 'Contribution',
            hdnameheb: 'תרומה',
            hex: 'Progressive',
            adjective: 'Contributing',
            subject: 'Contribution',
            verb: 'Contributes',
            adverb: 'Uniquely'),
        ZBWallet(
            wallet: 9,
            hdname: 'Focus',
            hdnameheb: 'מיקוד',
            hex: 'Focus',
            adjective: 'Focused',
            subject: 'Focus',
            verb: 'will Focus',
            adverb: 'Focusingly'),
        ZBWallet(
            wallet: 10,
            hdname: 'Behavior of the Self',
            hdnameheb: 'התנהגות עצמית',
            hex: 'Selfish',
            adjective: 'Selfing',
            subject: 'Self',
            verb: 'Selfs',
            adverb: 'Selfingly',
            isIntegration: true),
        ZBWallet(
            wallet: 11,
            hdname: 'Ideas',
            hdnameheb: 'רעיונות',
            hex: 'Ideally',
            adjective: 'Ideal',
            subject: 'Idea',
            verb: 'Idead',
            adverb: 'Ideally'),
        ZBWallet(
            wallet: 12,
            hdname: 'Caution',
            hdnameheb: 'זהירות',
            hex: 'Cautious',
            adjective: 'Cautious',
            subject: 'Caution',
            verb: 'Cautions',
            adverb: 'Cautiously'),
        ZBWallet(
            wallet: 13,
            hdname: 'the Listener',
            hdnameheb: 'המאזין',
            hex: 'Opinions',
            adjective: 'Secret',
            subject: 'Secret',
            verb: 'Hid',
            adverb: 'Secretly'),
        ZBWallet(
            wallet: 14,
            hdname: 'Power Skills',
            hdnameheb: 'כוח מיומן',
            hex: 'Mutative',
            adjective: 'Wealthy',
            subject: 'Wealth',
            verb: 'Enriches',
            adverb: 'Wealthfully'),
        ZBWallet(
            wallet: 15,
            hdname: 'Extremes',
            hdnameheb: 'קיצוניות',
            hex: 'Fantasy',
            adjective: 'Extreme',
            subject: 'Extreme',
            verb: 'will Extreme',
            adverb: 'Extremely'),
        ZBWallet(
            wallet: 16,
            hdname: 'Skills',
            hdnameheb: 'מיומנויות',
            hex: 'Family',
            adjective: 'Skillful',
            subject: 'Skill',
            verb: 'will Identify',
            adverb: 'Skillfully'),
        ZBWallet(
            wallet: 17,
            hdname: 'Opinion',
            hdnameheb: 'דעות',
            hex: 'Correcting',
            adjective: 'Hierarchical',
            subject: 'Hierarchy',
            verb: 'will Organize',
            adverb: 'Hierarchically'),
        ZBWallet(
            wallet: 18,
            hdname: 'Correction',
            hdnameheb: 'תיקון',
            hex: 'Wind',
            adjective: 'Corrective',
            subject: 'Correction',
            verb: 'will Correct',
            adverb: 'Correctly'),
        ZBWallet(
            wallet: 19,
            hdname: 'Wanting',
            hdnameheb: 'צורך',
            hex: 'Skillful',
            adjective: 'Needful',
            subject: 'Need',
            verb: 'Needs',
            adverb: 'Needfully'),
        ZBWallet(
            wallet: 20,
            hdname: 'Now',
            hdnameheb: 'הווה',
            hex: 'Crisis',
            adjective: 'Attentive',
            subject: 'Attention',
            verb: 'Attends',
            adverb: 'Attentively',
            isIntegration: true),
        ZBWallet(
            wallet: 21,
            hdname: 'Hunter(ess)',
            hdnameheb: 'צייד',
            hex: 'Control',
            adjective: 'Controlled',
            subject: 'Control',
            verb: 'Controls',
            adverb: 'Controllably'),
        ZBWallet(
            wallet: 22,
            hdname: 'Openness',
            hdnameheb: 'פתיחות',
            hex: 'Grace',
            adjective: 'Graceful',
            subject: 'Grace',
            verb: 'Graces',
            adverb: 'Gracefully'),
        ZBWallet(
            wallet: 23,
            hdname: 'Assimilation',
            hdnameheb: 'הטמעה',
            hex: 'Powerful',
            adjective: 'Assimilated',
            subject: 'Assimilation',
            verb: 'Assimilates',
            adverb: 'Assimilably'),
        ZBWallet(
            wallet: 24,
            hdname: 'Rationalization',
            hdnameheb: 'רציונל',
            hex: 'Continuity',
            adjective: 'Rationalised',
            subject: 'Rationalisation',
            verb: 'Rationalises',
            adverb: 'Rationally'),
        ZBWallet(
            wallet: 25,
            hdname: 'Spirit of the Self',
            hdnameheb: 'רוח עצמאית',
            hex: 'Innocence',
            adjective: 'Innocent',
            subject: 'Innocence',
            verb: 'Innocences',
            adverb: 'Innocently'),
        ZBWallet(
            wallet: 26,
            hdname: 'the Egoist',
            hdnameheb: 'אגואיסט',
            hex: 'Logic',
            adjective: 'Tricky',
            subject: 'Trickster',
            verb: 'Tricks',
            adverb: 'Trickily'),
        ZBWallet(
            wallet: 27,
            hdname: 'Caring',
            hdnameheb: 'אכפתיות',
            hex: 'Leading',
            adjective: 'Caring',
            subject: 'Care',
            verb: 'Cares',
            adverb: 'Carefully'),
        ZBWallet(
            wallet: 28,
            hdname: 'the Game Player',
            hdnameheb: 'מהמר',
            hex: 'Mysterious',
            adjective: 'Risky',
            subject: 'Risk',
            verb: 'Risks',
            adverb: 'Riskily'),
        ZBWallet(
            wallet: 29,
            hdname: 'Perseverance',
            hdnameheb: 'התמדה',
            hex: 'Valued',
            adjective: 'Persevered',
            subject: 'Perseverance',
            verb: 'Persevered',
            adverb: 'Perseveringly'),
        ZBWallet(
            wallet: 30,
            hdname: 'Feelings',
            hdnameheb: 'הרגשות',
            hex: 'Needy',
            adjective: 'Fiery',
            subject: 'Fire',
            verb: 'Fired',
            adverb: 'Fiercely'),
        ZBWallet(
            wallet: 31,
            hdname: 'Influence',
            hdnameheb: 'השפעה',
            hex: 'Oppressed',
            adjective: 'Leading',
            subject: 'Lead',
            verb: 'will Lead',
            adverb: 'Leadingly'),
        ZBWallet(
            wallet: 32,
            hdname: 'Continuity',
            hdnameheb: 'המשכיות',
            hex: 'Detailed',
            adjective: 'Failing',
            subject: 'Failure',
            verb: 'Fails',
            adverb: 'Failingly'),
        ZBWallet(
            wallet: 33,
            hdname: 'Privacy',
            hdnameheb: 'פרטיות',
            hex: 'Deep',
            adjective: 'Remembered',
            subject: 'Memory',
            verb: 'Remembered',
            adverb: 'Privately'),
        ZBWallet(
            wallet: 34,
            hdname: 'Power',
            hdnameheb: 'כוח',
            hex: 'Logic',
            adjective: 'Powerful',
            subject: 'Power',
            verb: 'Powers',
            adverb: 'Powerfully',
            isIntegration: true),
        ZBWallet(
            wallet: 35,
            hdname: 'Change',
            hdnameheb: 'שינוי',
            hex: 'Fighter',
            adjective: 'Progressive',
            subject: 'Change',
            verb: 'Changed',
            adverb: 'Progressively'),
        ZBWallet(
            wallet: 36,
            hdname: 'Crisis',
            hdnameheb: 'משבר',
            hex: 'Return',
            adjective: 'Endarkened',
            subject: 'Feeling',
            verb: 'Felt',
            adverb: 'Fully'),
        ZBWallet(
            wallet: 37,
            hdname: 'Friendship',
            hdnameheb: 'חברות',
            hex: 'Control',
            adjective: 'Friendful',
            subject: 'Friend',
            verb: 'Befriends',
            adverb: 'Friendly'),
        ZBWallet(
            wallet: 38,
            hdname: 'the Fighter',
            hdnameheb: 'הלוחם',
            hex: 'Ideally',
            adjective: 'Fighting',
            subject: 'Fighter',
            verb: 'Fights',
            adverb: 'Oppositely'),
        ZBWallet(
            wallet: 39,
            hdname: 'Provocation',
            hdnameheb: 'התגרות',
            hex: 'Knowing',
            adjective: 'Provocative',
            subject: 'Provocation',
            verb: 'Provokes',
            adverb: 'Provocatively'),
        ZBWallet(
            wallet: 40,
            hdname: 'Aloneness',
            hdnameheb: 'לבדות',
            hex: 'Ambitious',
            adjective: 'Loyal',
            subject: 'Worker',
            verb: 'Works',
            adverb: 'Loyally'),
        ZBWallet(
            wallet: 41,
            hdname: 'Contraction',
            hdnameheb: 'כיווץ',
            hex: 'Extreme',
            adjective: 'Fanciful',
            subject: 'Fantasy',
            verb: 'Fantasised',
            adverb: 'Fancifully'),
        ZBWallet(
            wallet: 42,
            hdname: 'Growth',
            hdnameheb: 'צמיחה',
            hex: 'Watery',
            adjective: 'Ending',
            subject: 'End',
            verb: 'Ended',
            adverb: 'Happily Ever After'),
        ZBWallet(
            wallet: 43,
            hdname: 'Insight',
            hdnameheb: 'תובנה',
            hex: 'Responsive',
            adjective: 'Insightful',
            subject: 'Insight',
            verb: 'Insights',
            adverb: 'Insightfully'),
        ZBWallet(
            wallet: 44,
            hdname: 'Alertness',
            hdnameheb: 'דריכות',
            hex: 'Doubtful',
            adjective: 'Alertful',
            subject: 'Alert',
            verb: 'Alerts',
            adverb: 'Alertly'),
        ZBWallet(
            wallet: 45,
            hdname: 'the Gatherer',
            hdnameheb: 'האוצר',
            hex: 'Provocation',
            adjective: 'Bossy',
            subject: 'Boss',
            verb: 'Bosses',
            adverb: 'Boastfully'),
        ZBWallet(
            wallet: 46,
            hdname: 'Determination of Self',
            hdnameheb: 'נחישות עצמית',
            hex: 'Sexual',
            adjective: 'Determined',
            subject: 'Determination',
            verb: 'Determined',
            adverb: 'Determinately'),
        ZBWallet(
            wallet: 47,
            hdname: 'Realization',
            hdnameheb: 'התממשות',
            hex: 'Spirit',
            adjective: 'Oppressed',
            subject: 'Oppression',
            verb: 'Oppressed',
            adverb: 'Oppressively'),
        ZBWallet(
            wallet: 48,
            hdname: 'Depth',
            hdnameheb: 'עומק',
            hex: 'Constrained',
            adjective: 'Deep',
            subject: 'Depth',
            verb: 'will Deepen',
            adverb: 'Deeply'),
        ZBWallet(
            wallet: 49,
            hdname: 'Principles',
            hdnameheb: 'עקרונות',
            hex: 'Correcting',
            adjective: 'Revolutionary',
            subject: 'Revolution',
            verb: 'Revolutionizes',
            adverb: 'Revolutionarily'),
        ZBWallet(
            wallet: 50,
            hdname: 'Values',
            hdnameheb: 'ערכים',
            hex: 'Detailed',
            adjective: 'Valuable',
            subject: 'Value',
            verb: 'Values',
            adverb: 'Valuably'),
        ZBWallet(
            wallet: 51,
            hdname: 'Shock',
            hdnameheb: 'זעזוע',
            hex: 'Player',
            adjective: 'Shocking',
            subject: 'Shock',
            verb: 'Shocks',
            adverb: 'Shockingly'),
        ZBWallet(
            wallet: 52,
            hdname: 'Stillness',
            hdnameheb: 'דממה',
            hex: 'End',
            adjective: 'Mounted',
            subject: 'Mountain',
            verb: 'will Mount',
            adverb: 'Mountfully'),
        ZBWallet(
            wallet: 53,
            hdname: 'Beginnings',
            hdnameheb: 'התחלות',
            hex: 'Spotted',
            adjective: 'First',
            subject: 'Beginning',
            verb: 'Began',
            adverb: 'At the Beginning'),
        ZBWallet(
            wallet: 54,
            hdname: 'Drive',
            hdnameheb: 'דחף',
            hex: 'Cautious',
            adjective: 'Ambitious',
            subject: 'Ambition',
            verb: 'Drives',
            adverb: 'Ambitiously'),
        ZBWallet(
            wallet: 55,
            hdname: 'Spirit',
            hdnameheb: 'נפש',
            hex: 'Now',
            adjective: 'Spirited',
            subject: 'Spirit',
            verb: 'Spirits',
            adverb: 'Spiritually'),
        ZBWallet(
            wallet: 56,
            hdname: 'Stimulation',
            hdnameheb: 'גירוי',
            hex: 'Determined',
            adjective: 'Believed',
            subject: 'Believer',
            verb: 'Believed',
            adverb: 'Wonderingly'),
        ZBWallet(
            wallet: 57,
            hdname: 'Intuitive Clarity',
            hdnameheb: 'בהירות ברגע',
            hex: 'Joyous',
            adjective: 'Gentle',
            subject: 'GentleWind',
            verb: 'Blows',
            adverb: 'Gently',
            isIntegration: true),
        ZBWallet(
            wallet: 58,
            hdname: 'Vitality',
            hdnameheb: 'חיוניות',
            hex: 'Selfish',
            adjective: 'Joyous',
            subject: 'Joy',
            verb: 'will Enjoy',
            adverb: 'Joyously'),
        ZBWallet(
            wallet: 59,
            hdname: 'Sexuality',
            hdnameheb: 'מיניות',
            hex: 'Shocking',
            adjective: 'Sexual',
            subject: 'Sexuality',
            verb: 'Disperses',
            adverb: 'Sexually'),
        ZBWallet(
            wallet: 60,
            hdname: 'Acceptance',
            hdnameheb: 'קבלה',
            hex: 'Wealthy',
            adjective: 'Limited',
            subject: 'Limitation',
            verb: 'Limits',
            adverb: 'Limitedly'),
        ZBWallet(
            wallet: 61,
            hdname: 'Mystery',
            hdnameheb: 'תעלומה',
            hex: 'Listening',
            adjective: 'Truthful',
            subject: 'Truth',
            verb: 'Truths',
            adverb: 'Truthfully'),
        ZBWallet(
            wallet: 62,
            hdname: 'Details',
            hdnameheb: 'פרטים',
            hex: 'King',
            adjective: 'Detailed',
            subject: 'Detail',
            verb: 'will Detail',
            adverb: 'Detailedly'),
        ZBWallet(
            wallet: 63,
            hdname: 'Doubt',
            hdnameheb: 'ספק',
            hex: 'Grace',
            adjective: 'Doubting',
            subject: 'Doubt',
            verb: 'will Doubt',
            adverb: 'Doubtfully'),
        ZBWallet(
            wallet: 64,
            hdname: 'Confusion',
            hdnameheb: 'בלבול',
            hex: 'Confused',
            adjective: 'Confusing',
            subject: 'Confusion',
            verb: 'Confused',
            adverb: 'Confusingly'),
      ];

  static List<ZBCounterPos> get counterPositions => [
        ZBCounterPos(name: 'head', postop: 5.0, width: 80.0, height: 70.0),
        ZBCounterPos(name: 'ajna', postop: 95.0, width: 80.0, height: 70.0),
        ZBCounterPos(name: 'throat', postop: 190.0, width: 75.0, height: 75.0),
        ZBCounterPos(name: 'self', postop: 295.0, width: 84.0, height: 84.0),
        ZBCounterPos(
            name: 'heart',
            postop: 340.0,
            posleft: 210.0,
            width: 72.0,
            height: 58.0),
        ZBCounterPos(
            name: 'spleen',
            postop: 420.0,
            posleft: 10.0,
            width: 80.0,
            height: 80.0),
        ZBCounterPos(
            name: 'solar',
            postop: 420.0,
            posright: 10.0,
            width: 80.0,
            height: 80.0),
        ZBCounterPos(
            name: 'sacral',
            postop: 430.0,
            posleft: 142.0,
            width: 65.0,
            height: 65.0),
        ZBCounterPos(name: 'root', postop: 520.0, width: 65.0, height: 65.0),
      ];

  static List<ZBWalletPos> get walletPositions => [
        ZBWalletPos(wallet: 1, postop: 4.0, posleft: 34.0),
        ZBWalletPos(wallet: 2, posbottom: 4.0, posleft: 34.0),
        ZBWalletPos(wallet: 3, posbottom: 0.0, posleft: 26.0),
        ZBWalletPos(wallet: 4, postop: 0.0, posright: 15.0),
        ZBWalletPos(wallet: 5, postop: 0.0, posleft: 6.0),
        ZBWalletPos(wallet: 6, postop: 32.0, posleft: 10.0),
        ZBWalletPos(wallet: 7, postop: 22.0, posleft: 16.0),
        ZBWalletPos(wallet: 8, posbottom: 0.0, posleft: 30.0),
        ZBWalletPos(wallet: 9, posbottom: 0.0, posright: 4.0),
        ZBWalletPos(wallet: 10, postop: 34.0, posleft: 4.0),
        ZBWalletPos(wallet: 11, postop: 15.0, posright: 15.0),
        ZBWalletPos(wallet: 12, postop: 30.0, posright: 0.0),
        ZBWalletPos(wallet: 13, postop: 22.0, posright: 16.0),
        ZBWalletPos(wallet: 14, postop: 0.0, posleft: 26.0),
        ZBWalletPos(wallet: 15, posbottom: 22.0, posleft: 16.0),
        ZBWalletPos(wallet: 16, postop: 13.0, posleft: 0.0),
        ZBWalletPos(wallet: 17, postop: 15.0, posleft: 15.0),
        ZBWalletPos(wallet: 18, posbottom: 8.0, posleft: 2.0),
        ZBWalletPos(wallet: 19, postop: 16.0, posright: 2.0),
        ZBWalletPos(wallet: 20, postop: 30.0, posleft: 0.0),
        ZBWalletPos(wallet: 21, postop: 7.0, posleft: 24.0),
        ZBWalletPos(wallet: 22, postop: 16.0, posright: 18.0),
        ZBWalletPos(wallet: 23, postop: 0.0, posleft: 30.0),
        ZBWalletPos(wallet: 24, postop: 0.0, posleft: 32.0),
        ZBWalletPos(wallet: 25, postop: 34.0, posright: 4.0),
        ZBWalletPos(wallet: 26, posbottom: 6.0, posleft: 8.0),
        ZBWalletPos(wallet: 27, postop: 33.0, posleft: 2.0),
        ZBWalletPos(wallet: 28, posbottom: 16.0, posleft: 18.0),
        ZBWalletPos(wallet: 29, postop: 0.0, posright: 4.0),
        ZBWalletPos(wallet: 30, posbottom: 8.0, posright: 2.0),
        ZBWalletPos(wallet: 31, posbottom: 0.0, posleft: 13.0),
        ZBWalletPos(wallet: 32, posbottom: 24.0, posleft: 34.0),
        ZBWalletPos(wallet: 33, posbottom: 0.0, posright: 13.0),
        ZBWalletPos(wallet: 34, postop: 17.0, posleft: 2.0),
        ZBWalletPos(wallet: 35, postop: 13.0, posright: 0.0),
        ZBWalletPos(wallet: 36, postop: 8.0, posright: 2.0),
        ZBWalletPos(wallet: 37, postop: 24.0, posright: 34.0),
        ZBWalletPos(wallet: 38, postop: 32.0, posleft: 2.0),
        ZBWalletPos(wallet: 39, postop: 32.0, posright: 2.0),
        ZBWalletPos(wallet: 40, posbottom: 3.0, posright: 10.0),
        ZBWalletPos(wallet: 41, posbottom: 1.0, posright: 2.0),
        ZBWalletPos(wallet: 42, posbottom: 0.0, posleft: 6.0),
        ZBWalletPos(wallet: 43, posbottom: 10.0, posleft: 32.0),
        ZBWalletPos(wallet: 44, postop: 24.0, posleft: 34.0),
        ZBWalletPos(wallet: 45, postop: 48.0, posright: 0.0),
        ZBWalletPos(wallet: 46, posbottom: 22.0, posright: 16.0),
        ZBWalletPos(wallet: 47, postop: 0.0, posleft: 15.0),
        ZBWalletPos(wallet: 48, postop: 8.0, posleft: 2.0),
        ZBWalletPos(wallet: 49, posbottom: 24.0, posright: 34.0),
        ZBWalletPos(wallet: 50, postop: 32.0, posright: 10.0),
        ZBWalletPos(wallet: 51, postop: 22.0, posleft: 16.0),
        ZBWalletPos(wallet: 52, postop: 0.0, posright: 4.0),
        ZBWalletPos(wallet: 53, postop: 0.0, posleft: 6.0),
        ZBWalletPos(wallet: 54, postop: 16.0, posleft: 2.0),
        ZBWalletPos(wallet: 55, posbottom: 16.0, posright: 18.0),
        ZBWalletPos(wallet: 56, postop: 0.0, posright: 13.0),
        ZBWalletPos(wallet: 57, postop: 16.0, posleft: 18.0),
        ZBWalletPos(wallet: 58, posbottom: 1.0, posleft: 2.0),
        ZBWalletPos(wallet: 59, postop: 33.0, posright: 2.0),
        ZBWalletPos(wallet: 60, postop: 0.0, posleft: 26.0),
        ZBWalletPos(wallet: 61, posbottom: 0.0, posleft: 32.0),
        ZBWalletPos(wallet: 62, postop: 0.0, posleft: 13.0),
        ZBWalletPos(wallet: 63, posbottom: 0.0, posleft: 49.0),
        ZBWalletPos(wallet: 64, posbottom: 0.0, posleft: 15.0),
      ];

  static Offset integrationFieldCenter(
      double canvasWidth, double canvasHeight) {
    final p57 =
        walletCounter(57, getcounterforwallet(57), canvasWidth, canvasHeight);
    final p20 =
        walletCounter(20, getcounterforwallet(20), canvasWidth, canvasHeight);
    return Offset(
      (p57.dx + p20.dx) / 2,
      (p57.dy + p20.dy) / 2,
    );
  }

  static Offset walletCounter(
      int walletId, String counterId, double canvasWidth, double canvasHeight) {
    final counter = counterPositions.firstWhere((c) => c.name == counterId);

    final double counterLeft = counter.posleft ??
        (counter.posright != null
            ? canvasWidth - counter.posright! - counter.width
            : (canvasWidth - counter.width) / 2);

    final double counterTop = counter.postop ??
        (counter.posbottom != null
            ? canvasHeight - counter.posbottom! - counter.height
            : 0.0);

    final wallet = walletPositions.firstWhere((w) => w.wallet == walletId,
        orElse: () => ZBWalletPos(wallet: walletId));

    const double walletSize = 16.0;

    final double walletLeft = wallet.posleft ??
        (wallet.posright != null
            ? counter.width - wallet.posright! - walletSize
            : 0.0);

    final double walletTop = wallet.postop ??
        (wallet.posbottom != null
            ? counter.height - wallet.posbottom! - walletSize
            : 0.0);

    return Offset(
      counterLeft + walletLeft + walletSize / 2,
      counterTop + walletTop + walletSize / 2,
    );
  }

  static ZBWallet? getwallet(int id) =>
      getzbwallets.firstWhereOrNull((w) => w.wallet == id);

  static ZBCounterPos? getcounter(String id) =>
      counterPositions.firstWhereOrNull((c) => c.name == id);

  static ZBTransaction? gettransaction(String id) =>
      getzbtransactions.firstWhereOrNull((t) => t.id == id);

  static String getWalletStory(int wallet, String category) {
    List<String>? wallets = base64Data[category];
    if (wallets == null || wallet < 1) return "No Data";

    // Direct mapping: Gate 1 is Index 0
    int targetIndex = wallet - 1;

    if (targetIndex >= 0 && targetIndex < wallets.length) {
      return wallets[targetIndex];
    }
    return "Wallet not found";
  }

  // BASE 384 LOOKUP (6 items per Wallet)
  static String getWalletNoteStory(int wallet, int note, String category) {
    List<String>? notes = base384[category];
    if (notes == null || wallet < 1 || note < 1) return "No Data";

    // Mathematical mapping: (Wallet-1)*6 + (Note-1)
    int targetIndex = ((wallet - 1) * 6) + (note - 1);

    if (targetIndex >= 0 && targetIndex < notes.length) {
      return notes[targetIndex];
    }
    return "Note not found";
  }

  static Map<int, ZBType> get getTypeMap => const {
        1: ZBType(
          id: 1,
          type: 'I do not know Meditation',
          zbimagePath: 'assets/camog/zblackcat.png', // ID 1
          typeheb: 'אני לא יודעת מדיטציה',
          zbname: 'Ido Not Know ',
          zbnameheb: 'עידו לא יודע',
          strategy: 'Do Not Know',
          strategyheb: 'לא לדעת',
          zbstrategy: 'idk',
          zbstrategyheb: 'אלי',
          zbsentence: "I don't know",
          zbsentenceheb: 'אני לא יודע',
        ),
        2: ZBType(
          id: 2,
          type: 'generator',
          zbimagePath: 'assets/camog/zbredog.png', // ID 2
          typeheb: 'גנטורית (ללא משימה)',
          zbname: 'bet kit he',
          zbnameheb: 'בטי גנרטורית',
          strategy: 'responsive',
          strategyheb: 'תגובתי',
          zbstrategy: 'silence responds',
          zbstrategyheb: 'שתיקה תגובתית',
          zbsentence: 'Filter Negativity with Satisfaction',
          zbsentenceheb: 'לסנן שליליות עם סיפוק',
        ),
        22: ZBType(
          id: 22,
          type: 'manifesting generator',
          zbimagePath: 'assets/camog/zbredog.png', // ID 2
          typeheb: 'גנטורית (עם משימה)',
          zbname: 'bet kit he has kit he',
          zbnameheb: 'בטי גנרטורית משימה',
          strategy: 'many responsive',
          strategyheb: 'תגובתי הרבה',
          zbstrategy: 'silence responds much',
          zbstrategyheb: 'שתיקה תגובתית רבה',
          zbsentence: 'Filter Negativity with Satisfaction',
          zbsentenceheb: 'לסנן שליליות עם סיפוק',
        ),
        3: ZBType(
          id: 3,
          type: 'projector',
          zbimagePath: 'assets/camog/zbyellowoctopussy.png', // ID 3
          typeheb: 'פרוקרינטורית',
          zbname: 'Been Kit He',
          zbnameheb: 'ביני פרוגקטור',
          strategy: 'invited',
          strategyheb: 'הזמנתי',
          zbstrategy: 'breath recognized',
          zbstrategyheb: 'נשימה הכרתית',
          zbsentence: 'Align Balance with Success',
          zbsentenceheb: 'ליישר איזון עם הצלחה',
        ),
        4: ZBType(
          id: 4,
          type: 'reflector',
          zbimagePath: 'assets/camog/zbgreenoctopus.png', // ID 4
          typeheb: 'מראה תור',
          zbname: 'Have Kit He',
          zbnameheb: 'אבי רפקלטור',
          strategy: 'reflective',
          strategyheb: 'שיקופי',
          zbstrategy: 'Simple Reflects',
          zbstrategyheb: 'שיקוף פשוט',
          zbsentence: 'Balance Oppositions with Surprise',
          zbsentenceheb: 'לאזן ניגודים עם הפתעה',
        ),
        5: ZBType(
          id: 5,
          type: 'manifestor',
          zbimagePath: 'assets/camog/zbluedog.png', // ID 5
          typeheb: 'מגשים תור',
          zbname: 'Has Kit He',
          zbnameheb: 'חזי מניפסטור',
          strategy: 'informative',
          strategyheb: 'יידועי',
          zbstrategy: 'COMPLEX IMPACTS',
          zbstrategyheb: 'מזיז מורכב',
          zbsentence: 'Impact Positively with Peace',
          zbsentenceheb: 'להשפיע לטובה עם שלום',
        ),
        6: ZBType(
          id: 6,
          type: 'zmansi WHITE CAMEL bob',
          zbimagePath: 'assets/camog/mcameline.png', // ID 6
          typeheb: 'זמנסי גמלבן בוב',
          zbname: 'zWCb',
          zbnameheb: 'ז00ב',
          strategy: 'zmansive',
          strategyheb: 'זמנסי',
          zbstrategy: 'zWCb',
          zbstrategyheb: 'זיבי',
          zbsentence: 'zmansi white camel bob',
          zbsentenceheb: 'זמנסי גמלבן בוב',
        ),
      };
  static Map<int, ZBAuthority> get getAuthMap => const {
        1: ZBAuthority(
          id: 1,
          authority: 'emotional',
          color: Colors.white,
          zbimagePath: 'assets/camog/mcameline.png', // Auth 1
          authheb: 'רגש',
          zbname: 'white emotion',
          zbnameheb: 'רגש לבן',
        ),
        2: ZBAuthority(
          id: 2,
          authority: 'sacral',
          color: Colors.red,
          zbimagePath: 'assets/camog/zbredog.png', // Auth 2
          authheb: 'בטן',
          zbname: 'red guts',
          zbnameheb: 'בטן אדומה',
        ),
        3: ZBAuthority(
          id: 3,
          authority: 'splenic',
          color: Colors.black,
          zbimagePath: 'assets/camog/zblackcat.png', // Auth 3
          authheb: 'טחול',
          zbname: 'black health',
          zbnameheb: 'בריאות שחורה',
        ),
        4: ZBAuthority(
          id: 4,
          authority: 'ego',
          color: Colors.blue,
          zbimagePath: 'assets/camog/zbluedog.png', // Auth 4
          authheb: 'רצון',
          zbname: 'blue will power',
          zbnameheb: 'רצון כחול',
        ),
        44: ZBAuthority(
          id: 44,
          authority: 'ego projected',
          color: Colors.blue,
          zbimagePath: 'assets/camog/zbluedog.png', // Auth 4
          authheb: 'רצון מוקרן',
          zbname: 'blue will power',
          zbnameheb: 'רצון כחול',
        ),
        5: ZBAuthority(
          id: 5,
          authority: 'self projected',
          color: Colors.yellow,
          zbimagePath: 'assets/camog/zbyellowoctopussy.png', // Auth 5
          authheb: 'עצמי',
          zbname: 'yellow me',
          zbnameheb: 'אני צהובה',
        ),
        6: ZBAuthority(
          id: 6,
          authority: 'mental',
          color: Colors.green,
          zbimagePath: 'assets/camog/zbgreenoctopus.png', // Auth 6
          authheb: 'מחשבה',
          zbname: 'green it',
          zbnameheb: 'זה ירוק',
        ),
        7: ZBAuthority(
          id: 7,
          authority: 'lunar',
          color: Colors.transparent,
          zbimagePath: 'assets/plants/bimbox.png', // Auth 7
          authheb: 'ירח',
          zbname: 'transparent authority',
          zbnameheb: 'סמכות שקופה',
        ),
      };

  static final List<ZBHDSentence> getHDSentences = [
    ZBHDSentence(
        sentence: 'inform with emotional clarity',
        sentenceheb: 'מרגיש ליידע בבהירות',
        typeName: 'manifestor',
        authName: 'emotional'),
    ZBHDSentence(
        sentence: 'inform spontaneously',
        sentenceheb: 'ליידע על בריאות מיידית',
        typeName: 'manifestor',
        authName: 'splenic'),
    ZBHDSentence(
        sentence: 'inform at will',
        sentenceheb: 'רצון ליידע',
        typeName: 'manifestor',
        authName: 'ego'),
    ZBHDSentence(
        sentence: 'respond with emotional clarity',
        sentenceheb: 'להגיב ברגש בהיר',
        typeName: 'generator',
        authName: 'emotional'),
    ZBHDSentence(
        sentence: 'respond in the moment',
        sentenceheb: 'להגיב מהבטן',
        typeName: 'generator',
        authName: 'sacral'),
    ZBHDSentence(
        sentence: 'recognize invitation with emotional clarity',
        sentenceheb: 'להכיר ברגש בהיר',
        typeName: 'projector',
        authName: 'emotional'),
    ZBHDSentence(
        sentence: 'recognize spontaneous invitation',
        sentenceheb: 'להכיר בריאות מיידית',
        typeName: 'projector',
        authName: 'splenic'),
    ZBHDSentence(
        sentence: 'recognize invitation to prove yourself',
        sentenceheb: 'להכיר רצון עצמי',
        typeName: 'projector',
        authName: 'ego'),
    ZBHDSentence(
        sentence: 'recognize invitation to express who you are',
        sentenceheb: 'להכיר את עצמי',
        typeName: 'projector',
        authName: 'self projected'),
    ZBHDSentence(
        sentence: 'recognize invitation to conceptualize',
        sentenceheb: 'להכיר את המחשבה',
        typeName: 'projector',
        authName: 'mental'),
    ZBHDSentence(
        sentence: 'watch the moon cycle',
        sentenceheb: 'לצפות בירח',
        typeName: 'reflector',
        authName: 'lunar'),
  ];

  // 1. Define the specific ID 1 instance as a static constant
  static const ZBType _idkType = ZBType(
    id: 1,
    type: 'I do not know Meditation',
    typeheb: 'אני לא יודעת מדיטציה',
    zbname: 'Ido Not Know ',
    zbnameheb: 'עידו לא יודע',
    strategy: 'Do Not Know',
    strategyheb: 'לא לדעת',
    zbstrategy: 'idk',
    zbstrategyheb: 'אלי',
    zbsentence: "I don't know",
    zbsentenceheb: 'אני לא יודע',
  );

// 2. The Getter: Try to find ID 1 in the map, otherwise use the constant
  static ZBType get defaultType => getTypeMap[1] ?? _idkType;

  // 🚀 The "Safety Net" Counter (Default Open Center)
  static ZBCounter get defaultCounterTemplate => ZBCounter(
        id: 0,
        name: "unknown",
        counterstate: 3, // 3 = Open/Undefined
        wallets: const [], // 🚀 Fixes the missing argument error
      );

// list bases mapping
  static final Map<String, List<String>> base4Data = {
    'Types': hdType4lst,
    'טיפוסים': hdType4Heblst,
    'MinMax': minmax4lst,
    'מינימיקי': minmax4Heblst,
    'Coins': coinsEng4lst,
    'מטבעות': coinsHeb4lst,
    'New Coins': newcoinsEng4lst,
    'מטבעות חדשים': newcoinsHeb4lst,
    'Bimbox': bimboxHeb4lst,
    'Kit He': kithe4lst,
    'Woof Goof': zbwoofgoofheb,
    'DNA': zbdna,
  };

  static final Map<String, List<String>> base36Data = {
    'Complex (Eng)': hdchannelcomplexList,
    'Breath (Eng)': hdchannelbreathList,
    'silence (Eng)': hdchannelsilenceList,
    'Manifest': hdchlimpactList,
    'Project': hdchlProjectList,
    'Generate': hdchlgenerateList,
    'מורכב (Heb)': hdchannelcomplexList_heb,
    'נשימה (Heb)': hdchannelbreathList_heb,
    'שתיקה (Heb)': hdchannelsilenceList_heb,
    'הגשמה': hdchlimpactList_he,
    'הקרנה': hdchlProjectList_he,
    'מחול אלה': hdchlgenerateList_he,
  };

  static final Map<String, List<String>> base64Data = {
    'Hex Names': hexNames64lst,
    'HD Gates': hdgates64lst,
    'RT Names': hexRTNames64lst,
    'New RT Names': new_hexRTNames64lst,
    'iChing': iChingEng64lst,
    'Adjectives': hexAdjective64lst,
    'Subjects': hexSubject64lst,
    'Verbs': hexVerb64lst,
    'Adverbs': hexAdVerb64lst,
    'Chinese': ichingChinese64Lst,
    'סיבוב ארנקים': rtwallets64lst_heb,
    'ארנקים חדשים': rtbbwallet64lst_heb,
    'ארנקישערים': rtgateswallet64lst_heb,
    'ארנקיחווה': new_rtbbwallet64lst_heb,
    'מיקירנקים': rtminmic64lst_heb,
    'שערים': hdgates64lst_heb,
  };

  static final Map<String, List<String>> base384 = {
    'סיבוב קווים': rtlines384lst_heb,
    'קווי עיצוב': hdlines384lstHeb,
    'Rotating Lines': rtlines384lst,
    'HD Lines': hdlines384lst,
  };

  static final Map<String, List<String>> base384Mirror = {
    'Lines': hdlines384lst, // 384 items
    'Exalted Text': hdlinesexalted, // 384 items
    'Detriment Text': hdlinesdetriment, // 384 items
    'Exalt Planet': hdplanetexaltimg, // 384 items
    'Detrim Planet': hdplanetdetrimentimg, // 384 items
  };

  /// 🌍 One Getter to rule them all
  static final List<ZBDictionarySourceLists> allSources = [
    ...base4Data.entries.map((e) => ZBDictionarySourceLists.fromEntry(e, 4)),

    // 💡 Logic: If it's one of the 3 Triads, it's Base 12, not 36
    ...base36Data.entries.map((e) {
      int triadBase = 12; // Silence(12) + Breath(12) + Complex(12) = 36
      return ZBDictionarySourceLists.fromEntry(e, triadBase);
    }),

    ...base64Data.entries.map((e) => ZBDictionarySourceLists.fromEntry(e, 64)),
    ...base384.entries.map((e) => ZBDictionarySourceLists.fromEntry(e, 384)),
  ];

  /// 🎯 Specific lookup (now much faster)
  static List<ZBDictionarySourceLists> getByBase(int targetBase) {
    return allSources.where((s) => s.base == targetBase).toList();
  }

  static final List<int> orderWalletOnWheel = [
    //qurater mutation complex
    41, 19,

    //quarter initation simple
    13, 49, 30, 55,
    37, 63, 22, 36,
    25, 17, 21, 51,
    42, 3, 27, 24,

    //quarter civilization silence
    2, 23, 8, 20,
    16, 35, 45, 12,
    15, 52, 39, 53,
    62, 56, 31, 33,

    //quarter duality breath
    7, 4, 29, 59,
    40, 64, 47, 6,
    46, 18, 48, 57,
    32, 50, 28, 44,

    1, 43, 14, 34,
    9, 5, 26, 11,
    10, 58, 38, 54,
    61, 60,
  ];
}

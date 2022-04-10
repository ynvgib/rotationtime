import 'package:flutter/material.dart';

final List<String> planetsfullList = [
  'assets/planets/northnode.png',
  'assets/planets/sun.png',
  'assets/planets/moon.png',
  'assets/planets/mercury.png',
  'assets/planets/venus.png',
  'assets/planets/mars.png',
  'assets/planets/jupiter.png',
  'assets/planets/saturn.png',
  'assets/planets/uranus.png',
  'assets/planets/neptune.png',
  'assets/planets/pluto.png',
  'assets/planets/earth.png',
  'assets/planets/southnode.png',
];

final List<String> planetspartialList = [
  'assets/planets/sun.png',
  'assets/planets/earth.png',
  'assets/planets/moon.png',
  'assets/planets/mercury.png',
  'assets/planets/venus.png',
  'assets/planets/mars.png',
  'assets/planets/jupiter.png',
  'assets/planets/saturn.png',
  'assets/planets/uranus.png',
  'assets/planets/neptune.png',
  'assets/planets/pluto.png',
];

final List<String> planetsNamesList = [
  'SUN',
  'EARTH',
  'MOON',
  'MERCURY',
  'VENUS',
  'MARS',
  'JUPITER',
  'SATURN',
  'URANUS',
  'NEPTUNE',
  'PLUTO',
];

final List<String> planetsCrossList = [
  'assets/planets/northnode.png',
  'assets/planets/sun.png',
  'assets/planets/earth.png',
  'assets/planets/southnode.png',
];


final List<String> hexList = [
  'assets/complexup.png',
  'assets/simplein.png',
  'assets/breathout.png',
  'assets/silencedown.png',
];



final List<String> fontHexOrderList = [
  'a',
  'b',
  'c',
  'd',
  'e',
  'f',
  'g',
  'h',
  'i',
  'j',
  'k',
  'l',
  'm',
  'n',
  'o',
  'p',
  'q',
  'r',
  's',
  't',
  'u',
  'v',
  'w',
  'x',
  'y',
  'z',
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '0',
  '!',
  '@',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];

final List<int> fontHexNumbersList = [
  1, 44, 13, 10,
  9, 14, 43, 33,
  25, 61, 26, 34,
  6, 37, 38, 5,

  57, 30, 58, 50,
  49, 28, 12, 42,
  41, 11, 62, 45,
  29, 39, 40, 24,

  7, 15, 16, 8,
  23, 2, 59, 22,
  54, 53, 21, 60,
  18, 55, 56, 17,

  32, 31, 47, 48,
  63, 64, 20, 27,
  19, 4, 36, 52,
  51, 35, 3, 46
];



final List<int> orderHexagramsWheel = [
  //qurater mutation complex
  1, 43, 14, 34,
  9, 5, 26, 11,
  10, 58, 38, 54,
  61, 60, 41, 19,

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
];

final List<int> orderHexagramsToCalulateWheel = [
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
  61, 60
];

final List<String> orderHexagramsWheelORIGINAL = [
  //qurater mutation complex
  '1', '43', '14', '34',
  '9', '5', '26', '11',
  '10', '58', '38', '54',
  '61', '60', '41', '19',

  //quarter initation simple
  '13', '49', '30', '55',
  '37', '63', '22', '36',
  '25', '17', '21', '51',
  '42', '3', '27', '24',

  //quarter civilization silence
  '2', '23', '8', '20',
  '16', '35', '45', '12',
  '15', '52', '39', '53',
  '62', '56', '31', '33',

  //quarter duality breath
  '7', '4', '29', '59',
  '40', '64', '47', '6',
  '46', '18', '48', '57',
  '32', '50', '28', '44',
];

final List<int> hexCarouselAlignList = [
  1,

  ];
final List<String> hexagramNames = [
  //qurater mutation complex
  'The Creative', 'The Responsive', 'Mutative', 'Logic',
  'Waiting', 'Friction', 'Interactive', 'Contribution',
  'Focus', 'Selfish', 'Ideally', 'Cautious',
  'Listening', 'Wealthy', 'Extreme', 'Skillful',

  //quarter initation simple
  'Opinions', 'Correcting', 'Needy', 'Now',
  'Control', 'Grace', 'Assimilation', 'Return',
  'Innocence', 'Tricky', 'Caring', 'Player',
  'Watery', 'Fiery', 'Leading', 'Continuity',

  //quarter civilization silence
  'Memory', 'Powerful', 'Progressive', 'Crisis',
  'Family', 'Fighter', 'Provocation', 'Employed',
  'Fantasy', 'End', 'Knowing', 'Spotted',
  'King', 'Determined', 'Oppressed', 'Deep',

  //quarter duality breath
  'Revolutionary', 'Valued', 'Shocking', 'Still',
  'Begin', 'Ambitious', 'Spirit', 'Storyteller',
  'Wind', 'Joyous', 'Sexual', 'Constrained',
  'Mysterious', 'Detailed', 'Doubtful', 'Confused',
];

/// FULL SENTENCE

final List<String> hexagramSentenceList = [
  '0','Adjective','Subject','Verb','Adverb',
  '1','Creative','Creativity','Creates','Creatively',
  '2','Responsive','Response','Responds','Responsively',
  '3','Different','Mutation','Mutates','Differently',
  '4','Chaotic','Answer','Answers','Chaotically',
  '5','Patient','Patience','Waits','Patiently',
  '6','Conflicting','Conflict','Conflicts','Conflictingly',
  '7','Interactive','Interaction','Interacts','Interactively',
  '8','Contributing','Contribution','Contributes','Uniquely',
  '9','Focused','Focus','Focuses','Focusingly',
  '10','Selfing','Self','Selfs','Selfingly',
  '11','Ideal','Idea','Ideas','Ideally',
  '12','Cautious','Caution','Cautions','Cautiously',
  '13','Secret','Secret','Hides','Secretly',
  '14','Wealthy','Wealth','Enriches','Wealthfully',
  '15','Extreme','Extreme','Extremes','Extremely',
  '16','Skillful','Skill','Identifies','Skillfully',
  '17','Hierarchical','Hierarchy','Organizes','Hierarchically',
  '18','Corrective','Correction','Corrects','Correctly',
  '19','Needful','Need','Needs','Needfully',
  '20','Attentive','Attention','Attends','Attentively',
  '21','Controlled','Control','Controls','Controllably',
  '22','Graceful','Grace','Graces','Gracefully',
  '23','Assimilated','Assimilation','Assimilates','Assimilably',
  '24','Rationalised','Rationalisation','Rationalises','Rationally',
  '25','Innocent','Innocence','Innocences','Innocently',
  '26','Tricky','Trickster','Tricks','Trickily',
  '27','Caring','Care','Cares','Carefully',
  '28','Risky','Risk','Risks','Riskily',
  '29','Persevered','Perseverance','Perseveres','Perseveringly',
  '30','Fiery','Fire','Fires','Fiercely',
  '31','Leading','Lead','Leads','Leadingly',
  '32','Failing','Failure','Fails','Failingly',
  '33','Remembered','Memory','Remembers','Privately',
  '34','Powerful','Power','Powers','Powerfully',
  '35','Progressive','Change','Changes','Progressively',
  '36','Endarkened','Feeling','Feels','Fully',
  '37','Friendful','Friend','Befriends','Friendly',
  '38','Fighting','Fighter','Fights','Oppositely',
  '39','Provocative','Provocation','Provokes','Provocatively',
  '40','Loyal','Worker','Works','Loyally',
  '41','Fanciful','Fantasy','Fantasises','Fancifully',
  '42','Ending','End','Ends','Happily Ever After',
  '43','Insightful','Insight','Insights','Insightfully',
  '44','Alertful','Alert','Alerts','Alertly',
  '45','Bossy','Boss','Bosses','Boastfully',
  '46','Determined','Determination','Determines','Determinately',
  '47','Oppressed','Oppression','Oppresses','Oppressively',
  '48','Deep','Depth','Deepens','Deeply',
  '49','Revolutionary','Revolution','Revolutionizes','Revolutionarily',
  '50','Valuable','Value','Values','Valuably',
  '51','Shocking','Shock','Shocks','Shockingly',
  '52','Mounted','Mountain','Mounts','Mountfully',
  '53','First','Beginning','Begins','At the Beginning',
  '54','Ambitious','Ambition','Drives','Ambitiously',
  '55','Spirited','Spirit','Spirits','Spiritually',
  '56','Believed','Believer','Believes','Wonderingly',
  '57','Gentle','GentleWind','Blows','Gently',
  '58','Joyous','Joy','Enjoys','Joyously',
  '59','Sexual','Sex','Disperses','Sexually',
  '60','Limited','Limitation','Limits','Limitedly',
  '61','Truthful','Truth','Truths','Truthfully',
  '62','Detailed','Detail','Details','Detailedly',
  '63','Doubting','Doubt','Doubts','Doubtfully',
  '64','Confusing','Confusion','Confuses','Confusingly',
];

final List<String> hexagramOriginSentenceList = [
  '0','Zero','Zero','Zero','Zero',
  '1','Creative','Creativity','Creates','Creatively',
  '2','Responsive','Response','Responds','Responsively',
  '3','Different','Mutation','Mutates','Differently',
  '4','Chaotic','Answer','Answers','Chaotically',
  '5','Patient','Patience','Waits','Patiently',
  '6','Conflicting','Conflict','Conflicts','Conflictingly',
  '7','Interactive','Interaction','Interacts','Interactively',
  '8','Contributing','Contribution','Contributes','Uniquely',
  '9','Focused','Focus','Focuses','Focusingly',
  '10','Selfing','Self','Selfs','Selfingly',
  '11','Ideal','Idea','Ideas','Ideally',
  '12','Cautious','Caution','Cautions','Cautiously',
  '13','Secret','Secret','Hides','Secretly',
  '14','Wealthy','Wealth','Enriches','Wealthfully',
  '15','Extreme','Extreme','Extremes','Extremely',
  '16','Skillful','Skill','Identifies','Skillfully',
  '17','Hierarchical','Hierarchy','Organizes','Hierarchically',
  '18','Corrective','Correction','Corrects','Correctly',
  '19','Needful','Need','Needs','Needfully',
  '20','Attentive','Attention','Attends','Attentively',
  '21','Controlled','Control','Controls','Controllably',
  '22','Graceful','Grace','Graces','Gracefully',
  '23','Assimilated','Assimilation','Assimilates','Assimilably',
  '24','Rationalised','Rationalisation','Rationalises','Rationally',
  '25','Innocent','Innocence','Innocences','Innocently',
  '26','Tricky','Trickster','Tricks','Trickily',
  '27','Caring','Care','Cares','Carefully',
  '28','Risky','Risk','Risks','Riskily',
  '29','Persevered','Perseverance','Perseveres','Perseveringly',
  '30','Fiery','Fire','Fires','Fiercely',
  '31','Leading','Lead','Leads','Leadingly',
  '32','Failing','Failure','Fails','Failingly',
  '33','Remembered','Memory','Remembers','Privately',
  '34','Powerful','Power','Powers','Powerfully',
  '35','Progressive','Change','Changes','Progressively',
  '36','Endarkened','Feeling','Feels','Fully',
  '37','Friendful','Friend','Befriends','Friendly',
  '38','Fighting','Fighter','Fights','Oppositely',
  '39','Provocative','Provocation','Provokes','Provocatively',
  '40','Loyal','Worker','Works','Loyally',
  '41','Fanciful','Fantasy','Fantasises','Fancifully',
  '42','Ending','End','Ends','Happily Ever After',
  '43','Insightful','Insight','Insights','Insightfully',
  '44','Alertful','Alert','Alerts','Alertly',
  '45','Bossy','Boss','Bosses','Boastfully',
  '46','Determined','Determination','Determines','Determinately',
  '47','Oppressed','Oppression','Oppresses','Oppressively',
  '48','Deep','Depth','Deepens','Deeply',
  '49','Revolutionary','Revolution','Revolutionizes','Revolutionarily',
  '50','Valuable','Value','Values','Valuably',
  '51','Shocking','Shock','Shocks','Shockingly',
  '52','Mounted','Mountain','Mounts','Mountfully',
  '53','First','Beginning','Begins','At the Beginning',
  '54','Ambitious','Ambition','Drives','Ambitiously',
  '55','Spirited','Spirit','Spirits','Spiritually',
  '56','Believed','Believer','Believes','Wonderingly',
  '57','Gentle','GentleWind','Blows','Gently',
  '58','Joyous','Joy','Enjoys','Joyously',
  '59','Sexual','Sex','Disperses','Sexually',
  '60','Limited','Limitation','Limits','Limitedly',
  '61','Truthful','Truth','Truths','Truthfully',
  '62','Detailed','Detail','Details','Detailedly',
  '63','Doubting','Doubt','Doubts','Doubtfully',
  '64','Confusing','Confusion','Confuses','Confusingly',
];

// not final
List<String> hexagramNewSentenceList = [
  '0','Zero','Zero','Zero','Zero',
  '1','Creative','Creativity','Creates','Creatively',
  '2','Responsive','Response','Responds','Responsively',
  '3','Different','Mutation','Mutates','Differently',
  '4','Chaotic','Answer','Answers','Chaotically',
  '5','Patient','Patience','Waits','Patiently',
  '6','Conflicting','Conflict','Conflicts','Conflictingly',
  '7','Interactive','Interaction','Interacts','Interactively',
  '8','Contributing','Contribution','Contributes','Uniquely',
  '9','Focused','Focus','Focuses','Focusingly',
  '10','Selfing','Self','Selfs','Selfingly',
  '11','Ideal','Idea','Ideas','Ideally',
  '12','Cautious','Caution','Cautions','Cautiously',
  '13','Secret','Secret','Hides','Secretly',
  '14','Wealthy','Wealth','Enriches','Wealthfully',
  '15','Extreme','Extreme','Extremes','Extremely',
  '16','Skillful','Skill','Identifies','Skillfully',
  '17','Hierarchical','Hierarchy','Organizes','Hierarchically',
  '18','Corrective','Correction','Corrects','Correctly',
  '19','Needful','Need','Needs','Needfully',
  '20','Attentive','Attention','Attends','Attentively',
  '21','Controlled','Control','Controls','Controllably',
  '22','Graceful','Grace','Graces','Gracefully',
  '23','Assimilated','Assimilation','Assimilates','Assimilably',
  '24','Rationalised','Rationalisation','Rationalises','Rationally',
  '25','Innocent','Innocence','Innocences','Innocently',
  '26','Tricky','Trickster','Tricks','Trickily',
  '27','Caring','Care','Cares','Carefully',
  '28','Risky','Risk','Risks','Riskily',
  '29','Persevered','Perseverance','Perseveres','Perseveringly',
  '30','Fiery','Fire','Fires','Fiercely',
  '31','Leading','Lead','Leads','Leadingly',
  '32','Failing','Failure','Fails','Failingly',
  '33','Remembered','Memory','Remembers','Privately',
  '34','Powerful','Power','Powers','Powerfully',
  '35','Progressive','Change','Changes','Progressively',
  '36','Endarkened','Feeling','Feels','Fully',
  '37','Friendful','Friend','Befriends','Friendly',
  '38','Fighting','Fighter','Fights','Oppositely',
  '39','Provocative','Provocation','Provokes','Provocatively',
  '40','Loyal','Worker','Works','Loyally',
  '41','Fanciful','Fantasy','Fantasises','Fancifully',
  '42','Ending','End','Ends','Happily Ever After',
  '43','Insightful','Insight','Insights','Insightfully',
  '44','Alertful','Alert','Alerts','Alertly',
  '45','Bossy','Boss','Bosses','Boastfully',
  '46','Determined','Determination','Determines','Determinately',
  '47','Oppressed','Oppression','Oppresses','Oppressively',
  '48','Deep','Depth','Deepens','Deeply',
  '49','Revolutionary','Revolution','Revolutionizes','Revolutionarily',
  '50','Valuable','Value','Values','Valuably',
  '51','Shocking','Shock','Shocks','Shockingly',
  '52','Mounted','Mountain','Mounts','Mountfully',
  '53','First','Beginning','Begins','At the Beginning',
  '54','Ambitious','Ambition','Drives','Ambitiously',
  '55','Spirited','Spirit','Spirits','Spiritually',
  '56','Believed','Believer','Believes','Wonderingly',
  '57','Gentle','GentleWind','Blows','Gently',
  '58','Joyous','Joy','Enjoys','Joyously',
  '59','Sexual','Sex','Disperses','Sexually',
  '60','Limited','Limitation','Limits','Limitedly',
  '61','Truthful','Truth','Truths','Truthfully',
  '62','Detailed','Detail','Details','Detailedly',
  '63','Doubting','Doubt','Doubts','Doubtfully',
  '64','Confusing','Confusion','Confuses','Confusingly',
];

final List<String> hexagramAdjectiveList = [
  'Zero',
  'Creative',
      'Responsive',
      'Different',
      'Chaotic',
      'Patient',
      'Conflicting',
      'Interactive',
      'Contributing',
      'Focused',
      'Selfing',
      'Ideal',
      'Cautious',
      'Secret',
      'Wealthy',
      'Extreme',
      'Skillful',
      'Hierarchical',
      'Corrective',
      'Needful',
      'Attentive',
      'Controlled',
      'Graceful',
      'Assimilated',
      'Rationalised',
      'Innocent',
      'Tricky',
      'Caring',
      'Risky',
      'Persevered',
      'Fiery',
      'Leading',
      'Failing',
      'Remembered',
      'Powerful',
      'Progressive',
      'Endarkened',
      'Friendful',
      'Fighting',
      'Provocative',
      'Loyal',
      'Fanciful',
      'Ending',
      'Insightful',
      'Alertful',
      'Bossy',
      'Determined',
      'Oppressed',
      'Deep',
      'Revolutionary',
      'Valuable',
      'Shocking',
      'Mounted',
      'First',
      'Ambitious',
      'Spirited',
      'Believed',
      'Gentle',
      'Joyous',
      'Sexual',
      'Limited',
      'Truthful',
      'Detailed',
      'Doubting',
      'Confusing',
];

final List<String> hexagramSubjectList = [
  'Zero',
  'Creativity',
      'Response',
      'Mutation',
      'Answer',
      'Patience',
      'Conflict',
      'Interaction',
      'Contribution',
      'Focus',
      'Self',
      'Idea',
      'Caution',
      'Secret',
      'Wealth',
      'Extreme',
      'Skill',
      'Hierarchy',
      'Correction',
      'Need',
      'Attention',
      'Control',
      'Grace',
      'Assimilation',
      'Rationalisation',
      'Innocence',
      'Trickster',
      'Care',
      'Risk',
      'Perseverance',
      'Fire',
      'Lead',
      'Failure',
      'Memory',
      'Power',
      'Change',
      'Feeling',
      'Friend',
      'Fighter',
      'Provocation',
      'Worker',
      'Fantasy',
      'End',
      'Insight',
      'Alert',
      'Boss',
      'Determination',
      'Oppression',
      'Depth',
      'Revolution',
      'Value',
      'Shock',
      'Mountain',
      'Beginning',
      'Ambition',
      'Spirit',
      'Believer',
      'GentleWind',
      'Joy',
      'Sexuality',
      'Limitation',
      'Truth',
      'Detail',
      'Doubt',
      'Confusion',

];

final List<String> hexagramVerbList = [
  'Zero',
  'Creates',
  'Responds',
  'Mutates',
  'Answers',
  'Waits',
  'Conflicts',
  'Interacts',
  'Contributes',
  'Focuses',
  'Selfs',
  'Ideas',
  'Cautions',
  'Hides',
  'Enriches',
  'Extremes',
  'Identifies',
  'Organizes',
  'Corrects',
  'Needs',
  'Attends',
  'Controls',
  'Graces',
  'Assimilates',
  'Rationalises',
  'Innocences',
  'Tricks',
  'Cares',
  'Risks',
  'Perseveres',
  'Fires',
  'Leads',
  'Fails',
  'Remembers',
  'Powers',
  'Changes',
  'Feels',
  'Befriends',
  'Fights',
  'Provokes',
  'Works',
  'Fantasises',
  'Ends',
  'Insights',
  'Alerts',
  'Bosses',
  'Determines',
  'Oppresses',
  'Deepens',
  'Revolutionizes',
  'Values',
  'Shocks',
  'Mounts',
  'Begins',
  'Drives',
  'Spirits',
  'Believes',
  'Blows',
  'Enjoys',
  'Disperses',
  'Limits',
  'Truths',
  'Details',
  'Doubts',
  'Confuses',
];

final List<String> hexagramVerbNewList = [
  'Zero',
  'Creates',
  'Responds',
  'Mutates',
  'will Answer',
  'will Wait',
  'Conflicts',
  'will Interact',
  'Contributes',
  'will Focus',
  'Selfs',
  'Idead',
  'Cautions',
  'Hid',
  'Enriches',
  'will Extreme',
  'will Identify',
  'will Organize',
  'will Correct',
  'Needs',
  'Attends',
  'Controls',
  'Graces',
  'Assimilates',
  'Rationalises',
  'Innocences',
  'Tricks',
  'Cares',
  'Risks',
  'Persevered',
  'Fired',
  'will Lead',
  'Fails',
  'Remembered',
  'Powers',
  'Changed',
  'Felt',
  'Befriends',
  'Fights',
  'Provokes',
  'Works',
  'Fantasised',
  'Ended',
  'Insights',
  'Alerts',
  'Bosses',
  'Determined',
  'Oppressed',
  'will Deepen',
  'Revolutionizes',
  'Values',
  'Shocks',
  'will Mount',
  'Began',
  'Drives',
  'Spirits',
  'Believed',
  'Blows',
  'will Enjoy',
  'Disperses',
  'Limits',
  'Truths',
  'will Detail',
  'will Doubt',
  'Confused',
];

final List<String> hexagramAdverbList = [
  'Zero',
  'Creatively',
  'Responsively',
  'Differently',
  'Chaotically',
  'Patiently',
  'Conflictingly',
  'Interactively',
  'Uniquely',
  'Focusingly',
  'Selfingly',
  'Ideally',
  'Cautiously',
  'Secretly',
  'Wealthfully',
  'Extremely',
  'Skillfully',
  'Hierarchically',
  'Correctly',
  'Needfully',
  'Attentively',
  'Controllably',
  'Gracefully',
  'Assimilably',
  'Rationally',
  'Innocently',
  'Trickily',
  'Carefully',
  'Riskily',
  'Perseveringly',
  'Fiercely',
  'Leadingly',
  'Failingly',
  'Privately',
  'Powerfully',
  'Progressively',
  'Fully',
  'Friendly',
  'Oppositely',
  'Provocatively',
  'Loyally',
  'Fancifully',
  'Happily Ever After',
  'Insightfully',
  'Alertly',
  'Boastfully',
  'Determinately',
  'Oppressively',
  'Deeply',
  'Revolutionarily',
  'Valuably',
  'Shockingly',
  'Mountfully',
  'At the Beginning',
  'Ambitiously',
  'Spiritually',
  'Wonderingly',
  'Gently',
  'Joyously',
  'Sexually',
  'Limitedly',
  'Truthfully',
  'Detailedly',
  'Doubtfully',
  'Confusingly',
];

final List<String> hexCarouselValueList = [
'111',
'1',

'211',
'43',

'311',
'14',

'411',
'34',

'121',
'9',

'221',
'5',

'321',
'26',

'421',
'11',

'131',
'10',

'231',
'58',

'331',
'38',

'431',
'54',

'141',
'61',

'241',
'60',

'341',
'41',

'441',
'19',

//Quarter of Initiation
'112',
'13',

'212',
'49',

'312',
'30',

'412',
'55',

'122',
'37',

'222',
'63',

'322',
'22',

'422',
'36',

'132',
'25',

'232',
'17',

'332',
'21',

'432',
'51',

'142',
'42',

'242',
'3',

'342',
'27',

'442',
'24',


//Quarter of Duality
'113',
'44',

'213',
'28',

'313',
'50',

'413',
'32',

'123',
'57',

'223',
'48',

'323',
'18',

'423',
'46',

'133',
'6',

'233',
'47',

'333',
'64',

'433',
'40',

'143',
'59',

'243',
'29',

'343',
'4',

'443',
'7',

//Quarter of Civilization
'114',
'33',

'214',
'31',

'314',
'56',

'414',
'62',

'124',
'53',

'224',
'39',

'324',
'52',

'424',
'15',

'134',
'12',

'234',
'45',

'334',
'35',

'434',
'16',

'144',
'20',

'244',
'8',

'344',
'23',

'444',
'2',

];


/// FULL SENTENCE

final List<String> hexBasicList = [
  'assets/complex.png',
  'assets/simple.png',
  'assets/breath.png',
  'assets/silence.png',
];

final List<String> hexBasicMixList = [
  'assets/complexup.png',
  'assets/simplein.png',
  'assets/breathout.png',
  'assets/silencedown.png',
];

final List<String> hexBasicDownList = [
  'assets/complexdown.png',
  'assets/simpledown.png',
  'assets/breathdown.png',
  'assets/silencedown.png',
];

final List<String> hexBasicUpList = [
  'assets/complexup.png',
  'assets/simpleup.png',
  'assets/breathup.png',
  'assets/silenceup.png',
];

final List<String> hexDualList = [
  'assets/complexup.png',
  'assets/complexdown.png',
  'assets/simplein.png',
  'assets/simpledown.png',
  'assets/breathup.png',
  'assets/breathout.png',
  'assets/silenceup.png',
  'assets/silencedown.png',
];

final List<String> hexFullList = [
  'assets/complexup.png',
  'assets/complexin.png',
  'assets/complexout.png',
  'assets/complexdown.png',
  'assets/simpleup.png',
  'assets/simplein.png',
  'assets/simpleout.png',
  'assets/simpledown.png',
  'assets/breathup.png',
  'assets/breathin.png',
  'assets/breathout.png',
  'assets/breathdown.png',
  'assets/silenceup.png',
  'assets/silencein.png',
  'assets/silenceout.png',
  'assets/silencedown.png',
];

final List<String> hexNamesList = [
  'COMPLEX',
  'SIMPLE',
  'breath',
  'silence',
];

// variables
var hexagramslist = List<int>.generate(65, (counter) => counter++);
var hexagramslistfinal = hexagramslist.getRange(1, hexagramslist.length);

// SLIDERS

final List<Widget> planetsFullSliders = planetsfullList
    .map((planet) => Container(
  margin: const EdgeInsets.all(5.0),
  child: ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      child: Stack(
        children: <Widget>[
          Image.asset(planet, fit: BoxFit.cover, width: 100.0),
        ],
      )),
))
    .toList();

final List<Widget> planetsCrossSliders = planetsCrossList
    .map((planet) => Container(
  margin: const EdgeInsets.all(5.0),
  child: ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      child: Stack(
        children: <Widget>[
          Image.asset(planet, fit: BoxFit.cover, width: 100.0),
        ],
      )),
))
    .toList();

final List<Widget> allItemsSliders = hexFullList
    .map((hexImage) => CircleAvatar(
        minRadius: 100.0,
        maxRadius: 100.0,
        backgroundImage: AssetImage(hexImage)))
    .toList();

final List<Widget> downHexagramSliders = hexBasicDownList
    .map((item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.asset(item, fit: BoxFit.cover, width: 500.0),
                ],
              )),
        ))
    .toList();

final List<Widget> mixHexagramSliders = hexBasicMixList
    .map((item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.asset(item, fit: BoxFit.cover, width: 500.0),
                ],
              )),
        ))
    .toList();

final List<Widget> mixHexagramSlidersNew = hexBasicMixList
    .map((hexagrambasicmix) => CircleAvatar(
        minRadius: 100.0,
        maxRadius: 100.0,
        backgroundImage: AssetImage(hexagrambasicmix)))
    .toList();

// DROPDOWN

final List<DropdownMenuItem<int>> hexDropDownNumbersList =
    hexagramslistfinal.map((int hexagramsnew) {
  return DropdownMenuItem(
    value: hexagramsnew,
    child: Text(
      hexagramsnew.toString(),
      style: const TextStyle(
          color: Colors.grey,),
    ),
  );
}).toList();

final List<DropdownMenuItem<String>> fontHexList =
    fontHexOrderList.map((String chosenHexagrams) {
  return DropdownMenuItem(
    value: chosenHexagrams,
    child: Text(chosenHexagrams,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontFamily: 'iChing',
        )),
  );
}).toList();

final List<DropdownMenuItem<int>> orderHexagramsWheelList =
    orderHexagramsWheel.map((int orderWheelHexagrams) {
  return DropdownMenuItem(
      value: orderWheelHexagrams,
      child: Text(orderWheelHexagrams.toString(),
          style: const TextStyle(
            color: Colors.grey,
          )));
}).toList();

final List<DropdownMenuItem<String>> iChingFontList =
    fontHexOrderList.map((String fontHexagrams) {
  return DropdownMenuItem(
    value: fontHexagrams,
    child: Text(fontHexagrams,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontFamily: 'iChing',
        )),
  );
}).toList();

// map

final fontHexagramsMap = fontHexOrderList.asMap();
final fontHexagramsWheelMap = fontHexNumbersList.asMap();

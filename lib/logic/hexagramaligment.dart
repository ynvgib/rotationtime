// used for LIST mixHexagramSlidersNew
List<int> hexagramAlignment(int _mainhexagram) {
  int _maintop = 0,
      _mainmid = 0,
      _mainbot = 0,
      _oppositemaintop = 0,
      _oppositemainmid = 0,
      _oppositemainbot = 0,
      _previousmaintop = 0,
      _previousmainmid = 0,
      _previousmainbot = 0,
      _oppositepreviousmaintop = 0,
      _oppositepreviousmainmid = 0,
      _oppositepreviousmainbot = 0;

  switch (_mainhexagram) {
    //Quarter of Mutation
    case 1:
      _maintop = 0;
      _mainmid = 0;
      _mainbot = 0;
      break;
    case 43:
      _maintop = 1;
      _mainmid = 0;
      _mainbot = 0;
      break;
    case 14:
      _maintop = 2;
      _mainmid = 0;
      _mainbot = 0;
      break;
    case 34:
      _maintop = 3;
      _mainmid = 0;
      _mainbot = 0;
      break;
    case 9:
      _maintop = 0;
      _mainmid = 1;
      _mainbot = 0;
      break;
    case 5:
      _maintop = 1;
      _mainmid = 1;
      _mainbot = 0;
      break;
    case 26:
      _maintop = 2;
      _mainmid = 1;
      _mainbot = 0;
      break;
    case 11:
      _maintop = 3;
      _mainmid = 1;
      _mainbot = 0;
      break;
    case 10:
      _maintop = 0;
      _mainmid = 2;
      _mainbot = 0;
      break;
    case 58:
      _maintop = 1;
      _mainmid = 2;
      _mainbot = 0;
      break;
    case 38:
      _maintop = 2;
      _mainmid = 2;
      _mainbot = 0;
      break;
    case 54:
      _maintop = 3;
      _mainmid = 2;
      _mainbot = 0;
      break;
    case 61:
      _maintop = 0;
      _mainmid = 3;
      _mainbot = 0;
      break;
    case 60:
      _maintop = 1;
      _mainmid = 3;
      _mainbot = 0;
      break;
    case 41:
      _maintop = 2;
      _mainmid = 3;
      _mainbot = 0;
      break;
    case 19:
      _maintop = 3;
      _mainmid = 3;
      _mainbot = 0;
      break;

    //Quarter of Initiation
    case 13:
      _maintop = 0;
      _mainmid = 0;
      _mainbot = 1;
      break;
    case 49:
      _maintop = 1;
      _mainmid = 0;
      _mainbot = 1;
      break;
    case 30:
      _maintop = 2;
      _mainmid = 0;
      _mainbot = 1;
      break;
    case 55:
      _maintop = 3;
      _mainmid = 0;
      _mainbot = 1;
      break;
    case 37:
      _maintop = 0;
      _mainmid = 1;
      _mainbot = 1;
      break;
    case 63:
      _maintop = 1;
      _mainmid = 1;
      _mainbot = 1;
      break;
    case 22:
      _maintop = 2;
      _mainmid = 1;
      _mainbot = 1;
      break;
    case 36:
      _maintop = 3;
      _mainmid = 1;
      _mainbot = 1;
      break;
    case 25:
      _maintop = 0;
      _mainmid = 2;
      _mainbot = 1;
      break;
    case 17:
      _maintop = 1;
      _mainmid = 2;
      _mainbot = 1;
      break;
    case 21:
      _maintop = 2;
      _mainmid = 2;
      _mainbot = 1;
      break;
    case 51:
      _maintop = 3;
      _mainmid = 2;
      _mainbot = 1;
      break;
    case 42:
      _maintop = 0;
      _mainmid = 3;
      _mainbot = 1;
      break;
    case 3:
      _maintop = 1;
      _mainmid = 3;
      _mainbot = 1;
      break;
    case 27:
      _maintop = 2;
      _mainmid = 3;
      _mainbot = 1;
      break;
    case 24:
      _maintop = 3;
      _mainmid = 3;
      _mainbot = 1;
      break;

    //Quarter of Duality
    case 44:
      _maintop = 0;
      _mainmid = 0;
      _mainbot = 2;
      break;
    case 28:
      _maintop = 1;
      _mainmid = 0;
      _mainbot = 2;
      break;
    case 50:
      _maintop = 2;
      _mainmid = 0;
      _mainbot = 2;
      break;
    case 32:
      _maintop = 3;
      _mainmid = 0;
      _mainbot = 2;
      break;
    case 57:
      _maintop = 0;
      _mainmid = 1;
      _mainbot = 2;
      break;
    case 48:
      _maintop = 1;
      _mainmid = 1;
      _mainbot = 2;
      break;
    case 18:
      _maintop = 2;
      _mainmid = 1;
      _mainbot = 2;
      break;
    case 46:
      _maintop = 3;
      _mainmid = 1;
      _mainbot = 2;
      break;
    case 6:
      _maintop = 0;
      _mainmid = 2;
      _mainbot = 2;
      break;
    case 47:
      _maintop = 1;
      _mainmid = 2;
      _mainbot = 2;
      break;
    case 64:
      _maintop = 2;
      _mainmid = 2;
      _mainbot = 2;
      break;
    case 40:
      _maintop = 3;
      _mainmid = 2;
      _mainbot = 2;
      break;
    case 59:
      _maintop = 0;
      _mainmid = 3;
      _mainbot = 2;
      break;
    case 29:
      _maintop = 1;
      _mainmid = 3;
      _mainbot = 2;
      break;
    case 4:
      _maintop = 2;
      _mainmid = 3;
      _mainbot = 2;
      break;
    case 7:
      _maintop = 3;
      _mainmid = 3;
      _mainbot = 2;
      break;

    //Quarter of Civilization
    case 33:
      _maintop = 0;
      _mainmid = 0;
      _mainbot = 3;
      break;
    case 31:
      _maintop = 1;
      _mainmid = 0;
      _mainbot = 3;
      break;
    case 56:
      _maintop = 2;
      _mainmid = 0;
      _mainbot = 3;
      break;
    case 62:
      _maintop = 3;
      _mainmid = 0;
      _mainbot = 3;
      break;
    case 53:
      _maintop = 0;
      _mainmid = 1;
      _mainbot = 3;
      break;
    case 39:
      _maintop = 1;
      _mainmid = 1;
      _mainbot = 3;
      break;
    case 52:
      _maintop = 2;
      _mainmid = 1;
      _mainbot = 3;
      break;
    case 15:
      _maintop = 3;
      _mainmid = 1;
      _mainbot = 3;
      break;
    case 12:
      _maintop = 0;
      _mainmid = 2;
      _mainbot = 3;
      break;
    case 45:
      _maintop = 1;
      _mainmid = 2;
      _mainbot = 3;
      break;
    case 35:
      _maintop = 2;
      _mainmid = 2;
      _mainbot = 3;
      break;
    case 16:
      _maintop = 3;
      _mainmid = 2;
      _mainbot = 3;
      break;
    case 20:
      _maintop = 0;
      _mainmid = 3;
      _mainbot = 3;
      break;
    case 8:
      _maintop = 1;
      _mainmid = 3;
      _mainbot = 3;
      break;
    case 23:
      _maintop = 2;
      _mainmid = 3;
      _mainbot = 3;
      break;
    case 2:
      _maintop = 3;
      _mainmid = 3;
      _mainbot = 3;
      break;
    default:
      _maintop = 0;
      _mainmid = 0;
      _mainbot = 0;
      break;
  }

  switch (_maintop){
    case 0:
      _oppositemaintop = 3;
      break;
    case 1:
      _oppositemaintop = 2;
      break;
    case 2:
      _oppositemaintop = 1;
      break;
    case 3:
      _oppositemaintop = 0;
      break;
    default:
      _oppositemaintop = 3;
      break;
  }

  switch (_mainmid){
    case 0:
      _oppositemainmid = 3;
      break;
    case 1:
      _oppositemainmid = 2;
      break;
    case 2:
      _oppositemainmid = 1;
      break;
    case 3:
      _oppositemainmid = 0;
      break;
    default:
      _oppositemaintop = 3;
      break;
  }

  switch (_mainbot){
    case 0:
      _oppositemainbot = 3;
      break;
    case 1:
      _oppositemainbot = 2;
      break;
    case 2:
      _oppositemainbot = 1;
      break;
    case 3:
      _oppositemainbot = 0;
      break;
    default:
      _oppositemaintop = 3;
      break;
  }

  return [_maintop, _mainmid, _mainbot,
    _oppositemaintop, _oppositemainmid, _oppositemainbot,
    _previousmaintop, _previousmainmid, _previousmainbot,
    _oppositepreviousmaintop, _oppositepreviousmainmid, _oppositepreviousmainbot];
}

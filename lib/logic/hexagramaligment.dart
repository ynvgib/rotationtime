// used for LIST mixHexagramSlidersNew
import 'package:finallyicanlearn/models/lists.dart';

List<int> hexagramAlignment(int mainhexagram) {
  int maintop = 0,
      mainmid = 0,
      mainbot = 0;

  switch (mainhexagram) {
    //Quarter of Mutation
    case 1:
      maintop = 0;
      mainmid = 0;
      mainbot = 0;
      break;
    case 43:
      maintop = 1;
      mainmid = 0;
      mainbot = 0;
      break;
    case 14:
      maintop = 2;
      mainmid = 0;
      mainbot = 0;
      break;
    case 34:
      maintop = 3;
      mainmid = 0;
      mainbot = 0;
      break;
    case 9:
      maintop = 0;
      mainmid = 1;
      mainbot = 0;
      break;
    case 5:
      maintop = 1;
      mainmid = 1;
      mainbot = 0;
      break;
    case 26:
      maintop = 2;
      mainmid = 1;
      mainbot = 0;
      break;
    case 11:
      maintop = 3;
      mainmid = 1;
      mainbot = 0;
      break;
    case 10:
      maintop = 0;
      mainmid = 2;
      mainbot = 0;
      break;
    case 58:
      maintop = 1;
      mainmid = 2;
      mainbot = 0;
      break;
    case 38:
      maintop = 2;
      mainmid = 2;
      mainbot = 0;
      break;
    case 54:
      maintop = 3;
      mainmid = 2;
      mainbot = 0;
      break;
    case 61:
      maintop = 0;
      mainmid = 3;
      mainbot = 0;
      break;
    case 60:
      maintop = 1;
      mainmid = 3;
      mainbot = 0;
      break;
    case 41:
      maintop = 2;
      mainmid = 3;
      mainbot = 0;
      break;
    case 19:
      maintop = 3;
      mainmid = 3;
      mainbot = 0;
      break;

    //Quarter of Initiation
    case 13:
      maintop = 0;
      mainmid = 0;
      mainbot = 1;
      break;
    case 49:
      maintop = 1;
      mainmid = 0;
      mainbot = 1;
      break;
    case 30:
      maintop = 2;
      mainmid = 0;
      mainbot = 1;
      break;
    case 55:
      maintop = 3;
      mainmid = 0;
      mainbot = 1;
      break;
    case 37:
      maintop = 0;
      mainmid = 1;
      mainbot = 1;
      break;
    case 63:
      maintop = 1;
      mainmid = 1;
      mainbot = 1;
      break;
    case 22:
      maintop = 2;
      mainmid = 1;
      mainbot = 1;
      break;
    case 36:
      maintop = 3;
      mainmid = 1;
      mainbot = 1;
      break;
    case 25:
      maintop = 0;
      mainmid = 2;
      mainbot = 1;
      break;
    case 17:
      maintop = 1;
      mainmid = 2;
      mainbot = 1;
      break;
    case 21:
      maintop = 2;
      mainmid = 2;
      mainbot = 1;
      break;
    case 51:
      maintop = 3;
      mainmid = 2;
      mainbot = 1;
      break;
    case 42:
      maintop = 0;
      mainmid = 3;
      mainbot = 1;
      break;
    case 3:
      maintop = 1;
      mainmid = 3;
      mainbot = 1;
      break;
    case 27:
      maintop = 2;
      mainmid = 3;
      mainbot = 1;
      break;
    case 24:
      maintop = 3;
      mainmid = 3;
      mainbot = 1;
      break;

    //Quarter of Duality
    case 44:
      maintop = 0;
      mainmid = 0;
      mainbot = 2;
      break;
    case 28:
      maintop = 1;
      mainmid = 0;
      mainbot = 2;
      break;
    case 50:
      maintop = 2;
      mainmid = 0;
      mainbot = 2;
      break;
    case 32:
      maintop = 3;
      mainmid = 0;
      mainbot = 2;
      break;
    case 57:
      maintop = 0;
      mainmid = 1;
      mainbot = 2;
      break;
    case 48:
      maintop = 1;
      mainmid = 1;
      mainbot = 2;
      break;
    case 18:
      maintop = 2;
      mainmid = 1;
      mainbot = 2;
      break;
    case 46:
      maintop = 3;
      mainmid = 1;
      mainbot = 2;
      break;
    case 6:
      maintop = 0;
      mainmid = 2;
      mainbot = 2;
      break;
    case 47:
      maintop = 1;
      mainmid = 2;
      mainbot = 2;
      break;
    case 64:
      maintop = 2;
      mainmid = 2;
      mainbot = 2;
      break;
    case 40:
      maintop = 3;
      mainmid = 2;
      mainbot = 2;
      break;
    case 59:
      maintop = 0;
      mainmid = 3;
      mainbot = 2;
      break;
    case 29:
      maintop = 1;
      mainmid = 3;
      mainbot = 2;
      break;
    case 4:
      maintop = 2;
      mainmid = 3;
      mainbot = 2;
      break;
    case 7:
      maintop = 3;
      mainmid = 3;
      mainbot = 2;
      break;

    //Quarter of Civilization
    case 33:
      maintop = 0;
      mainmid = 0;
      mainbot = 3;
      break;
    case 31:
      maintop = 1;
      mainmid = 0;
      mainbot = 3;
      break;
    case 56:
      maintop = 2;
      mainmid = 0;
      mainbot = 3;
      break;
    case 62:
      maintop = 3;
      mainmid = 0;
      mainbot = 3;
      break;
    case 53:
      maintop = 0;
      mainmid = 1;
      mainbot = 3;
      break;
    case 39:
      maintop = 1;
      mainmid = 1;
      mainbot = 3;
      break;
    case 52:
      maintop = 2;
      mainmid = 1;
      mainbot = 3;
      break;
    case 15:
      maintop = 3;
      mainmid = 1;
      mainbot = 3;
      break;
    case 12:
      maintop = 0;
      mainmid = 2;
      mainbot = 3;
      break;
    case 45:
      maintop = 1;
      mainmid = 2;
      mainbot = 3;
      break;
    case 35:
      maintop = 2;
      mainmid = 2;
      mainbot = 3;
      break;
    case 16:
      maintop = 3;
      mainmid = 2;
      mainbot = 3;
      break;
    case 20:
      maintop = 0;
      mainmid = 3;
      mainbot = 3;
      break;
    case 8:
      maintop = 1;
      mainmid = 3;
      mainbot = 3;
      break;
    case 23:
      maintop = 2;
      mainmid = 3;
      mainbot = 3;
      break;
    case 2:
      maintop = 3;
      mainmid = 3;
      mainbot = 3;
      break;
    default:
      maintop = 0;
      mainmid = 0;
      mainbot = 0;
      break;
  }


  return [maintop, mainmid, mainbot];
}

List<int> hexagramCrossAlignment(int hexagramcross) {
  int oppositehex = 0,
      previoushex = 0,
      oppositeprevioushex = 0,
      hexagramindex = 0,
      hexagramquarter = 0;

  hexagramindex = orderHexagramsWheel.indexOf(hexagramcross);
  hexagramquarter = (hexagramindex / 16).floor();

  switch (hexagramquarter){
    case 0:
      oppositehex = orderHexagramsWheel[hexagramindex + 32];
      previoushex = orderHexagramsWheel[hexagramindex + 48];
      oppositeprevioushex = orderHexagramsWheel[hexagramindex + 16];
      break;
    case 1:
      oppositehex = orderHexagramsWheel[hexagramindex + 32];
      previoushex = orderHexagramsWheel[hexagramindex - 16];
      oppositeprevioushex = orderHexagramsWheel[hexagramindex + 16];
      break;
    case 2:
      oppositehex = orderHexagramsWheel[hexagramindex - 32];
      previoushex = orderHexagramsWheel[hexagramindex - 16];
      oppositeprevioushex = orderHexagramsWheel[hexagramindex + 16];
      break;
    case 3:
      oppositehex = orderHexagramsWheel[hexagramindex - 32];
      previoushex = orderHexagramsWheel[hexagramindex - 16];
      oppositeprevioushex = orderHexagramsWheel[hexagramindex - 48];
      break;
    default:
      break;
  }

  return [hexagramcross, oppositehex, previoushex, oppositeprevioushex];
}
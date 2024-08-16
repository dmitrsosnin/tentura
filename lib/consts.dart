const idLength = 13;
const codeLength = 7;
const titleMinLength = 3;
const titleMaxLength = 32;
const descriptionLength = 2048;

const snackBarDuration = Duration(seconds: 5);

const zeroNodeId = 'U000000000000';
const appLinkBase = String.fromEnvironment('APP_LINK_BASE');
const jwtExpiresIn = Duration(
  seconds: int.fromEnvironment('JWT_EXPIRES_IN', defaultValue: 3600),
);

final zeroDateTime = DateTime.fromMillisecondsSinceEpoch(0);

const pathIntro = '/intro';
const pathAuthLogin = '/login';
const pathHomeField = '/home/field';
const pathHomeConnect = '/home/connect';
const pathHomeUpdates = '/home/updates';
const pathHomeProfile = '/home/profile';
const pathHomeFavorites = '/home/favorites';
const pathAppLinkView = '/shared/view';
const pathProfileView = '/profile/view';
const pathProfileEdit = '/profile/edit';
const pathBeaconCreate = '/beacon/create';
const pathBeaconView = '/beacon/view';
const pathRating = '/rating';
const pathGraph = '/graph';

const anonymousPaths = [
  pathIntro,
  pathAuthLogin,
];

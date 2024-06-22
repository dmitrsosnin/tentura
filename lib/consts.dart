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

const pathAuthLogin = '/login';

const pathHomeField = '/home/field';
const pathHomeConnect = '/home/connect';
const pathHomeUpdates = '/home/updates';
const pathHomeProfile = '/home/profile';
const pathHomeFavorites = '/home/favorites';

const pathGraph = '/graph';
const pathRating = '/rating';

const pathProfileView = '/profile/view';
const pathProfileEdit = '/profile/edit';

const pathBeaconView = '/beacon/view';
const pathBeaconCreate = '/beacon/create';

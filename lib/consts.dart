const idLength = 13;
const codeLength = 7;
const titleMinLength = 3;
const titleMaxLength = 32;
const descriptionLength = 2048;

const snackBarDuration = Duration(seconds: 5);

const appTitle = 'Tentura';
const zeroNodeId = 'U000000000000';
const appLinkBase = String.fromEnvironment('APP_LINK_BASE');
const osmLinkBase = String.fromEnvironment(
  'OSM_LINK_BASE',
  defaultValue: 'tile.openstreetmap.org',
);
const jwtExpiresIn = Duration(
  seconds: int.fromEnvironment(
    'JWT_EXPIRES_IN',
    defaultValue: 3600,
  ),
);

final zeroDateTime = DateTime.fromMillisecondsSinceEpoch(0);

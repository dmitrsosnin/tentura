import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';

import 'package:gravity/consts.dart';

Future<Client> getGQLClient(Link authLink) async {
  return Client(
    defaultFetchPolicies: {
      OperationType.query: FetchPolicy.NoCache,
    },
    link: Link.from([
      authLink,
      HttpLink('https://$appLinkBase/v1/graphql'),
    ]),
  );
}

export 'package:ferry/ferry.dart'
    show DataSource, FetchPolicy, OperationResponse;

export 'exception.dart';
export 'tentura_api.dart' if (dart.library.js_interop) 'tentura_api_web.dart';

class StatusCode {
  // Success
  static const int ok = 200; // Request succeeded
  static const int created = 201; // Resource created successfully
  static const int accepted = 202; // Request accepted for processing

  // Client errors
  static const int badRequest = 400; // Bad request due to client error
  static const int unauthorized = 401; // Authentication is required
  static const int forbidden = 403; // Server understands request but refuses to authorize it
  static const int notFound = 404; // Requested resource could not be found
  static const int methodNotAllowed = 405; // HTTP method not allowed for the resource
  static const int conflict = 409; // Request conflicts with the current state of the resource
  static const int gone = 410; // Resource is no longer available

  // Server errors
  static const int internalServerError = 500; // Generic server error
  static const int notImplemented = 501; // Server does not recognize the request method
  static const int badGateway = 502; // Server received an invalid response from the upstream server
  static const int serviceUnavailable = 503; // Server is currently unable to handle the request
  static const int gatewayTimeout = 504; // Server did not receive a timely response from the upstream server
}

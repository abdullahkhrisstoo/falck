class StatusCodeApi {
  // Success
  static const int OK = 200; // Request succeeded
  static const int CREATED = 201; // Resource created successfully
  static const int NO_CONTENT  = 204; // Request accepted for processing

  // Client errors
  static const int BAD_REQUEST = 400; // Bad request due to client error
  static const int UNAUTHORIZED = 401; // Authentication is required
  static const int NOT_FOUND = 404; // Requested resource could not be found
  static const int METOHD_NOT_ALLOWED = 405; // HTTP method not allowed for the resource
  static const int VALIDATION = 422; // Request conflicts with the current state of the resource

  // Server errors
  static const int SERVER_ERROR = 500; // Generic server error

}


require_once(__DIR__ . '/data.hack');

<<__EntryPoint>>
function tokenOauth(): void {

  $server = \HH\global_get("_SERVER");
  if ($server is nonnull) {
    $post = \HH\global_get("_POST");

    $body = dict['client_id' => ''];
    $client_id = trim($body['client_id']);

    $data = getData();
    if(array_search($client_id, $data)) {
      $token = password_hash($client_id, PASSWORD_DEFAULT);

      json_encode(
        dict[
          "token_type" => "Bearer",
          "access_token" => $token,
        ],
      );
    } else {
      json_encode(
        dict[
          "error" => "404",
          "error_message" => "client_id not authorized",
        ],
      );
    }
  }
}

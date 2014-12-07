<?php
/*
 
 */


 echo ini_get('include_path');
require_once "Google_AuthNone.php";
require_once "Google_OAuth2.php";

/**
 * Abstract class for the Authentication in the API client
 * @author Chris Chabot <chabotc@google.com>
 *
 */
abstract class Google_Auth {
  abstract public function authenticate($service);
  abstract public function sign(Google_HttpRequest $request);
  abstract public function createAuthUrl($scope);

  abstract public function getAccessToken();
  abstract public function setAccessToken($accessToken);
  abstract public function setDeveloperKey($developerKey);
  abstract public function refreshToken($refreshToken);
  abstract public function revokeToken();
}

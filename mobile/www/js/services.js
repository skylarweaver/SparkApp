angular.module('starter.services', [])

.factory('Chargers', function($resource) {
  return $resource("http://localhost:3000/chargers/:id.json");
})


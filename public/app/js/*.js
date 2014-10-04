(function() {
  angular.module('birthday-corkboard', []).controller('birthdayCorkboardController', function($scope, $http) {
    $scope.getBirthdays = function() {
      return $http.get('/birthdays').success(function(data) {
        return $scope.birthdays = data;
      }).error(function(data) {
        return console.log('Error: ' + data);
      });
    };
    return $scope.getBirthdays();
  });

}).call(this);

(function() {
  angular.module('birthdayCorkboard').factory('Birthday', function($http) {
    var birthday, birthdays;
    birthday = {};
    birthdays = [];
    birthday.getBirthdays = function() {
      return birthdays;
    };
    birthday.initialize = function() {
      return $http.get('/birthdays').success(function(data) {
        var _i, _len;
        for (_i = 0, _len = data.length; _i < _len; _i++) {
          birthday = data[_i];
          birthdays.push(birthday);
        }
        return console.log('Done fetching');
      }).error(function(data) {
        return console.log('Error: ' + data);
      });
    };
    birthday.initialize();
    return birthday;
  });

}).call(this);

//# sourceMappingURL=birthday.js.map

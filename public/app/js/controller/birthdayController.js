(function() {
  angular.module('birthdayCorkboard').controller('BirthdayController', function($scope, Birthday) {
    var changeTitle, fetchBirthdays;
    $scope.birthdays = [];
    $scope.month = new Date().getMonth();
    $scope.getMonthName = function(month) {
      switch (month) {
        case 0:
          return 'January';
        case 1:
          return 'February';
        case 2:
          return 'March';
        case 3:
          return 'April';
        case 4:
          return 'May';
        case 5:
          return 'June';
        case 6:
          return 'July';
        case 7:
          return 'August';
        case 8:
          return 'September';
        case 9:
          return 'October';
        case 10:
          return 'November';
        case 11:
          return 'December';
      }
    };
    $scope.getMonthDay = function(date) {
      return new Date(parseInt(date, 10)).getDate();
    };
    changeTitle = function() {
      return $scope.title = "" + ($scope.getMonthName($scope.month)) + "'s Birthdays";
    };
    changeTitle();
    fetchBirthdays = function() {
      $scope.birthdays = Birthday.getBirthdays();
      return console.log('Done assigning');
    };
    $scope.previousMonth = function() {
      if ($scope.month > 0) {
        $scope.month = $scope.month - 1;
        changeTitle();
        return console.log("Month at " + $scope.month);
      }
    };
    $scope.nextMonth = function() {
      if ($scope.month < 11) {
        $scope.month = $scope.month + 1;
        changeTitle();
        return console.log("Month at " + $scope.month);
      }
    };
    return fetchBirthdays();
  }).filter('month', function() {
    return function(birthdays, month) {
      var birthday, date, filtered, _i, _len;
      filtered = [];
      for (_i = 0, _len = birthdays.length; _i < _len; _i++) {
        birthday = birthdays[_i];
        date = new Date(parseInt(birthday.birthday, 10));
        if (date.getMonth() === month) {
          filtered.push(birthday);
        }
      }
      console.log('Filtered by month');
      return filtered;
    };
  });

}).call(this);

angular.module('birthday-corkboard', []).controller('birthdayCorkboardController', ($scope, $http) ->

  $scope.getBirthdays = () ->
    $http.get('/birthdays')
      .success( (data) ->
        $scope.birthdays = data
      )
      .error( (data) ->
        console.log('Error' + data)
      )

  $scope.getBirthdays()
)


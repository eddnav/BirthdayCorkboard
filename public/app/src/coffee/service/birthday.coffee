angular.module 'birthdayCorkboard'
  .factory 'Birthday', ($http) ->

    birthday = {}

    birthdays = []

    birthday.getBirthdays = ->
        birthdays

    birthday.initialize = ->
      $http.get('/birthdays')
      
        .success (data) ->
          for birthday in data
            birthdays.push birthday
          console.log 'Done fetching'

        .error (data) -> console.log 'Error: ' + data

    birthday.initialize()

    birthday

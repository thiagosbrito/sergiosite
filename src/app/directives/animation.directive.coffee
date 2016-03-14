angular.module 'sergio'
  .directive 'fadeEffect', [
    '$animate'
    '$state',
    '$timeout',
    ($animate, $state, $timeout) ->
      {
        scope: 
          redirect: '&'
        link: (scope, element, attrs, form) ->
          scope.$on attrs.fade, ->
            $animate.addClass(element, attrs.fade).then ->
              if attrs.state
                $state.go attrs.state
              return
            return
          return

      }
    ]
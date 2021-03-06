JumpyView = require './jumpy-view'

module.exports =
    jumpyView: null
    config:
        fontSize:
            description: 'The font size of jumpy labels.'
            type: 'number'
            default: .75
            minimum: 0
            maximum: 1
        highContrast:
            description: 'This will display a high contrast label,
            usually green.  It is dynamic per theme.'
            type: 'boolean'
            default: false
        useHomingBeaconEffectOnJumps:
            description: 'This will animate a short lived homing beacon upon
            jump.  It is *temporarily* not working due to architectural
            changes in Atom.'
            type: 'boolean'
            default: true
        patternLength:
            description: 'Max length of pattern to search, minimum: 1, maximum: 2'
            type: 'number'
            default: 2
            minimum: 1
            maximum: 2

    activate: (state) ->
        @jumpyView = new JumpyView state.jumpyViewState

    deactivate: ->
        @jumpyView.destroy()
        @jumpyView = null

    serialize: ->
        jumpyViewState: @jumpyView.serialize()

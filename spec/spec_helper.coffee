beforeEach ->
  @addMatchers
    toHaveBound: (event, method) -> (@actual._callbacks[event] or []).indexOf(method) > -1
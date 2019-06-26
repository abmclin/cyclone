(import 
  (scheme base)
  ;(cyclone concurrent)
  ;(srfi 18)
  (shared-queue)
  (cyclone test))

(test-group "basic"
  (define q (make-queue))
  (test "predicate" #t (queue? q))
  (test "empty" #t (queue-empty? q))
  (test "empty" 0 (queue-size q))
  (queue-add! q 'a)
  (test "add a" #f (queue-empty? q))
  (test "add a" 1 (queue-size q))
  (queue-add! q 'b)
  (test "add b" #f (queue-empty? q))
  (test "add b" 2 (queue-size q))
  (queue-add! q 'c)
  (queue-add! q 'd)
  (queue-add! q 'e)
  (queue-add! q 'f)
  (queue-add! q 'g)
  (queue-add! q 'h)
  (queue-add! q 'i)
  (queue-add! q 'j)
  (test "add many" #f (queue-empty? q))
  (test "add many" 10 (queue-size q))
  (test "remove" 'a (queue-remove! q))
  (test "remove a - size" 9 (queue-size q))
  (test "remove" 'b (queue-remove! q))
  (test "remove" 'c (queue-remove! q))
  (test "remove" 'd (queue-remove! q))
  (test "remove d - size" 6 (queue-size q))
  
  (queue-add! q 'a)
  (queue-add! q 'b)
  (queue-add! q 'c)
  (queue-add! q 'd)
  (test "add many back" 10 (queue-size q))

  (queue-clear! q)
  (test "clear" 0 (queue-size q))
)

(test-exit)
(defmodule openstack-identity_tests
  (export all)
  (import
    (from lfeunit-util
          (check-failed-assert 2)
          (check-wrong-assert-exception 2))
    (from lfeunit
          (assert 1)
          (assert-not 1)
          (assert-equal 2)
          (assert-not-equal 2)
          (assert-exception 3)
          (assert-error 2)
          (assert-throw 2)
          (assert-exit 2))
    (from openstack-identity
          (build-creds 3)
          (get-password-auth-payload 2)
          (get-apikey-auth-payload 2))))


(defun build-creds-password_test ()
  (let ((data (build-creds '"alice" 'password '"asecret"))
        (expected #((#(passwordCredentials
                        #((#(username #B(97 108 105 99 101))
                             #(password #B(97 115 101 99 114 101 116)))))))))
    (assert-equal expected data)))

; XXX this unit test is currently broken
(defun get-password-auth-payload_test_skip ()
  (let ((data (get-password-auth-payload '"alice" '"asecret"))
        (expected `'""))
    (: lfe-utils dump-data '"passwd-data" data)
    (assert-equal expected data)))

; XXX this unit test is currently broken
(defun get-apikey-auth-payload_test_skip ()
  (let ((data (get-apikey-auth-payload '"alice" '"123abc"))
        (expected `'""))
    (: lfe-utils dump-data '"apikey-data" (: io_lib format '"~s~n" (list data)))
    (assert-equal expected data)))


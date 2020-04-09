(load "/run/media/root/704C84D94C849B8A/lisp-environment/packages/quicklisp/setup.lisp")
;; (require :html)
(ql:quickload '(cl-who cl-fad drakma hunchentoot cl-html-parse flexi-streams ))

(defvar *ac* (make-instance 'hunchentoot:easy-acceptor :port 4242))

(hunchentoot:start *ac*)



;; ????���ֱ���ø���ַΪ��̬��ҳ
;; (defvar *ac* (make-instance 'hunchentoot:acceptor :port 4242 :document-root  "web/lispsu/hello.html"))
;; (hunchentoot:start *ac*)

;; (push (hunchentoot:create-static-file-dispatcher-and-handler
;;               "/hello.html" "~/web/lispsu/hello.html")
;;               hunchentoot:*dispatch-table*)

;; �������ִ��˳���Ƿ����Ч�����Ӱ�죬�ƺ�������������������ǰִ�б��������Ч��
(hunchentoot:define-easy-handler (test-handler :uri "/test")
    ((name :init-form "Pumpkin"))
  (format nil "<!doctype html><title>Common Lisp Recipes</title><body>Yo, ~A!  The Lisp time is ~A.</body>"
	  name (get-universal-time)))

(hunchentoot:define-easy-handler (test-handler :uri "/foo")
    ((name :init-form "(+ 1 1)"))
  (write-to-string  (eval (foo name))))
  
  (concatenate 'string name "cd"))

  (format nil "<!doctype html><title>Common Lisp Recipes</title><body>The form of is ~A, and the result is ~A.</body>"
	  name (eval (read-from-string name))))

(push (hunchentoot:create-folder-dispatcher-and-handler"/hello/" "~/web/lispsu/")
      hunchentoot:*dispatch-table*)

(ql:quickload "hunchentoot-test")
;; (push (hunchentoot:create-static-file-dispatcher-and-handler
;;               "/hello.html/lisp_logo.jpg" "~/web/lisp_logo.jpg")
;;               hunchentoot:*dispatch-table*)


(define-easy-handler (easy-demo :uri "/hunchentoot/test/foo-demo.html"
                                :default-request-type :post)
    (first-name )
  (with-html
    (:html
     (:head (:title "Hunchentoot \"easy\" handler example"))
     (:body
      (:h2 
       " \"Easy\" handler example")
      (:p (:form :method :post
           (:table :border 1 :cellpadding 2 :cellspacing 0
            (:tr
             (:td "First Name:")
             (:td (:input :type :text
                   :name "first-name"
                   :value (write-to-string (eval (read-from-string first-name))))))
		   
            (:tr
             (:td :colspan 2
              (:input :type "submit"))))))
;      (info-table first-name)
      ))))

(define-easy-handler (easy-demo :uri "/hunchentoot/test/foo-demo.html"
                                :default-request-type :post)
    (first-name )
  (with-html
    (:html
     (:head (:title "Hunchentoot \"easy\" handler example"))
     (:body
      (:h2 
       " \"Easy\" handler example")
      (:p (:form :method :post
           (:table :border 1 :cellpadding 2 :cellspacing 0
		   (:tr
		    (:td "�Ի�:")
		    (:td (:input :type :text
				 :name "first-name"
				 :value first-name)))
            (:tr
             (:td "������:")
             (:td (:input :type :text
                   :name "first-name"
                   :value (pat-match::chat first-name))))
		   
            (:tr
             (:td :colspan 2
              (:input :type "submit"))))))
;      (info-table first-name)
      ))))



require 'test_helper'

class NotifyTest < ActionMailer::TestCase
  test "sto" do
    mail = Notify.new_sto(form_stos(:one))
    assert_equal 'Новая заявка: СТО', mail.subject
    assert_equal ['serwhite@mail.ru'], mail.to
    assert_equal ['no-reply@example.com'], mail.from
    assert_match form_stos(:one).name, mail.body.encoded
  end
end

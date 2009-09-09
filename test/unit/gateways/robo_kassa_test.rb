require 'test_helper'

class RoboKassaTest < Test::Unit::TestCase
  def setup
    @gateway = RoboKassaGateway.new(
                 :login => 'login',
                 :password1 => 'password',
                 :password2 => 'password1'
               )

    @options = { 

    }
  end

  def test_should_result_html_code_pay_button
    assert_equal " <form action='http://test.robokassa.ru/Index.aspx' method=POST><input type=hidden name=MrchLogin value='login'<input type=hidden name=OutSum value='12'><input type=hidden name=InvId value='3'><input type=hidden name=Desc value=''><input type=hidden name=SignatureValue value=8d8b8cf6a5dce5c39053eb2eae0b8296><input type=hidden name=IncCurrLabel value=><input type=hidden name=Culture value=RU><input type=submit value='\320\236\320\277\320\273\320\260\321\202\320\270\321\202\321\214'></form>", @gateway.payment_button({:summa => 12, :invoice => 3 })
  end
  def test_should_not_result_html_code_pay_button
    assert_equal false, @gateway.payment_button({ :invoice => 3 })
  end
  
  def test_should_result_html_code_pay_kassa
   assert_equal "<script language=JavaScript src='http://test.robokassa.ru/MrchSumPreview.ashx?MrchLogin=login&OutSum=12&InvId=3&IncCurrLabel=&Desc=&SignatureValue=8d8b8cf6a5dce5c39053eb2eae0b8296&Culture=RU&Encoding=utf-8'> </script>", @gateway.payment_kassa({:summa => 12, :invoice => 3 })
  end  
  def test_should_not_result_html_code_pay_kassa
   assert_equal false, @gateway.payment_kassa({ :invoice => 3 })
  end 
end

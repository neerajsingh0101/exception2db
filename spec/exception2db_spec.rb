require File.dirname(__FILE__) + '/spec_helper'

describe Exception2db do

  it { should validate_presence_of(:exception) }

  describe "when exception is blank and record is saved with false option" do
    subject { Exception2db.new(:exception => nil) }
    # Pass 'false' to 'save' in order to skip the validations.
    it "should raise an exception" do
      lambda { subject.save(false) }.should raise_exception(ActiveRecord::StatementInvalid)
    end
  end

  describe "should be able to create a new record" do
    subject { Exception2db.create(:exception => 'hello world') }
    it "should be false for new_record?" do
      subject.new_record?.should be_false
    end
  end

  context "attributes" do
    subject { Exception2db.create(:exception => $exception_data_xml) }

    it "#cgi_data should have HTTP_HOST" do
      subject.cgi_data.fetch('HTTP_HOST').should == 'localhost:3000'
    end

    it "#cgi_data should have HTTP_ACCEPT_ENCODING" do
      subject.cgi_data.fetch('HTTP_ACCEPT_ENCODING').should == 'gzip,deflate'
    end

    it "#parameters" do
      subject.parameters.should == '{ :action => index , :controller => exception2db/main }'
    end

    it "#formatted_backtrace" do
      subject.formatted_backtrace.should ==
      "<p>[PROJECT_ROOT]/vendor/plugins/exception2db/app/controllers/exception2db/main_controller.rb:10:in index</p>" <<
      "<p>[GEM_ROOT]/gems/actionpack-2.3.5/lib/action_controller/base.rb:1331:in send</p>"
    end

    it "#top_file_and_line_number" do
      subject.top_file_and_line_number.should == '[PROJECT_ROOT]/vendor/plugins/exception2db/app/controllers/exception2db/main_controller.rb:10'
    end

    it "#environment" do
      subject.environment.should == 'production'
    end

    it "#url" do
      subject.url.should == 'http://localhost:3000/exception2db'
    end

    it "#controller" do
      subject.controller.should == 'exception2db/main'
    end

    it "#action" do
      subject.action.should == 'index'
    end

    it "#error_message" do
      subject.error_message.should == 'RuntimeError: 46'
    end

    it "#user_agent" do
      subject.user_agent.should == "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_3; en-US)" <<
      " AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375.38 Safari/533.4"
    end

  end

end

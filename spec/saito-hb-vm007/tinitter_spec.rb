require 'spec_helper'

describe "Tinitterのデプロイ" do
  describe "Tinitter用のMySQLユーザで接続できる" do
    describe command('mysql -h 127.0.0.1 -utinitter_user -ptinitter_pass tinitter -e "SELECT * FROM posts"') do
      its(:exit_status) { should eq 0 }
    end
  end

  describe "ルートディレクトリを取得した際にTinitterと書かれたページが返される" do
    describe command('curl http://localhost/') do
      its(:stdout) { should match /Tinitter/ }
    end
  end
end

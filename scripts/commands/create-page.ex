Code.require_file("../qtools/qdev.ex", __DIR__)
Code.require_file("../qtools/qcli.ex", __DIR__)

defmodule Main do
  def run do
    QDev.debug("we are in the create-page script")
    QCli.message("this will create a new page in the React Site", "info")
  end
end

Main.run()

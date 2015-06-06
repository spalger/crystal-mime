require "spec"
require "../src/mime"

describe "mime helper" do
  it "provides the mime-type for an extension" do
    Mime.from_ext("json").should eq("application/json")
    Mime.from_ext("jpg").should eq("image/jpeg")
    Mime.from_ext("js").should eq("application/javascript")
  end

  it "provides the extension for a mimetype" do
    Mime.to_exts("application/json").should eq("json")
    Mime.to_exts("image/jpeg").should eq("jpeg")
    Mime.to_exts("application/javascript").should eq("js")
  end
end

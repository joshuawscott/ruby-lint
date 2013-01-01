require File.expand_path('../../../../helper', __FILE__)

describe 'Parsing while statements' do
  should 'parse a multi line statement' do
    code = <<-CODE
while foo
  bar
end
    CODE

    parse(code).should == s(
      :while,
      s(:method, 'foo', [], nil, nil),
      [s(:method, 'bar', [], nil, nil)]
    )
  end

  should 'parse a single line statement' do
    parse('bar while foo').should == s(
      :while,
      s(:method, 'foo', [], nil, nil),
      [s(:method, 'bar', [], nil, nil)]
    )
  end
end

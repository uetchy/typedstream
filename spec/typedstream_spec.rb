require 'spec_helper'

describe Typedstream do
  it 'has a version number' do
    expect(Typedstream::VERSION).not_to be nil
  end

  it 'can parse NSString' do
    str = open('spec/fixtures/NSString', 'rb').read
    str_nil = open('spec/fixtures/NSString', 'rb').read
    expect(Typedstream::Parser.parse(str)).to eq('abcdefgABCDEFG!?@[]/+*^&-_')
    expect(Typedstream::Parser.parse(str_nil)).to eq('')
  end

  it 'can parse NSNumber' do
    num1d = open('spec/fixtures/NSNumberWith1digit', 'rb').read
    num2d = open('spec/fixtures/NSNumberWith2digits', 'rb').read
    num3d = open('spec/fixtures/NSNumberWith3digits', 'rb').read
    num4d = open('spec/fixtures/NSNumberWith4digits', 'rb').read
    num5d = open('spec/fixtures/NSNumberWith5digits', 'rb').read
    expect(Typedstream::Parser.parse(num1d)).to eq(1)
    expect(Typedstream::Parser.parse(num2d)).to eq(22)
    expect(Typedstream::Parser.parse(num3d)).to eq(333)
    expect(Typedstream::Parser.parse(num4d)).to eq(4444)
    expect(Typedstream::Parser.parse(num5d)).to eq(55555)
  end

  it 'can parse NSArray' do
    arr_empty = open('spec/fixtures/NSArrayEmpty', 'rb').read
    arr_str = open('spec/fixtures/NSArrayWithNSString', 'rb').read
    arr_bool = open('spec/fixtures/NSArrayWithBool', 'rb').read
    arr_num = open('spec/fixtures/NSArrayWithNSNumber', 'rb').read
    arr_mixed = open('spec/fixtures/NSArrayWithMixedType', 'rb').read
    arr_nested = open('spec/fixtures/NSArrayWithNestedArray', 'rb').read
    expect(Typedstream::Parser.parse(arr_empty)).to eq([])
    expect(Typedstream::Parser.parse(arr_str)).to eq(["abc", "def", "012"])
    expect(Typedstream::Parser.parse(arr_bool)).to eq([true, false])
    expect(Typedstream::Parser.parse(arr_num)).to eq([0, 1, 2, 3, 4, 5])
    expect(Typedstream::Parser.parse(arr_mixed)).to eq(["abc", 123, 0.5, true])
    expect(Typedstream::Parser.parse(arr_nested)).to eq(["first", ["second", ["third", 3], 2], 1])
  end

  it 'can parse NSDictionary' do
    dict = open('spec/fixtures/NSDictionary', 'rb').read
    expect(Typedstream::Parser.parse(dict)).to eq({"key": 123})
  end
end

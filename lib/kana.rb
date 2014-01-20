# -*- coding: utf-8 -*-
require "kana/table"
require "kana/version"

module Kana
  module_function

  def table(type = nil)
    table = case type
            when :dakuon    then DAKUON
            when :handakuon then HANDAKUON
            else                 TABLE
            end
    Kana.reject_empty(table.flatten)
  end

  def column(char)
    Kana.reject_empty(TABLE.assoc(char))
  end

  def column_all(char)
    table = Kana.column(char).map { |char| [char, Kana.dakuon(char), Kana.handakuon(char)] }
    Kana.reject_empty(table)
  end

  def row(char)
    Kana.reject_empty(TABLE.transpose.assoc(char))
  end

  def row_all(char)
    table = Kana.row(char).map { |char| [char, Kana.dakuon(char), Kana.handakuon(char)] }
    Kana.reject_empty(table)
  end

  def dakuon(char)
    index = TABLE.flatten.index(char)
    DAKUON.flatten[index]
  end

  def handakuon(char)
    index = TABLE.flatten.index(char)
    HANDAKUON.flatten[index]
  end

  def reject_empty(array)
    array.reject!{ |a| a.empty? }
    array.map{ |a| a.respond_to?(:each) ? Kana.reject_empty(a) : a }
  end
end

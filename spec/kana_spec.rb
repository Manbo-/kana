# -*- coding: utf-8 -*-
require 'spec_helper'

describe Kana do
  it 'should have a version number' do
    Kana::VERSION.should_not be_nil
  end

  describe ".table" do
    it do
      expect(Kana.table.size).to eq 46
    end

    it do
      expect(Kana.table(:dakuon).size).to eq 20
    end

    it do
      expect(Kana.table(:handakuon).size).to eq 5
    end
  end


  describe ".column" do
    it do
      expect(Kana.column("あ")).to eq %w(あ い う え お)
    end
  end

  describe ".column_all" do
    it do
      expect(Kana.column_all("は")).to eq [%w(は ば ぱ), %w(ひ び ぴ), %w(ふ ぶ ぷ), %w(へ べ ぺ), %w(ほ ぼ ぽ)]
    end
  end

  describe ".row" do
    it do
      expect(Kana.row("あ")).to eq %w(あ か さ た な は ま や ら わ ん)
    end
  end

  describe ".row_all" do
    it do
      expect(Kana.row_all("あ")).to eq [%w(あ), %w(か が), %w(さ ざ), %w(た だ), %w(な), %w(は ば ぱ), %w(ま), %w(や), %w(ら), %w(わ), %w(ん)]
    end
  end

  describe ".dakuon" do
    it do
      expect(Kana.dakuon("た")).to eq "だ"
    end
  end

  describe ".handakuon" do
    it do
      expect(Kana.handakuon("ふ")).to eq "ぷ"
    end
  end
end

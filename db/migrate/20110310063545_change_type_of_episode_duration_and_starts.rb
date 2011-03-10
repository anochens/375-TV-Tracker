class ChangeTypeOfEpisodeDurationAndStarts < ActiveRecord::Migration
  def self.up
	  change_table :episodes do |t|
	    t.change :duration, :string
	    t.change :start_est, :string
	    t.change :start_cst, :string
	    t.change :start_pst, :string
	  end
  end

  def self.down
  end
end

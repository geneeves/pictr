require 'spec_helper'

describe Photo do
  it { should belong_to :album }
  it { should validate_presence_of :name }
  it { should validate_presence_of :album_id }

  it { should have_attached_file(:image) }


end

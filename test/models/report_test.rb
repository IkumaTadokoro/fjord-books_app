# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @owner = create(:alice)
    @not_owner_user = create(:bob)
    @report = create(:report, user_id: @owner.id)
  end

  test '#editable?' do
    assert @report.editable?(@owner)
    assert_not @report.editable?(@not_owner_user)
  end

  test '#created_on?' do
    assert_equal(Date.current, @report.created_on)
  end
end

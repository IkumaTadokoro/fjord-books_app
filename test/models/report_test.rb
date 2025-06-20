# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    owner = create(:user)
    not_owner_user = create(:user)
    report = create(:report, user: owner)
    assert report.editable?(owner)
    assert_not report.editable?(not_owner_user)
  end

  test '#created_on?' do
    report = create(:report)
    assert_equal(Date.current, report.created_on)
  end
end

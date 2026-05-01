# Chess CLI  Copyright (C) 2026  Kezy-d4
# This software is licensed under the GNU GPLv3.
# See the full license: https://www.gnu.org/licenses/gpl-3.0.en.html

# frozen_string_literal: true

# Extending core class Hash
module HashExtensions
  refine Hash do
    def delete_empty_arr_vals
      return unless values.all?(Array)

      delete_if { |_key, arr| arr.compact.empty? }
    end

    def wrap_vals_in_arr
      return unless values.none?(Array)

      transform_values { |val| [val] }
    end
  end
end

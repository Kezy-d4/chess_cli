# Chess CLI  Copyright (C) 2026  Kezy-d4
# This software is licensed under the GNU GPLv3.
# See the full license: https://www.gnu.org/licenses/gpl-3.0.en.html

# frozen_string_literal: true

# Extending core class Object
module ObjectExtensions
  refine Object do
    def to_class_s
      class_s = self.class.to_s
      class_s.slice!('Chess::')
      class_s
    end
  end
end

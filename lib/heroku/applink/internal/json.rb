# frozen_string_literal: true

# Copyright (c) 2026, Salesforce, Inc.
# All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause
# For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause

require "json"

module Heroku
  module AppLink
    # @api private
    module Internal
      # @api private
      module Json
        module_function

        def parse_object(data)
          text = data.b.force_encoding(Encoding::UTF_8)
          return nil unless text.valid_encoding?

          value = begin
            JSON.parse(text, allow_comments: false, allow_duplicate_key: true, max_nesting: false)
          rescue JSON::ParserError
            nil
          end
          value.is_a?(Hash) ? value : nil
        end

        def non_empty_string?(value)
          value.is_a?(String) && !value.empty?
        end
      end
    end
  end
end

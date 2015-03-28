module Hamlit
  module Filters
    class Base
      def compile(lines)
        raise NotImplementedError
      end

      private

      def compile_lines(lines, indent_width: 0)
        base  = (lines.first || '').index(/[^\s]/) || 0
        width = indent_width - base
        width = 0 if width < 0

        lines = strip_last(lines).map do |line|
          ' ' * width + line
        end

        text = lines.join("\n") + "\n"
        text
      end

      # NOTE: empty line is reserved for preserve filter.
      def strip_last(lines)
        lines = lines.dup
        while lines.last && lines.last.length == 0
          lines.delete_at(-1)
        end
        lines
      end
    end
  end
end

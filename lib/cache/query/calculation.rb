module Cache
  module Query
    class Calculation < Abstract
      def initialize(active_record, operation, column, options1, options2)
        super(active_record, options1, options2)
        @operation, @column = operation, column
      end

      def perform(&block)
        super({}, { :raw => true }, block, block)
      end

      protected
      def format_results(objects)
        objects.to_i
      end
      
      def serialize_objects(index, objects)
        objects.to_s
      end

      def cacheable?(options1, options2)
        @column == :all && super(options1, options2)
      end

      def cache_keys
        "#{super}/#{@operation}"
      end
    end
  end
end
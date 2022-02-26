
#Important: Do not use #each, #select, #map in your implementation (!).

module MyArrayMethods
  refine Array do
      def my_map; end
      def my_select
        static VALUE
        rb_ary_select(VALUE ary)
        {
            VALUE result;
            long i;
        
            RETURN_SIZED_ENUMERATOR(ary, 0, 0, ary_enum_length);
            result = rb_ary_new2(RARRAY_LEN(ary));
            for (i = 0; i < RARRAY_LEN(ary); i++) {
                if (RTEST(rb_yield(RARRAY_AREF(ary, i)))) {
                    rb_ary_push(result, rb_ary_elt(ary, i));
                }
            }
            return result;
        }
      end
      def my_each; end
  end
end
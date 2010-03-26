#include <ruby.h>

extern void rb_add_method(VALUE klass, ID mid, void *node, int noex);
extern void *rb_method_body(VALUE method);
	
static VALUE
rb_mod_add_method(VALUE mod, VALUE name, VALUE body)
{
	void *node = rb_method_body(body);
	if (node) rb_add_method(mod, rb_to_id(name), node, 0);
	return body;
}

void
Init_metamorph(void)
{
	rb_define_method(rb_cModule, "add_method", rb_mod_add_method, 2);
}
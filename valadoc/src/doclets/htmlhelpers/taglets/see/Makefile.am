NULL =


AM_CFLAGS =  -g                  \
	-I ../../../../libvaladoc/   \
	-I ../../doclet/             \
	$(GLIB_CFLAGS)               \
	$(LIBVALA_CFLAGS)            \
	$(NULL)


BUILT_SOURCES = libtagletsee.vala.stamp


tagletseedir = $(libdir)/valadoc/plugins/htmlhelpers/taglets/


tagletsee_LTLIBRARIES = \
	libtagletsee.la     \
	$(NULL)


libtagletsee_la_VALASOURCES = \
	taglet.vala               \
	$(NULL)


libtagletsee_la_SOURCES =                \
	libtagletsee.vala.stamp              \
	$(libtagletsee_la_VALASOURCES:.vala=.c) \
	$(NULL)


libtagletsee.vala.stamp: $(libtagletsee_la_VALASOURCES)
	$(VALAC) -C --vapidir ../../../../vapi --pkg valadoc-1.0 --vapidir ../../doclet/ --pkg libhtmlhelpers-1.0 --basedir . $^
	touch $@


libtagletsee_la_LDFLAGS = -module -avoid-version


libtagletsee_la_LIBADD =                 \
	../../../../libvaladoc/libvaladoc.la \
	$(LIBGVC_LIBS)                       \
	$(LIBVALA_LIBS)                      \
	$(GLIB_LIBS)                         \
	$(NULL)


EXTRA_DIST = $(libtagletsee_la_VALASOURCES)  libtagletsee.vala.stamp 


MAINTAINERCLEANFILES =                      \
	$(libtagletsee_la_VALASOURCES:.vala=.c) \
	$(NULL)


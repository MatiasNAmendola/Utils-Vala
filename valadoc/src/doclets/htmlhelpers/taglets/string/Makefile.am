NULL =


AM_CFLAGS =  -g                  \
	-I ../../../../libvaladoc/   \
	-I ../../doclet/             \
	$(GLIB_CFLAGS)               \
	$(LIBVALA_CFLAGS)            \
	$(NULL)


BUILT_SOURCES = libtagletstring.vala.stamp


tagletstringdir = $(libdir)/valadoc/plugins/htmlhelpers/taglets/


tagletstring_LTLIBRARIES =    \
	libtagletstring.la  \
	$(NULL)


libtagletstring_la_VALASOURCES = \
	taglet.vala                  \
	$(NULL)


libtagletstring_la_SOURCES =                \
	libtagletstring.vala.stamp              \
	$(libtagletstring_la_VALASOURCES:.vala=.c) \
	$(NULL)


libtagletstring.vala.stamp: $(libtagletstring_la_VALASOURCES)
	$(VALAC) -C --vapidir ../../../../vapi --pkg valadoc-1.0 --vapidir ../../doclet/ --pkg libhtmlhelpers-1.0 --basedir . $^
	touch $@


libtagletstring_la_LDFLAGS = -module -avoid-version


libtagletstring_la_LIBADD =              \
	../../../../libvaladoc/libvaladoc.la \
	$(LIBGVC_LIBS)                       \
	$(LIBVALA_LIBS)                      \
	$(GLIB_LIBS)                         \
	$(NULL)


EXTRA_DIST = $(libtagletstring_la_VALASOURCES)  libtagletstring.vala.stamp 


MAINTAINERCLEANFILES =                         \
	$(libtagletstring_la_VALASOURCES:.vala=.c) \
	$(NULL)


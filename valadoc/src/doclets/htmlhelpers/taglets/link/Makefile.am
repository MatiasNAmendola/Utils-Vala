NULL =


AM_CFLAGS =  -g                  \
	-I ../../../../libvaladoc/   \
	-I ../../doclet/             \
	$(GLIB_CFLAGS)               \
	$(LIBVALA_CFLAGS)            \
	$(NULL)


BUILT_SOURCES = libtagletlink.vala.stamp


tagletlinkdir = $(libdir)/valadoc/plugins/htmlhelpers/taglets/


tagletlink_LTLIBRARIES =  \
	libtagletlink.la  \
	$(NULL)


libtagletlink_la_VALASOURCES = \
	taglet.vala                \
	$(NULL)


libtagletlink_la_SOURCES =                \
	libtagletlink.vala.stamp              \
	$(libtagletlink_la_VALASOURCES:.vala=.c) \
	$(NULL)


libtagletlink.vala.stamp: $(libtagletlink_la_VALASOURCES)
	$(VALAC) -C --vapidir ../../../../vapi --pkg valadoc-1.0 --vapidir ../../doclet/ --pkg libhtmlhelpers-1.0 --basedir . $^
	touch $@


libtagletlink_la_LDFLAGS = -module -avoid-version


libtagletlink_la_LIBADD =                \
	../../../../libvaladoc/libvaladoc.la \
	$(LIBGVC_LIBS)                       \
	$(LIBVALA_LIBS)                      \
	$(GLIB_LIBS)                         \
	$(NULL)


EXTRA_DIST = $(libtagletlink_la_VALASOURCES)  libtagletlink.vala.stamp 


MAINTAINERCLEANFILES =                       \
	$(libtagletlink_la_VALASOURCES:.vala=.c) \
	$(NULL)


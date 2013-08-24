/*
 * Valadoc - a documentation tool for vala.
 * Copyright (C) 2008 Florian Brosch
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */


using GLib;
using Gee;


namespace Valadoc.Html {
	public class SinceTaglet : Valadoc.MainTaglet {
		public override int order { get { return 400; } }
		private StringTaglet content;

		public override bool write_block_start ( void* ptr ) {
			weak GLib.FileStream file = (GLib.FileStream)ptr;
			file.printf ( "<h2 class=\"%s\">Since:</h2>\n", css_title );
			return true;
		}

		public override bool write_block_end ( void* res ) {
			return true;
		}

		public override bool write ( void* res, int max, int index ) {
			((GLib.FileStream)res).printf ( "%s", this.content.content );
			if ( max != index+1 )
				((GLib.FileStream)res).puts ( ", " );

			return true;
		}

		public override bool parse ( Settings settings, Tree tree, DocumentedElement me, Gee.Collection<DocElement> content, out string[] errmsg ) {
			if ( content.size != 1 ) {
				errmsg = new string[1];
				errmsg[0] = "Version name was expected.";
				return false;
			}

			Gee.Iterator<DocElement> it = content.iterator ();
			it.next ();

			DocElement element = it.get ();
			if ( element is StringTaglet == false ) {
				errmsg = new string[1];
				errmsg[0] = "Version name was expected.";
				return false;
			}

			this.content = (StringTaglet)element;
			return true;
		}
	}
}


[ModuleInit]
public GLib.Type register_plugin ( Gee.HashMap<string, Type> taglets ) {
	    GLib.Type type = typeof ( Valadoc.Html.SinceTaglet );
		taglets.set ( "since", type );
		return type;
}


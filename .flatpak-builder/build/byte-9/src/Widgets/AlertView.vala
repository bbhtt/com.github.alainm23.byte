/*
* Copyright © 2019 Alain M. (https://github.com/alainm23/byte)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Alain M. <alain23@protonmail.com>
*/
 
public class Widgets.AlertView : Gtk.Grid {
    public string title {
        get {
            return title_label.label;
        }
        set {
            title_label.label = value;
        }
    }

    public string description {
        get {
            return description_label.label;
        }
        set {
            description_label.label = value;
        }
    }

    public string icon_name {
        owned get {
            return image.icon_name ?? "";
        }
        set {
            if (value != null && value != "") {
                image.gicon = new ThemedIcon (value);
                image.pixel_size = 32;
                image.no_show_all = false;
                image.show ();
            } else {
                image.no_show_all = true;
                image.hide ();
            }
        }
    }

    private Gtk.Label title_label;
    private Gtk.Label description_label;
    private Gtk.Image image;
    public AlertView (string title, string description, string icon_name) {
        Object (
            title: title,
            description: description,
            icon_name: icon_name
        );
    }

    construct {
        get_style_context ().add_class (Gtk.STYLE_CLASS_VIEW);
        expand = true;

        title_label = new Gtk.Label (null);
        title_label.halign = Gtk.Align.CENTER;
        title_label.hexpand = true;
        title_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        title_label.max_width_chars = 75;
        title_label.wrap = true;
        title_label.wrap_mode = Pango.WrapMode.WORD_CHAR;
        title_label.xalign = 0;

        description_label = new Gtk.Label (null);
        description_label.hexpand = true;
        description_label.max_width_chars = 75;
        description_label.wrap = true;
        //description_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        description_label.use_markup = true;
        description_label.xalign = 0;
        description_label.valign = Gtk.Align.START;
        description_label.halign = Gtk.Align.CENTER;

        image = new Gtk.Image ();
        image.opacity = 1;
        image.margin_bottom = 6;
        image.valign = Gtk.Align.START;

        var layout = new Gtk.Grid ();
        //layout.get_style_context ().add_class ("label-color-primary");
        layout.orientation = Gtk.Orientation.VERTICAL;
        layout.row_spacing = 0;
        layout.halign = Gtk.Align.CENTER;
        layout.valign = Gtk.Align.START;
        layout.vexpand = true;
        layout.margin = 24;
        layout.margin_top = 64;

        layout.add (image);
        layout.add (title_label);
        layout.add (description_label);

        add (layout);
    }
}

#!/bin/sh

layout_f=/tmp/kb_layout

case $(cat "$layout_f") in
us)
	hyprctl keyword input:kb_layout tr
	echo tr >$layout_f
	;;
il)
	hyprctl keyword input:kb_layout us
	echo us >$layout_f
	;;
esac

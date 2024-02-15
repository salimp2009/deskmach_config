local M = {
	"L3MON4D3/LuaSnip",
	commit = "3d2ad0c0fa25e4e272ade48a62a185ebd0fe26c1",
	event = "InsertEnter",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
}

function M.config()
	local ls = require("luasnip")
	local s = ls.snippet
	local i = ls.insert_node
	local fmt = require("luasnip.extras.fmt").fmt

	ls.config.set_config({
		history = true, --keep around last snippet local to jump back
		updateevents = "TextChanged,TextChangedI", --update changes as you type
		enable_autosnippets = true,
	})

	ls.add_snippets("cpp", {
		s(
			"aoc",
			fmt(
				[[
#include <fstream>
#include <functional>
#include <iostream>
#include <string>

using std::cout, std::cin, std::string;

int main() {{
    std::ifstream myfile("input.txt");

    if (!myfile) {{
        std::cerr << "Input file cannot be opened for reading.\n";

        return 1;
    }}

    while (myfile) {{
        string line;
        myfile >> line;
        if (line.empty()) {{
            break;
        }}
        {}
    }}
    myfile.close();
    return 0;
}}
]],
				{
					i(1),
				}
			)
		),
	})

	ls.add_snippets("rust", {
		s(
			"cc",
			fmt(
				[[
use std::io;

fn solution() {{
    let mut input_nums = String::new();
    io::stdin().read_line(&mut input_nums).expect("failed to read line");
    let mut iter= input_nums.split_whitespace();
    let x: i32 = iter.next().unwrap().parse().expect("input not an integer");
    let y: i32 = iter.next().unwrap().parse().expect("input not an integer");
	{}
}}

fn main() {{
    let mut t = String::new();
    io::stdin().read_line(&mut t).expect("Failed to read line");
    let mut t: i32 = t.trim().parse().expect("Input not an integer");
    while t > 0 {{
        solution();
        t -= 1;
    }}
}}
			]],
				{
					i(1),
				}
			)
		),
	})
end

return M

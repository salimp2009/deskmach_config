local ls = require("luasnip")
local s = ls.s
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
-- local shared = R("luasnippets")
-- local same = shared.same

local snippet = ls.s
local f = ls.function_node

local shortcut = function(val)
	if type(val) == "string" then
		return { t({ val }), i(0) }
	end

	if type(val) == "table" then
		for k, v in ipairs(val) do
			if type(v) == "string" then
				val[k] = t({ v })
			end
		end
	end

	return val
end

local M = {}

local same = function(index)
	return f(function(args)
		return args[1]
	end, { index })
end

M.make = function(tbl)
	local result = {}
	for k, v in pairs(tbl) do
		table.insert(result, (snippet({ trig = k, desc = v.desc }, shortcut(v))))
	end

	return result
end

return {
	s(
		"tmain",
		fmt(
			[[
#[tokio::main]
async fn main() -> anyhow::Result<()> {{
  Ok(())
}}]],
			{}
		)
	),
	s(
		"yew_comp",
		fmt(
			[[use yew::prelude::*;

	#[derive(Clone, PartialEq, Properties)]
	pub struct {}Props {{}}

	#[derive(Debug, Clone, PartialEq, Eq)]
	pub enum {}Msg {{}}

	pub struct {} {{}}

	impl Component for {} {{
	  type Message = {}Msg;
	  type Properties = {}Props;

	  fn create(ctx: &Context<Self>) -> Self {{
	      Self {{}}
	  }}

	  fn view(&self, ctx: &Context<Self>) -> Html {{
	    todo!()
	  }}
	}}
	]],
			{
				same(1),
				same(1),
				same(1),
				i(1),
				same(1),
				same(1),
			}
		)
	),

	s(
		"main",
		fmt(
			[[
    fn main() {{
    }}
    ]],
			{}
		)
	),
	s(
		"modtest",
		fmt(
			[[
      #[cfg(test)]
      mod test {{
          use super::*;

          {}
      }}
    ]],
			i(0)
		)
	),
	s(
		{ trig = "test" },
		fmt(
			[[
  #[test]
  fn {}(){}{{
    {}
  }}
  ]],
			{
				i(1, "testname"),
				c(2, {
					t(""),
					t(" -> Result<()> "),
					-- fmt(" -> {}<()> ", { i(nil, "Result") }),
				}),
				i(0),
			}
		)
	),
	s("eq", fmt("assert_eq!({}, {});{}", { i(1), i(2), i(0) })),
	s("enum", {
		t({ "#[derive(Debug, PartialEq)]", "enum " }),
		i(1, "Name"),
		t({ " {", "  " }),
		i(0),
		t({ "", "}" }),
	}),

	s("struct", {
		t({ "#[derive(Debug, PartialEq)]", "struct " }),
		i(1, "Name"),
		t({ " {", "    " }),
		i(0),
		t({ "", "}" }),
	}),

	s("implt", {
		t({ "impl<T> Name<T>" }),
		t({ " {", "pub fn name(&self){}    " }),
		t({ "", "}" }),
	}),

	s("printlns", fmt([[println!("{}: {{:?}}", {});]], { same(1), i(1) })),
	-- _pd = {
	--   t [[println!("{:?}", ]],
	--   i(1),
	--   t [[);]],
	-- },
}

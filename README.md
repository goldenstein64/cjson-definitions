# lua-cjson definitions

This repo contains definitions for [OpenResty's fork](https://github.com/openresty/lua-cjson) of the [Lua CJSON](https://kyne.com.au/~mark/software/lua-cjson.php) module. They were manually rewritten from the [manual](https://kyne.com.au/~mark/software/lua-cjson-manual.html) and OpenResty's [README](https://github.com/openresty/lua-cjson/blob/master/README.md).

## Definitions

There are three class definitions in this module, described below and namespaced under `cjson.[CLASS NAME]`.

| Name                   | Source       |
|------------------------|--------------|
| `cjson`                | `cjson`      |
| `cjson.null`           | `cjson`      |
| `cjson.empty_array`    | `cjson`      |
| `cjson.array_mt`       | `cjson`      |
| `cjson.empty_array_mt` | `cjson`      |
| `cjson.safe`           | `cjson.safe` |

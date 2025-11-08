# Quick Start

## Usage as CLI

```bash
> ~ $ casecon "mySymbolAPIName" "mySymbolicRef"
```

Returns:

```
my_symbol_api_name
my_symbolic_ref
```

## Usage as JSON API

```bash
> ~ $ casecon "mySymbolAPIName" "mySymbolicRef" --json
```
Returns:

```
{
  "ok" : true,
  "result" : [
    "my_symbol_api_name",
    "my_symbolic_ref"
  ]
}
```

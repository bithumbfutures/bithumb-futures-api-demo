import os
import click
import requests
from pprint import pprint

# Local imports 
from util import *

@click.command()
@click.option("--symbol", type=str, default="BTC-PERP")
@click.option("--config", type=str, default="config.json")
@click.option('--verbose/--no-verbose', default=False)
def run(symbol, config, verbose):
    
    cfg = load_config(get_config_or_default(config))['bithumb-futures']

    host = cfg['https']
  
    url = f"{host}/api/pro/v1/ticker"
    params = dict(symbol = symbol)

    if verbose:
        print(f"url = {url}")
        print(f"params = {params}")

    res = requests.get(url, params = params)
    pprint(parse_response(res))


if __name__ == "__main__": 
    run()  
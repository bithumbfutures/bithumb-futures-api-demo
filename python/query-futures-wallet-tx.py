import os
import click
import requests
import numpy as np 
from pprint import pprint

# Local imports 
from util import *


@click.command()
@click.option("--tx", type=click.Choice(["both", "deposit", "withdrawal"]), default="both", help="transaction type, deposit/withdrawal/both, default is both")
@click.option("--config", type=str, default=None, help="path to the config file")
@click.option("--verbose", type=bool, default=False)
def run(tx, config, verbose):
    if config is None:
        config = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "config.json")
        print(f"Config file is not specified, use {config}")
    cfg = load_config(config)['bithumb-futures']

    host = cfg['https']
    grp = cfg['group']
    apikey = cfg['apikey']
    secret = cfg['secret']

    url = f"{host}/api/pro/v1/futures/risk"

    ts = utc_timestamp()
    headers = make_auth_headers(ts, "futures/risk", apikey, secret)

    if verbose: 
        print(f"url = {url}")
        print(f"params = {params}")

    res = requests.get(url, headers=headers)
    pprint(parse_response(res))


if __name__ == "__main__":
    run()

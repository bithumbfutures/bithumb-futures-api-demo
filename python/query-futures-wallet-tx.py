import os
import click
import requests
import numpy as np 
from pprint import pprint

# Local imports 
from util import *


@click.command()
@click.option("--asset", type=str)
@click.option("--page", type=int)
@click.option("--pageSize", type=int)
@click.option("--txType", type=click.Choice(["deposit", "withdrawal"]), default=None, help="transaction type, deposit/withdrawal/both, default is both")
@click.option("--config", type=str, default=None, help="path to the config file")
@click.option('--verbose/--no-verbose', default=False)
def run(asset, page, pagesize, txtype, config, verbose):
    if config is None:
        config = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "config.json")
        print(f"Config file is not specified, use {config}")
    cfg = load_config(config)['bithumb-futures']

    host = cfg['https']
    apikey = cfg['apikey']
    secret = cfg['secret']

    url = f"{host}/api/pro/v1/wallet/transactions"
    params = dict(
        asset = asset,
        page = page,
        pageSize = pagesize,
        txType = txtype,
    )

    ts = utc_timestamp()
    headers = make_auth_headers(ts, "wallet/transactions", apikey, secret)

    if verbose: 
        print(f"url = {url}")
        print(f"params = {params}")

    res = requests.get(url, headers=headers, params=params)
    pprint(parse_response(res))


if __name__ == "__main__":
    run()

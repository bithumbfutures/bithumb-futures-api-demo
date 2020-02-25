import os
import click
import requests
from pprint import pprint

# Local imports 
from util import *


@click.command()
@click.option("--page", type=int, default=1, help="page number, starting at 1.")
@click.option("--page-size", type=int, default=10, help="page size, default 10.")
@click.option("--config", type=str, default=None, help="path to the config file")
@click.option("--verbose/--no-verbose", default=False)
def run(page, page_size, config, verbose):
    
    cfg = load_config(get_config_or_default(config))['bithumb-futures']

    host = cfg['https']
    grp = cfg['group']
    apikey = cfg['apikey']
    secret = cfg['secret']

    url = f"{host}/{grp}/api/pro/v1/futures/tx-history"

    ts = utc_timestamp()
    headers = make_auth_headers(ts, "futures/tx-history", apikey, secret)
    params = dict(page=page, pageSize=page_size)

    if verbose: 
        print(f"url = {url}")

    res = requests.get(url, headers=headers, params=params)
    pprint(parse_response(res))


if __name__ == "__main__":
    run()

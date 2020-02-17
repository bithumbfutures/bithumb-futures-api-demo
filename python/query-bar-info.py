import os
import click
import requests
from pprint import pprint

# Local imports 
from util import *


@click.command()
@click.option("--config", type=str, default=None, help="path to the config file")
@click.option('--verbose/--no-verbose', default=False)
def run(config, verbose):
    if config is None:
        config = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "config.json")
        print(f"Config file is not specified, use {config}")
    cfg = load_config(config)['bithumb-futures']

    host = cfg['https']

    url = f"{host}/api/pro/v1/barhist/info"

    if verbose: 
        print(f"url = {url}")

    res = requests.get(url)
    pprint(parse_response(res))


if __name__ == "__main__":
    run()
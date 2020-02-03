# ~/current/exchange/orderhive/bin/send-balance-request -e staging -t D -u futures1@yue.com -s USDT -q 10000000
# ~/current/exchange/orderhive/bin/send-balance-request -e staging -t D -u futures1@yue.com -s ETH -q 1000
# ~/current/exchange/orderhive/bin/send-balance-request -e staging -t D -u futures1@yue.com -s BTC -q 100


get-log-name trade-server 1-_-0 | xargs tail -f | grep -v 'api-rate-limit-topic'
get-log-name trade-server 1-_-1 | xargs tail -f | grep -v 'api-rate-limit-topic'

wscat -c ws://localhost:9100/api/pro/stream
wscat -c ws://localhost:9100/1/api/pro/stream 
wscat -c wss://bitmax-test.io/1/api/pro/stream 
wscat -c wss://gdmexch.com/1/api/pro/stream
wscat -c wss://bithumb-futures.com/0/api/pro/stream


# 79
{"op":"auth", "t": 0, "key": "MWsXzVY26NBeeEM4EN2u1fAD8e5SVq7y", "sig": "skip"}
# 103
{"op":"auth", "t": 0, "key": "CQctofNFx8mtrYplkP5Umu9adt9utb27", "sig": "skip"}
# BF
{"op":"auth", "t": 0, "key": "cnFUm2GqkZDZd0SRbM3S4wDKZUy0Bb55", "sig": "skip"}

{"op":"sub", "ch":"order:cash"}
{"op":"sub", "ch":"order:futures"}
{"op":"sub", "ch":"trades:BTC-PERP"}


{"op":"sub", "ch":"summary:BTC-PERP"}
{"op":"sub", "ch":"bar:5:BTC-PERP"}
{"op":"sub", "ch":"summary"}


{"op":"req", "action":"futures-risk", "args": {"symbol": "BTC-PERP"}}



{"op":"sub", "ch":"depth:BTC-PERP"}
{"op":"sub", "ch":"futures-market-data"}
{"op":"req", "action":"depth-snapshot", "args": {"symbol": "BTC-PERP"}}
{"op":"req", "action":"depth-snapshot-top100", "args": {"symbol": "BTC-PERP"}}


{"op":"sub", "ch":"ping"}
{"op":"sub", "ch":"futures-market-data"}
{"op":"sub", "ch":"futures-market-data:BTC-PERP"}

{"op":"sub", "ch":"ref-px"}
{"op":"sub", "ch":"ref-px:BTC"}
{"op":"sub", "ch":"ref-px:BTC,ETH"}
{"op":"sub", "ch":"ref-price:BTC/USDT"}
{"op":"sub", "ch":"ref-price:*"}



{"op":"req","action":"depth-snapshot-top100","args":{"symbol":"BTC-PERP"}}

{"op":"sub","code":0,"ch":"summary:BTC-PERP"}


python3 python/query_prv_open_orders.py --account cash --config config-79.json

python3 python/place_order.py --account cash --symbol BTMX/USDT --side buy --price 0.05 --qty 200 --order_type limit --resp-inst ACCEPT  --config config-79.json

python3 python/cancel_order.py --account cash --order-id MbjbhBpUEWVNdWkoItDi90Gnt54P3GC9 --symbol BTMX/USDT --resp-inst ACCEPT  --config config-79.json

python3 python/place_order.py --config config/yzhao.json --account futures --symbol BTC-PERP --qty 0.1 --price 6000 --side buy --resp-inst ACCEPT

python3 python/cancel_order.py --account cash --order-id MbjbhBpUEWVNdWkoItDi90Gnt54P3GC9 --symbol BTMX/USDT --resp-inst ACCEPT  --config config-79.json



python3 scripts/pnl/run_daily_data_job.py -p /v1/apps/yuez -d 20200122
python3 scripts/pnl/run_daily_data_job.py -p /v1/apps/yuez -d 20200123
python3 scripts/pnl/run_daily_data_job.py -p /v1/apps/yuez -d 20200124
python3 scripts/pnl/run_daily_data_job.py -p /v1/apps/yuez -d 20200125
python3 scripts/pnl/run_daily_data_job.py -p /v1/apps/yuez -d 20200126
python3 scripts/pnl/run_daily_data_job.py -p /v1/apps/yuez -d 20200127

python3 -m scripts.data.gen_daily_universe gen_daily_universe --env prod --date 20200122
python3 -m scripts.data.gen_daily_universe gen_daily_universe --env prod --date 20200123
python3 -m scripts.data.gen_daily_universe gen_daily_universe --env prod --date 20200124
python3 -m scripts.data.gen_daily_universe gen_daily_universe --env prod --date 20200125
python3 -m scripts.data.gen_daily_universe gen_daily_universe --env prod --date 20200126
python3 -m scripts.data.gen_daily_universe gen_daily_universe --env prod --date 20200127

gdmops Rscript scripts/uat/gen-fund-data-daily.R && Rscript scripts/uat/gen-fund-data-daily.R && Rscript scripts/uat/gen-fund-data-daily.R && Rscript scripts/uat/gen-fund-data-daily.R && Rscript scripts/uat/gen-fund-data-daily.R && Rscript scripts/uat/gen-fund-data-daily.R && Rscript scripts/uat/gen-fund-data-daily.R && Rscript scripts/uat/gen-fund-data-daily.R && Rscript scripts/uat/gen-fund-data-daily.R && Rscript scripts/uat/gen-fund-data-daily.R && Rscript scripts/uat/gen-fund-data-daily.R && Rscript scripts/uat/gen-fund-data-daily.R && Rscript scripts/uat/gen-fund-data-daily.R && Rscript scripts/uat/gen-fund-data-daily.R && Rscript scripts/uat/gen-fund-data-daily.R && Rscript scripts/uat/gen-fund-data-daily.R && Rscript scripts/uat/gen-fund-data-daily.R && Rscript scripts/uat/gen-fund-data-daily.R && Rscript scripts/uat/gen-fund-data-daily.R && Rscript scripts/uat/gen-fund-data-daily.R




python3 ~/yuez/pybitmax/scripts/upload_to_s3.py -f 20200126040000.buy
python3 ~/yuez/pybitmax/scripts/upload_to_s3.py -f 20200126040000.meta
python3 ~/yuez/pybitmax/scripts/upload_to_s3.py -f 20200126040000.sell
python3 ~/yuez/pybitmax/scripts/upload_to_s3.py -f 20200126040000.update
python3 ~/yuez/pybitmax/scripts/upload_to_s3.py -f 20200126050000.buy
python3 ~/yuez/pybitmax/scripts/upload_to_s3.py -f 20200126050000.meta
python3 ~/yuez/pybitmax/scripts/upload_to_s3.py -f 20200126050000.sell

import sys
import datetime
import logging
import pymysql
#rds settings
rds_host  = ""
name = ""
password = ""
db_name = ""

logger = logging.getLogger()
logger.setLevel(logging.INFO)

try:
    conn = pymysql.connect(host=rds_host, user=name, passwd=password, db=db_name, connect_timeout=5)
except pymysql.MySQLError as e:
    logger.error("ERROR: Unexpected error: Could not connect to MySQL instance.")
    logger.error(e)
    sys.exit()

def handler():
    """
    This function fetches content from MySQL RDS instance
    """
    print("SUCCESS: Connection to RDS MySQL instance succeeded")

    item_count = 0

    with conn.cursor() as cur:
        cur.execute("select * from news")
        for row in cur:
            item_count += 1
            logger.info(row)
            print(row)
    conn.commit()


if __name__ == "__main__":
    handler()

from datetime import datetime
from airflow import DAG
from airflow.operators.bash import BashOperator
with DAG("riskshield_weekly_retrain", start_date=datetime(2026, 1, 1), schedule_interval="0 4 * * 0", catchup=False) as dag:
    BashOperator(task_id="retrain", bash_command="argo submit -n riskshield-ai /workflows/retrain.yaml --watch")

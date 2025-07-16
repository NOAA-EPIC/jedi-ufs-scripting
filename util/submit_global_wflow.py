import logging
import os
import subprocess
import sys
import threading
import time
from dataclasses import dataclass
from pathlib import Path
from typing import Sequence

logging.basicConfig(level=logging.INFO)
LOGGER = logging.getLogger("submit-workflow")
LOGGER.addHandler(logging.FileHandler("submit_wflow.log"))
LOGGER.info("starting...")


@dataclass
class Context:
    username: str
    queue_cmd: str
    limit_hrs: int = 6
    submit_interval: int = 60
    queue_check_interval: int = 30
    strict: bool = False

    @property
    def limit_secs(self) -> int:
        return self.limit_hrs * 60 * 60

    @classmethod
    def create(cls) -> "Context":
        hostname = subprocess.check_output(["hostname"]).decode("utf-8").strip()
        LOGGER.info(f"{hostname=}")
        if hostname.startswith("derecho"):
            ctx = Context(username="benkoz", queue_cmd="qstat")
        else:
            ctx = Context(username="Benjamin.Koziol", queue_cmd="squeue")
        LOGGER.info(f"{ctx=}")
        return ctx


CTX = Context.create()


def check_output_and_log(cmd: Sequence[str]) -> None:
    output = subprocess.check_output(cmd)
    LOGGER.info(f"cmd={cmd}")
    LOGGER.info(output.decode("utf-8"))


def check_queue() -> None:
    curr_secs = 0
    while curr_secs < CTX.limit_secs:
        try:
            check_output_and_log([CTX.queue_cmd, "-u", CTX.username])
        except subprocess.CalledProcessError:
            if CTX.strict:
                raise
            else:
                LOGGER.warning("could not check queue but strict is false. trying again...")
                return
        curr_secs += CTX.queue_check_interval
        time.sleep(CTX.queue_check_interval)


def main(expt_dir: Path) -> None:
    LOGGER.info(f"expt_dir={expt_dir}")
    expt_name = expt_dir.name
    os.chdir(expt_dir)
    t = threading.Thread(target=check_queue)
    t.start()
    curr_secs = 0
    while curr_secs < CTX.limit_secs:
        LOGGER.info(f"submitting... ({curr_secs / 60 / 60} of {CTX.limit_hrs} hours)")
        check_output_and_log(["rocotorun", "-d", f"{expt_name}.db", "-w", f"{expt_name}.xml"])
        check_output_and_log(
            [
                "rocotostat",
                "-w",
                f"{expt_name}.xml",
                "-d",
                f"{expt_name}.db",
                "-v",
                "10",
            ]
        )
        curr_secs += CTX.submit_interval
        LOGGER.info("sleeping...")
        time.sleep(CTX.submit_interval)
    t.join()


if __name__ == "__main__":
    main(Path(sys.argv[1]).expanduser().resolve(strict=True))

#!/usr/bin/env python3

import logging
import sys
from typing import List

from . import __version__

logger = logging.getLogger("app")


def main(args: List[str]) -> bool:
    logger.info(f"app version {__version__}")
    return True


def entrypoint():
    """Pre-Entrypoint for the program.

    Used to pass arguments to the main function explicitly as this makes testing
    command line parameters a lot easier.
    """
    if not main(sys.argv[1:]):
        sys.exit("Some commands did not complete successfully")


if __name__ == "__main__":
    entrypoint()

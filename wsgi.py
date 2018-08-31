import sys
import os
sys.path.append(os.path.abspath('./app'))
from app.run import app

if __name__ == "__main__":
    app.run()

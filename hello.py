import pandas

def main():
    try:
        import pyspark
        print(f"PySpark version {pyspark.__version__}")
    except:
        print("PySpark not available")

    print(f"Hello with Pandas {pandas.__version__}")


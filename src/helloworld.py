import argparse

def hello(name="World"):
    msg = f"Hello, {name}!"
    print(msg)
    return msg

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-n", "--name", default="World")
    args = parser.parse_args()
    hello(args.name)
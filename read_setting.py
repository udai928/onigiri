# coning:utf-8

import yaml

CONFIG_DIR = ""
CONFIG_YAML = "config.yaml"

def main():
    print(get_config_one("from"))


def load_config():
    f = open(CONFIG_DIR+CONFIG_YAML,'r')
    configs = yaml.load(f)
    f.close()
    return configs


def get_config_one(key):
    data = load_config()
    return data[key]


if __name__ == '__main__':
    main()


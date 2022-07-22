import yaml

dict_file = [{'sports' : ['soccer', 'football', 'basketball', 'cricket', 'hockey', 'table tennis']},
{'countries' : ['Pakistan', 'USA', 'India', 'China', 'Germany', 'France', 'Spain']}]

data = dict(version='3')

with open(r'test.yaml', 'w') as file:
    documents = yaml.dump(data, file)



require_relative '../lib/signer'
require 'yaml'
require 'time'

conf_file = open('./config/aws.yml') {|f|YAML.load(f)}
conf = conf_file['default']
client = Signer.new(conf['domain'], conf['key_pair_id'], conf['private_key'])
puts client.generate_url('nao.mp3',Time.now.getutc + 300 )

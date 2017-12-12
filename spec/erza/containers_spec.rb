require 'spec_helper'

containers = {
  nginx: {
    persistent: true
  },
  db: {
    persistent: true
  },
  homepage: {
  },
  shelf2: {
    persistent: true
  },
  fluentd: {
    persistent: true
  },
  elasticsearch: {
    persistent: true
  },
  kibana: {
    persistent: true
  }
}.freeze

describe service('docker') do
  it { should be_running }
end

containers.each do |name, h|
  describe docker_container(name) do
    it { should exist }

    if h[:persistent]
      it { should be_running }
    end
  end
end

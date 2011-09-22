#!/usr/bin/env ruby

require 'json'

gdps = Hash.new
f = File.open("africa.csv")
f.each { |l|
    v = l.chomp.split(/,/)
    gdps[v[0]] = v[1].to_f
}

data = JSON.parse(STDIN.read)

data["features"].each { |f|
    if gdps.has_key?(f["p"]["n"])
        f["p"]["g"] = gdps[f["p"]["n"]]
    else
        f["p"]["g"] = -1
    end
}

puts data.to_json

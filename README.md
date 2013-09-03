steno-codec-text
================

A plaintext codec for the Steno logger. Logging format spec:

    "[#{record.timestamp.to_s}] #{record.source} - pid=#{record.process_id} #{log_level_text} -- #{msg}\n"

Example:

    [2013-09-03 12:30:51 -0700] cf.registrar - pid=1728  DEBUG -- Sending registration: {:host=>"192.168.1.143", :port=>8181, :uris=>["api.stackato-m4nk.local"], :tags=>{:component=>"CloudController"}}
    
See dea_ng for the Go client library.

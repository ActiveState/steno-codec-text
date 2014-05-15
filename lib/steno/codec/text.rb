require "steno/codec/base"

module Steno
  module Codec
  end
end

class Steno::Codec::Text < Steno::Codec::Base
  def encode_record(record)
    msg =
      if record.message.valid_encoding?
        record.message
      else
        # Treat the message as an arbitrary sequence of bytes.
        escape_nonprintable_ascii(record.message.dup.force_encoding("BINARY"))
      end

    log_level_text = record.log_level.to_s.upcase.rjust(6)

    data_text = ""
    if (record.log_level == :debug2)
      if (record.data && !record.data.empty?)
        data_text = ", data: #{record.data.inspect}"
      end
    end

    "[#{record.timestamp.to_s}] #{record.source} - pid=#{record.process_id} #{log_level_text} -- #{msg}#{data_text}\n"
  end
end

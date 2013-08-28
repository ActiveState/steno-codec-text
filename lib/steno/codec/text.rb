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

    "[#{record.timestamp.to_s}] #{record.source} - pid=#{record.process_id} file=#{record.file} lineno=#{record.lineno} #{log_level_text} -- #{msg}\n"
  end
end
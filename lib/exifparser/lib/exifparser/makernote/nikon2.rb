#
#   exif/makernote/nikon2.rb
#
#   $Revision: 1.3 $
#    $Date: 2003/04/27 13:54:52 $
#
#== Reference
#
#http://www.ba.wakwak.com/%7Etsuruzoh/Computer/Digicams/exif-e.html
#
require 'exifparser/tag'
require 'exifparser/utils'
require 'exifparser/makernote/nikonflensname'

module Exif
  #
  # Tags used in Nikon Makernote
  #
  module Tag

    module MakerNote
      #
      # Shared Datas between Tags
      #
      module SharedData
        @@nikon_serial_no = nil  # written by NikonCameaSerialNumber Tag
        @@release_count   = nil  # written by ReleaseCount Tag
      end

      #
      # Subclass for Tags need shared datas
      #
      class NikonBase < Base
        include SharedData
      end

      #
      # 0x0002 - ISOSetting
      #
      class ISOSetting < Base
        def processData
          @formatted = []
          partition_data(@count) do |data|
            @formatted.push _formatData(data)
          end
        end
        
        def to_s
          if @formatted[1] == 0
            "auto"
          else
            @formatted[1].to_s
          end
        end
      end

      #
      # 0x0003 - ColorMode
      #
      class ColorMode < Base
        def to_s
          @formatted
        end
      end

      #
      # 0x0004 - ImageQuality
      #
      class ImageQuality < Base
      end

      #
      # 0x0005 - Whitebalance
      #
      class Whitebalance < Base
      end

      #
      # 0x0006 - ImageSharpening
      #
      class ImageSharpening < Base
      end

      #
      # 0x0007 - FocusingMode
      #
      class FocusingMode < Base
      end

      #
      # 0x0008 - FlashSetting
      #
      class FlashSetting < Base
      end

      #
      # 0x0009 - SpeedlightMode
      #
      class SpeedlightMode < Base
      end

      #
      # 0x000d - ProgramShift
      #
      class ProgramShift < Base

        def to_s
          case @formatted
          when [0xfc, 0x01, 0x06, 0x00]
            "-2/3EV"
          when [0xfd, 0x01, 0x06, 0x00]
            "-1/2EV"
          when [0xfe, 0x01, 0x06, 0x00]
            "-1/3EV"
          when [0x00, 0x01, 0x06, 0x00]
            "+0EV"
          when [0x02, 0x01, 0x06, 0x00]
            "+1/3EV"
          when [0x03, 0x01, 0x06, 0x00]
            "+1/2EV"
          when [0x04, 0x01, 0x06, 0x00]
            "+2/3EV"
          else
            ""
          end
        end

      end

      #
      # 0x000e - ExposureDifference
      #
      class ExposureDifference < Base

        def to_s
          case @formatted
          when [0xf7, 0x01, 0x0c, 0x00]
            "-2/3EV"
          when [0xf9, 0x01, 0x0c, 0x00]
            "-1/2EV"
          when [0xfc, 0x01, 0x0c, 0x00]
            "-1/3EV"
          when [0x00, 0x01, 0x0c, 0x00]
            "+0EV"
          when [0x04, 0x01, 0x0c, 0x00]
            "+1/3EV"
          when [0x06, 0x01, 0x0c, 0x00]
            "+1/2EV"
          when [0x08, 0x01, 0x0c, 0x00]
            "+2/3EV"
          else
            ""
          end
        end

      end

      #
      # 0x000f - ISOSelection
      #
      class ISOSelection < Base
      end

      #
      # 0x0010 - DataDump
      #
      class DataDump < Base
      end

      #
      # 0x0012 - Speedlight Bias
      #
      class SpeedlightBias < Base

        def to_s
          case @formatted
          when [0xfc, 0x01, 0x06, 0x00]
            "-2/3EV"
          when [0xfd, 0x01, 0x06, 0x00]
            "-1/2EV"
          when [0xfe, 0x01, 0x06, 0x00]
            "-1/3EV"
          when [0x00, 0x01, 0x06, 0x00]
            "+0EV"
          when [0x02, 0x01, 0x06, 0x00]
            "+1/3EV"
          when [0x03, 0x01, 0x06, 0x00]
            "+1/2EV"
          when [0x04, 0x01, 0x06, 0x00]
            "+2/3EV"
          else
            ""
          end
        end

      end

      #
      # 0x001d - NikonCameraSerialNumber
      #
      class NikonCameraSerialNumber < NikonBase

        def processData
          super
          @@nikon_serial_no = @formatted  # This value is used for LensParamaters tag.
        end

      end

      #
      # 0x0080 - ImageAdjustment
      #
      class ImageAdjustment < Base
      end

      #
      # 0x0081 - Tone Compensation
      #
      class ToneCompensation < Base
      end

      #
      # 0x0082 - Adapter
      #
      class Adapter < Base
      end

      #
      # 0x0085 - ManualForcusDistance
      #
      class ManualForcusDistance < Base
      end

      #
      # 0x0086 - DigitalZoom
      #
      class DigitalZoom < Base
      end

      #
      # 0x0088 - AFFocusPosition
      #
      class AFFocusPosition < Base
      end

      #
      # 0x008D - CameraColorMode
      #
      class CameraColorMode < Base
      end

      #
      # 0x008F - SceneMode
      #
      class SceneMode < Base
      end

      #
      # 0x0090 - LightSource
      #
      class LightSource < Base
      end

      #
      # 0x0094 - SaturationAdjustment
      #
      class SaturationAdjustment < Base
        def to_s
          case @formatted
          when 0
            "none"
          when -3
            "B&W"
          else
            @formatted.to_s
          end
        end
      end
      #
      # 0x0095 - LongtimeExposureNR
      #
      class LongtimeExposureNR < Base
      end

      #
      # 0x0098 - LensParamaters
      #
      class LensParameters < NikonBase
        def _format0(data)
          data.unpack("C*").collect{|e| e.to_i}
        end

        def to_hex
          str = ""
          @formatted.each do |dat|
            str += sprintf("%02x ", dat)
          end
          return str
        end

        XLAT0 = [0xc1,0xbf,0x6d,0x0d,0x59,0xc5,0x13,0x9d,0x83,0x61,0x6b,0x4f,0xc7,0x7f,0x3d,0x3d,
        0x53,0x59,0xe3,0xc7,0xe9,0x2f,0x95,0xa7,0x95,0x1f,0xdf,0x7f,0x2b,0x29,0xc7,0x0d,
        0xdf,0x07,0xef,0x71,0x89,0x3d,0x13,0x3d,0x3b,0x13,0xfb,0x0d,0x89,0xc1,0x65,0x1f,
        0xb3,0x0d,0x6b,0x29,0xe3,0xfb,0xef,0xa3,0x6b,0x47,0x7f,0x95,0x35,0xa7,0x47,0x4f,
        0xc7,0xf1,0x59,0x95,0x35,0x11,0x29,0x61,0xf1,0x3d,0xb3,0x2b,0x0d,0x43,0x89,0xc1,
        0x9d,0x9d,0x89,0x65,0xf1,0xe9,0xdf,0xbf,0x3d,0x7f,0x53,0x97,0xe5,0xe9,0x95,0x17,
        0x1d,0x3d,0x8b,0xfb,0xc7,0xe3,0x67,0xa7,0x07,0xf1,0x71,0xa7,0x53,0xb5,0x29,0x89,
        0xe5,0x2b,0xa7,0x17,0x29,0xe9,0x4f,0xc5,0x65,0x6d,0x6b,0xef,0x0d,0x89,0x49,0x2f,
        0xb3,0x43,0x53,0x65,0x1d,0x49,0xa3,0x13,0x89,0x59,0xef,0x6b,0xef,0x65,0x1d,0x0b,
        0x59,0x13,0xe3,0x4f,0x9d,0xb3,0x29,0x43,0x2b,0x07,0x1d,0x95,0x59,0x59,0x47,0xfb,
        0xe5,0xe9,0x61,0x47,0x2f,0x35,0x7f,0x17,0x7f,0xef,0x7f,0x95,0x95,0x71,0xd3,0xa3,
        0x0b,0x71,0xa3,0xad,0x0b,0x3b,0xb5,0xfb,0xa3,0xbf,0x4f,0x83,0x1d,0xad,0xe9,0x2f,
        0x71,0x65,0xa3,0xe5,0x07,0x35,0x3d,0x0d,0xb5,0xe9,0xe5,0x47,0x3b,0x9d,0xef,0x35,
        0xa3,0xbf,0xb3,0xdf,0x53,0xd3,0x97,0x53,0x49,0x71,0x07,0x35,0x61,0x71,0x2f,0x43,
        0x2f,0x11,0xdf,0x17,0x97,0xfb,0x95,0x3b,0x7f,0x6b,0xd3,0x25,0xbf,0xad,0xc7,0xc5,
        0xc5,0xb5,0x8b,0xef,0x2f,0xd3,0x07,0x6b,0x25,0x49,0x95,0x25,0x49,0x6d,0x71,0xc7]

        XLAT1 = [0xa7,0xbc,0xc9,0xad,0x91,0xdf,0x85,0xe5,0xd4,0x78,0xd5,0x17,0x46,0x7c,0x29,0x4c,
        0x4d,0x03,0xe9,0x25,0x68,0x11,0x86,0xb3,0xbd,0xf7,0x6f,0x61,0x22,0xa2,0x26,0x34,
        0x2a,0xbe,0x1e,0x46,0x14,0x68,0x9d,0x44,0x18,0xc2,0x40,0xf4,0x7e,0x5f,0x1b,0xad,
        0x0b,0x94,0xb6,0x67,0xb4,0x0b,0xe1,0xea,0x95,0x9c,0x66,0xdc,0xe7,0x5d,0x6c,0x05,
        0xda,0xd5,0xdf,0x7a,0xef,0xf6,0xdb,0x1f,0x82,0x4c,0xc0,0x68,0x47,0xa1,0xbd,0xee,
        0x39,0x50,0x56,0x4a,0xdd,0xdf,0xa5,0xf8,0xc6,0xda,0xca,0x90,0xca,0x01,0x42,0x9d,
        0x8b,0x0c,0x73,0x43,0x75,0x05,0x94,0xde,0x24,0xb3,0x80,0x34,0xe5,0x2c,0xdc,0x9b,
        0x3f,0xca,0x33,0x45,0xd0,0xdb,0x5f,0xf5,0x52,0xc3,0x21,0xda,0xe2,0x22,0x72,0x6b,
        0x3e,0xd0,0x5b,0xa8,0x87,0x8c,0x06,0x5d,0x0f,0xdd,0x09,0x19,0x93,0xd0,0xb9,0xfc,
        0x8b,0x0f,0x84,0x60,0x33,0x1c,0x9b,0x45,0xf1,0xf0,0xa3,0x94,0x3a,0x12,0x77,0x33,
        0x4d,0x44,0x78,0x28,0x3c,0x9e,0xfd,0x65,0x57,0x16,0x94,0x6b,0xfb,0x59,0xd0,0xc8,
        0x22,0x36,0xdb,0xd2,0x63,0x98,0x43,0xa1,0x04,0x87,0x86,0xf7,0xa6,0x26,0xbb,0xd6,
        0x59,0x4d,0xbf,0x6a,0x2e,0xaa,0x2b,0xef,0xe6,0x78,0xb6,0x4e,0xe0,0x2f,0xdc,0x7c,
        0xbe,0x57,0x19,0x32,0x7e,0x2a,0xd0,0xb8,0xba,0x29,0x00,0x3c,0x52,0x7d,0xa8,0x49,
        0x3b,0x2d,0xeb,0x25,0x49,0xfa,0xa3,0xaa,0x39,0xa7,0xc5,0xa7,0x50,0x11,0x36,0xfb,
        0xc6,0x67,0x4a,0xf5,0xa5,0x12,0x65,0x7e,0xb0,0xdf,0xaf,0x4e,0xb3,0x61,0x7f,0x2f]

        def to_s
          data = @formatted
          lens_data = ""
          version = data[0, 4].pack('C*')
          case version
          when "0100"
            lens_data = data[6, 7]

          when "0101"
            lens_data = data[11, 7]

          when "0201", "0202", "0203"
            decryptted = decrypt_data(data[4..(data.length - 1)], @@nikon_serial_no, @@release_count)
            lens_data = decryptted[7, 7]
    
          when "0204"
            decryptted = decrypt_data(data[4..(data.length - 1)], @@nikon_serial_no, @@release_count)
            lens_data = decryptted[8, 7]
          end

          return "" if lens_data.length == 0

          self.extend NikonFmount
          ret = Tag::NikonFmount::LensName[lens_data]
          return ret != nil ? ret : ""

        end

        def decrypt_data(data, serial, count)
          serialno = serial.to_i
          if serialno == 0
            if serial[0,3] == "D50"
              serialno = 0x22
            else
              serialno = 0x60
            end
          end

          key = 0
          4.times do |i|
            key ^= ((count >> (i*8)) & 0xff)
          end

          ci = XLAT0[serialno & 0xff]
          cj = XLAT1[key]
          ck = 0x60;
          pdata = []

          data.each do |dat|
            cj += ((ci * ck) & 0xff)
            cj &= 0xff
            ck += 1
            pdata.push(dat ^= cj)
          end

          return pdata
        end
      end
      
      #
      # 0x009c - SceneAssist
      #
      class SceneAssist < Base
      end

      #
      # 0x00a7 - ReleaseCount
      #
      class ReleaseCount < NikonBase
        def processData
          super
          @@release_count = @formatted  # This value is used for LensParamaters tag.
        end
      end

      #
      # 0x00a9 - ImageOptimization
      #
      class ImageOptimization < Base
      end

      #
      # 0x00aa - Saturation
      #
      class Saturation < Base
      end

      #
      # 0x00ac -VibrationReduction
      #
      class VibrationReduction < Base
      end
    end


    Nikon2IFDTable = {
      0x0002 => MakerNote::ISOSetting,
      0x0003 => MakerNote::ColorMode,
      0x0004 => MakerNote::ImageQuality,
      0x0005 => MakerNote::Whitebalance,
      0x0006 => MakerNote::ImageSharpening,
      0x0007 => MakerNote::FocusingMode,
      0x0008 => MakerNote::FlashSetting,
      0x0009 => MakerNote::SpeedlightMode,
      0x000d => MakerNote::ProgramShift,
      0x000e => MakerNote::ExposureDifference,
      0x000f => MakerNote::ISOSelection,
      0x0010 => MakerNote::DataDump,
      0x0012 => MakerNote::SpeedlightBias,
      0x001d => MakerNote::NikonCameraSerialNumber,
      0x0080 => MakerNote::ImageAdjustment,
      0x0081 => MakerNote::ToneCompensation,
      0x0082 => MakerNote::Adapter,
      0x0085 => MakerNote::ManualForcusDistance,
      0x0086 => MakerNote::DigitalZoom,
      0x0088 => MakerNote::AFFocusPosition,
      0x008D => MakerNote::CameraColorMode,
      0x008F => MakerNote::SceneMode,
      0x0090 => MakerNote::LightSource,
      0x0094 => MakerNote::SaturationAdjustment,
      0x0095 => MakerNote::LongtimeExposureNR,
      0x0098 => MakerNote::LensParameters,
      0x009c => MakerNote::SceneAssist,
      0x00a7 => MakerNote::ReleaseCount,
      0x00a9 => MakerNote::ImageOptimization,
      0x00aa => MakerNote::Saturation,
      0x00ac => MakerNote::VibrationReduction

    }

  end

  class Nikon2

    def initialize(fin, tiff_origin, dataPos, byteOrder_module)
      @fin = fin
      @tiffHeader0 = tiff_origin
      @dataPos = dataPos
      @nikonOffset = 0

      @fin.pos = dataPos
      magic = fin_read_n(6)

      if magic == "Nikon\000"
        @nikonOffset = 18   # D100, E5700, etc..
        fin_read_n(4)
        @tiffHeader0 = @fin.pos
        bo = @fin.read(2)
        case bo
        when "MM"
          byteOrder_module = Utils::Decode::Motorola
        when "II"
          byteOrder_module = Utils::Decode::Intel
        else
          raise RuntimeError, "Unknown byte order"
        end
      end
      @byteOrder_module = byteOrder_module
      self.extend @byteOrder_module
    end

    def scan_IFD
      #
      # Nikon D1 series MakerNote starts from 0 byte from the origin.
      #
      @fin.pos = @dataPos + @nikonOffset

      #
      # get the number of tags
      #
      num_dirs = decode_ushort(fin_read_n(2))
      
      #
      # now scan them
      #
      1.upto(num_dirs) {
        curpos_tag = @fin.pos
        tag = parseTagID(fin_read_n(2))
        tagclass = Tag.find(tag.hex, Tag::Nikon2IFDTable)
        unit, formatter = Tag::Format::Unit[decode_ushort(fin_read_n(2))]
        count = decode_ulong(fin_read_n(4))
        tagdata = fin_read_n(4)
        obj = tagclass.new(tag, "MakerNote", count)
        obj.extend formatter, @byteOrder_module
        obj.pos = curpos_tag
        if unit * count > 4
          curpos = @fin.pos
          begin 
            @fin.pos = @tiffHeader0 + decode_ulong(tagdata)
            obj.dataPos = @fin.pos
            obj.data = fin_read_n(unit*count)
          ensure
            @fin.pos = curpos
          end
        else
          obj.dataPos = @fin.pos - 4
          obj.data = tagdata
        end
        obj.processData
        yield obj
      }
    end

    private

    def fin_read_n(n)
      @fin.read(n)
    end

  end

end

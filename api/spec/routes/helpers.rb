module Helpers
    def get_thumb(file_name)
        return File.open(File.join(Dir.pwd, "spec/fixtures/images", file_name), "rb")
    end

    module_function :get_thumb
end 
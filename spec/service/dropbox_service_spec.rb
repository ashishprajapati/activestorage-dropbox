require "uri"

if SERVICE_CONFIGURATIONS[:dropbox]
	RSpec.describe ActiveStorage::Service::DropboxService do
		SERVICE = ActiveStorage::Service.configure(:dropbox, SERVICE_CONFIGURATIONS)

		it "has configurations available" do
			expect(SERVICE).not_to be nil
		end
	end

else
  puts "Skipping Dropbox Storage Service tests because no Dropbox configuration was supplied"
end

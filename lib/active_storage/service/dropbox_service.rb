# frozen_string_literal: true

require "dropbox_api"

module ActiveStorage
  # Wraps the Dropbox Storage as an Active Storage service. See ActiveStorage::Service for the generic API
  # documentation that applies to all services.
  class Service::DropboxService < Service
    def initialize(**config)
      @config = config
    end

    def upload(key, io, checksum: nil, content_type: nil, disposition: nil, filename: nil)
      instrument :upload, key: key, checksum: checksum do
        client.upload_by_chunks "/"+key, io
      rescue DropboxApi::Errors::UploadError
        raise ActiveStorage::IntegrityError
      end
    end

    def download(key, &block)
      if block_given?
        instrument :streaming_download, key: key do
          stream(key, &block)
        end
      else
        instrument :download, key: key do 
          download_for(key)
        rescue DropboxApi::Errors::NotFoundError
          raise ActiveStorage::FileNotFoundError
        end
      end
    end

    def delete(key)
      instrument :delete, key: key do
        client.delete("/"+key)
      rescue DropboxApi::Errors::NotFoundError
        # Ignore files already deleted
      end
    end

    def delete_prefixed(prefix)
      instrument :delete_prefixed, prefix: prefix do
        client.delete("/"+prefix[0..-2])
      rescue DropboxApi::Errors::NotFoundError
        # Ignore files already deleted
      end
    end

    def exist?(key)
      instrument :exist, key: key do |payload|
        begin
          answer = client.get_metadata("/"+key).present?
        rescue DropboxApi::Errors::NotFoundError
          answer = false
        end
        payload[:exist] = answer
        answer
      end
    end

    def url(key, expires_in:, filename:, disposition:, content_type:)
      instrument :url, key: key do |payload|
        generated_url = file_for(key).link 
        payload[:url] = generated_url
        generated_url
      end
    end

    private

      attr_reader :config

      def file_for(key)
        client.get_temporary_link("/"+key)
      end

      def download_for(key)
        client.download("/"+key) do |chunk|
          return chunk.force_encoding(Encoding::BINARY)
        end
      end

      # Reads the file for the given key in chunks, yielding each to the block.
      def stream(key)
        begin
          file = client.download("/"+key) do |chunk|
            yield chunk
          end
        rescue DropboxApi::Errors::NotFoundError
          raise ActiveStorage::FileNotFoundError
        end
      end

      def client
        @client ||= DropboxApi::Client.new(config.fetch(:access_token))
      end
  end
end
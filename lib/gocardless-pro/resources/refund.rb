

# encoding: utf-8
#
# WARNING: Do not edit by hand, this file was generated by Crank:
#
#   https://github.com/gocardless/crank
#
require 'uri'

module GoCardless
  # A module containing classes for each of the resources in the GC Api
  module Resources
    # Refund objects represent (partial) refunds of a
    # [payment](https://developer.gocardless.com/pro/#api-endpoints-payment) back
    # to the
    # [customer](https://developer.gocardless.com/pro/#api-endpoints-customers).

    # #
    # The API allows you to create, show, list and update your refunds.
    #
    #
    # GoCardless will notify you via a
    # [webhook](https://developer.gocardless.com/pro/#webhooks) whenever a refund
    # is created, and will update the `amount_refunded` property of the payment.

    # #
    # _Note:_ A payment that has been (partially) refunded can still
    # receive a late failure or chargeback from the banks.
    # Represents an instance of a refund resource returned from the API
    class Refund
      attr_reader :amount

      attr_reader :created_at

      attr_reader :currency

      attr_reader :id

      attr_reader :metadata
      # initialize a resource instance
      # @param object [Hash] an object returned from the API
      def initialize(object)
        @object = object

        @amount = object['amount']
        @created_at = object['created_at']
        @currency = object['currency']
        @id = object['id']
        @links = object['links']
        @metadata = object['metadata']
      end

      # return the links that the resource has
      def links
        Struct.new(
          *{

            payment: ''

          }.keys.sort
        ).new(*@links.sort.map(&:last))
      end

      # Provides the resource as a hash of all it's readable attributes
      def to_h
        @object
      end
    end
  end
end

# frozen_string_literal: true

module Ocman
  class Permission
    PERMISSIONS = {
      read: 1,
      update: 2,
      create: 4,
      delete: 8,
      share: 16
    }.freeze
    private_constant :PERMISSIONS

    attr_reader :permissions

    def initialize(permissions = [:all])
      @permissions = Set.new(permissions)
      @permissions = Set.new(PERMISSIONS.keys) if @permissions.include?(:all)

      raise ArgumentError, "No permission given. Valid permissions are: #{PERMISSIONS.keys}" if @permissions.empty?
      return if @permissions.all? { |permission| PERMISSIONS.key?(permission) }

      raise ArgumentError, "Valid permissions are: #{PERMISSIONS.keys}"
    end

    def to_i
      @permissions
        .map { |permission| PERMISSIONS.fetch(permission) }
        .inject(&:|) || PERMISSIONS[:all]
    end

    def +(other)
      Permission.new(permissions + other.permissions)
    end

    def -(other)
      Permission.new(permissions - other.permissions)
    end

    class << self
      PERMISSIONS.each_key do |name|
        define_method(name) do
          new([name])
        end
      end

      def all
        new(PERMISSIONS.keys)
      end
    end
  end
end

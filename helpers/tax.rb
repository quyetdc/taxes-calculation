# Tax module
# A helper for determining the rate & tax type for good
module Tax
  EXEMPTS = %w[book chocolate pill].freeze
  IMPORTED = 'imported'.freeze

  EXEMPT = 'exempt'.freeze
  EXEMPT_RATE = 0.0

  EXEMPT_IMPORTED = 'exempt imported'.freeze
  EXEMPT_IMPORTED_RATE = 0.05

  BASIC = 'basic'.freeze
  BASIC_RATE = 0.1

  BASIC_IMPORTED = 'imported basic'.freeze
  BASIC_IMPORTED_RATE = 0.15

  def exempt?(name)
    is_exempt = false
    EXEMPTS.each do |exempt|
      if name.include? exempt
        is_exempt = true
        break
      end
    end
  end

  def get_type(name)
    words = name.split(' ')
    type = if exempt?(name)
             words.include?(IMPORTED) ? EXEMPT_IMPORTED : EXEMPT
           else
             words.include?(IMPORTED) ? BASIC_IMPORTED : BASIC
           end
    type
  end

  def get_rate(type)
    case type
    when EXEMPT
      EXEMPT_RATE
    when EXEMPT_IMPORTED
      EXEMPT_IMPORTED_RATE
    when BASIC_IMPORTED
      BASIC_IMPORTED_RATE
    else
      BASIC_RATE
    end
  end
end

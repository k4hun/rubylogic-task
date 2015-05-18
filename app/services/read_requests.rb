class ReadRequests
  def oldest_unread_requests(count, options={})
    requests = Request.all
    requests = requests.where(category: options[:category]) if options[:category].present?
    requests = requests.where(price: options[:price]) if options[:price].present?
    requests = requests.where(email: options[:email]) if options[:email].present?
    requests = requests.order(created_at: 'asc').where(read: false).take(count)
    requests.each do |req|
      req.update_attribute(:read, true)
    end
    requests
  end
end
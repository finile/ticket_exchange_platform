desc "Remove searches older than a month"
  
  task remove_old_searches: :environment do
    Search.destroy_all ["created_at <? ", 1.month.ago]
  end

  
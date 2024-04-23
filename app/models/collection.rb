class Collection < ApplicationRecord
    has_many :collection_entries
    has_many :items
# Place to store things related to a specific topic or purpose - beyond daily tasks and events
# can be anything from lists, trackers, logs or brainstorming pages

# Collection ideas:
# 1. Next JIUN exhibition
# 2. Things to try
# 3. Meditations in clay workshop
# 4. Lake District Holiday

end

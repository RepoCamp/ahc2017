require 'rails_helper'

describe "Searching for works" do
  let!(:work) do
    MusicalWork.new.tap do |work|
      work.composer = ["Joe Schmo"]
      work.title = ["My Special Song"]
      work.genre =  ["Pop"]
      work.composition_date = ["today"]
      work.apply_depositor_metadata("user")
      work.visibility = "open"
      work.save
    end
  end

  it "searches for songs" do
    visit(root_path)

    # Check for recently uploaded works
    within("#recent_docs") do
      expect(page).to have_content(work.title.first)
    end

    # Search for works
    fill_in(:q, with: work.title.first)
    click_button("Go")
    within("#search-results") do
      expect(page).to have_content(work.title.first)
      expect(page).to have_content(work.composer.first)
      expect(page).to have_content(work.genre.first)
      expect(page).to have_content(work.composition_date.first)
    end
  end

  context 'by cover subject' do
    let(:cover) { ['Magic Hat'] }

    let!(:work) do
      MusicalWork.new.tap do |work|
        work.cover = cover
        work.composer = ["Joe Schmo"]
        work.title = ["My Special Song"]
        work.genre = ["Pop"]
        work.composition_date = ["today"]
        work.apply_depositor_metadata("user")
        work.visibility = "open"
        work.save
      end
    end

    it 'facets by cover subject' do
      visit(root_path)

      fill_in(:q, with: work.title.first)
      click_button("Go")
      save_and_open_page
      
      within('.facets') do
        expect(page).to have_selector 'div.blacklight-cover_sim', text: 'Cover Subject'
        expect(page).to have_content(work.cover.first)
      end
    end
  end
end

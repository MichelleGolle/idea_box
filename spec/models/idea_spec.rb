require 'rails_helper'

RSpec.describe Idea, type: :model do
  it {should validate_presence_of :title}
  it {should validate_presence_of :body}
  it {should validate_uniqueness_of :title}

  it "is scoped to list the newest first" do
    Idea.create(title: "new idea",
                body: "idea body",
                quality: 1)
    Idea.create(title: "newer idea",
                body: "idea body",
                quality: 1)

    expect(Idea.first.title).to eq("newer idea")
  end

  let(:idea) {Idea.create(title: "idea",
                        body: "idea body",
                        quality: 0)
            }

  it "can go up in quality from swill" do
    expect(idea.quality).to eq("swill")
    idea.thumbs_up

    expect(idea.quality).to eq("plausible")
  end

  it "can go up in quality from plausible" do
    plausibleIdea = Idea.create(title: "good idea",
                         body: "idea body",
                         quality: 1)
    expect(plausibleIdea.quality).to eq("plausible")
    plausibleIdea.thumbs_up

    expect(plausibleIdea.quality).to eq("genius")
  end

  it "can't go up from genius" do
    geniusIdea = Idea.create(title: "awesome idea",
                         body: "some body",
                         quality: 2)
    expect(geniusIdea.quality).to eq("genius")
    geniusIdea.thumbs_up

    expect(geniusIdea.quality).to eq("genius")
  end

  it "can go down in quality from plausible" do
    plausibleIdea = Idea.create(title: "plausible idea",
                         body: "something",
                         quality: 1)
    expect(plausibleIdea.quality).to eq("plausible")

    plausibleIdea.thumbs_down

    expect(plausibleIdea.quality).to eq("swill")
  end

  it "can go down in quality from genius" do
    geniusIdea = Idea.create(title: "genius idea",
                         body: "something so smart",
                         quality: 2)
    expect(geniusIdea.quality).to eq("genius")
    geniusIdea.thumbs_down

    expect(geniusIdea.quality).to eq("plausible")
  end

  it "cannot go down in quality from swill" do
    swillIdea = Idea.create(title: "swill idea",
                         body: "average body",
                         quality: 0)
    expect(swillIdea.quality).to eq("swill")
    swillIdea.thumbs_down

    expect(swillIdea.quality).to eq("swill")
  end
end

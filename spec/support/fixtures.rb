module Fixtures
  FIXTURE_PATH = File.join(WordCloud::ROOT_PATH, 'spec', 'fixtures')

  def fixture_path(*args)
    if args.length != 0
      File.join(FIXTURE_PATH, *args)
    else
      FIXTURE_PATH
    end
  end

end

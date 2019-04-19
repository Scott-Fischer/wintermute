describe Power do

  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let!(:own_project) { create(:project, user: user) }
  let!(:foreign_project) { create(:project, user: other_user) }


  describe 'projects' do
    it 'allows access to all projects' do
      power = described_class.new(user)

      expect(power.projects).to contain_exactly(own_project, foreign_project)
    end
  end

  describe 'updatable_projects' do
    it 'allows access to own projects, but not to foreign projects' do
      power = described_class.new(user)

      expect(power.updatable_projects).to contain_exactly(own_project)
    end

    it 'restricts access to all users that are not signed in' do
      power = described_class.new(nil)

      expect(power.updatable_projects).to eq(nil)
    end
  end

  describe 'creatable_projects' do
    it 'allows access to own projects, but not to foreign projects' do
      power = described_class.new(user)

      expect(power.creatable_projects).to contain_exactly(own_project)
    end

    it 'restricts access to all users that are not signed in' do
      power = described_class.new(nil)

      expect(power.creatable_projects).to eq(nil)
    end
  end

  describe 'destroyable_projects' do
    it 'allows access to own projects, but not to foreign projects' do
      power = described_class.new(user)

      expect(power.destroyable_projects).to contain_exactly(own_project)
    end

    it 'restricts access to all users that are not signed in' do
      power = described_class.new(nil)

      expect(power.destroyable_projects).to eq(nil)
    end
  end

end

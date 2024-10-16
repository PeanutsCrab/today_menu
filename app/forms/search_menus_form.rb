class SearchMenusForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :material, :string
  attribute :tag_name, :string

  def search
    scope = Menu.distinct
    scope = scope.name_contain(name) if name.present?
    scope = scope.material_contain(material) if material.present?
    scope = scope.tag_name_contain(tag_name) if tag_name.present?

    scope.to_a.sample # 条件に合う全ての結果からランダムに1件を取得
  end
end
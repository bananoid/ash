defmodule Ash.Flow.Argument do
  @moduledoc "An argument to a flow"
  defstruct [:name, :type, :default, :allow_nil?, :constraints, :description]

  @schema [
    name: [
      type: :atom,
      required: true,
      doc: "The name to use for the argument"
    ],
    type: [
      type: Ash.OptionsHelpers.ash_type(),
      required: true,
      doc: "The type of the argument. See `Ash.Type` for more."
    ],
    default: [
      type: {:or, [{:mfa_or_fun, 0}, :literal]},
      required: false,
      doc: "A default value to use for the argument if not provided"
    ],
    allow_nil?: [
      type: :boolean,
      default: true,
      doc: "Whether or not the argument value may be nil"
    ],
    constraints: [
      type: :keyword_list,
      default: [],
      doc:
        "Constraints to provide to the type when casting the value. See the type's documentation for more information."
    ],
    description: [
      type: :string,
      default: "",
      doc: "Attribute description. This is used to generate documentation for the argument."
    ]
  ]

  def schema, do: @schema
end

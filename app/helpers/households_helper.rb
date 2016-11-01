module HouseholdsHelper
  def head_of_household adult
    if adult.is_head_of_household
      parts =[
        '<span class="fa fa-h-square" aria-hidden="true" ',
        'data-toggle="tooltip" data-placement="right" title="',
        Adult.human_attribute_name(:is_head_of_household),
        '"></span><span class="sr-only">',
        Adult.human_attribute_name(:is_head_of_household),
        '</span>'
      ]

      raw parts.join
    end
  end
end

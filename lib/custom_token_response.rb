module CustomTokenResponse
    # Add user email to the response object
    def body
        user_details = User.find(@token.resource_owner_id)
        # call original `#body` method and merge its result with the additional data hash
        super.merge({
            email: user_details.email
        })
    end
end
plumbing_company    = Company.create name: 'Plumbing Palace'
plumbing_empire    = Company.create name: 'Plumbing Empire'
electrician_company = Company.create name: 'Eclectic Electric'

plumber         = User.create first_name: 'The',
                              last_name: 'Plumber',
                              email: 'the@plumber.com',
                              password: '12345678',
                              password_confirmation: '12345678'
plumber_emperor = User.create first_name: 'Plumber',
                              last_name: 'Emperor',
                              email: 'the@plumberempire.com',
                              password: '12345678',
                              password_confirmation: '12345678'
electrician     = User.create first_name: 'The',
                              last_name: 'Electrician',
                              email: 'the@electrician.com',
                              password: '12345678',
                              password_confirmation: '12345678'

electrician_company.users << electrician
plumbing_company.users << plumber
plumbing_empire.users << plumber_emperor

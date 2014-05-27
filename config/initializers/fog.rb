FOG_STORAGE_OPTIONS = if Rails.env.development?
  {
    :local_root => File.join(Rails.root, 'tmp'),
    :provider   => 'Local',
    :endpoint => File.join(Rails.root, 'tmp')
  }
elsif Rails.env.test?
  {
    :local_root => File.join(Rails.root, 'tmp', 'test'),
    :provider   => 'Local',
    :endpoint => File.join(Rails.root, 'tmp', 'test')
  }
end
class lumify::ontology::deploy inherits lumify {

  include '::macro'

  macro::ensure_dir{ "$target_ontologies_dir/minimal" :
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rx,go=rx',
  }

  file { "$target_ontologies_dir/minimal":
    source  => "$lumify_ontologies_dir/ontology-minimal",
    recurse => true,
    require => Macro::Ensure_dir["$target_ontologies_dir/minimal"],
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rx,go=rx',
  }
}
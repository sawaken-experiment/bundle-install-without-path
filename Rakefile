desc 'edit source code to change to 0.0.1'
task :change_foo_to_ver1 do
  sh "echo 'module Foo; VERSION = \"0.0.1\"; end' | cat > foo/lib/foo/version.rb"
end

desc 'edit source code to change to 0.0.2'
task :change_foo_to_ver2 do
  sh "echo 'module Foo; VERSION = \"0.0.2\"; end' | cat > foo/lib/foo/version.rb"
end

desc 'release gem from current source code'
task :make_foo_gem do
  cd 'foo' do
    sh 'rm -rf pkg/*'
    sh 'rake build'
    sh 'mv -f pkg/* ../repo/gems/'
  end
  cd 'repo' do
    sh 'gem install builder'
    sh 'gem generate_index'
  end
end

desc 'install foo-0.0.1 and foo-0.0.2 to project_using_foo-0.0.1 and project_using_foo-0.0.2 respectively'
task :install_foo do
  cd 'project_using_foo-0.0.1' do
    sh 'bundle install'
  end
  cd 'project_using_foo-0.0.2' do
    sh 'bundle install'
  end
end

desc 'project_using_foo-0.0.1 and project_using_foo-0.0.2 use foo command'
task :use_foo do
  cd 'project_using_foo-0.0.1' do
    sh 'bundle exec foo'
  end
  cd 'project_using_foo-0.0.2' do
    sh 'bundle exec foo'
  end
end

desc 'do all process of the experiment'
task :all => [
  :clean,
  :change_foo_to_ver1, :make_foo_gem,
  :change_foo_to_ver2, :make_foo_gem,
  :install_foo,
  :use_foo,
]

desc 'clean all generated files'
task :clean do
  sh 'rm -rf repo'
  sh 'rm -f project_using_foo-0.0.1/Gemfile.lock'
  sh 'rm -f project_using_foo-0.0.2/Gemfile.lock'
  sh 'rm -f foo/pkg/*.gem'
  sh 'mkdir -p repo/gems'
end


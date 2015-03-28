export USER_HOME=/Users/aetzioni

#Java Stuff
#export JAVA_HOME=/Library/Java/Home/
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_25.jdk/Contents/Home
export PATH=$PATH:$USER_HOME/bin:$JAVA_HOME/bin:$USER_HOME/dev/scripts/:$SCALA_HOME/bin
export JAVA_OPTS='-Xmx2048m -Xms512m -XX:MaxPermSize=512m'

# Maven Stuff
export M2_VERSION=3.0.5
export M2_HOME=$USER_HOME/bin/apache-maven-$M2_VERSION
export M2=$M2_HOME/bin
export M2_REPO=~/.m2/
export MAVEN_OPTS='-Xmx1024m -Xms256m -XX:MaxPermSize=384m'
export PATH=$PATH:$M2
export PATH=$PATH:$USER_HOME/scripts

alias mvn-eclipse='mvn eclipse:eclipse -Dwtpversion=2.0 -DdownloadSources=true  -DdownloadJavadocs=true'
alias mvn-clean-eclipse='mvn eclipse:clean eclipse:eclipse -Dwtpversion=2.0 -DdownloadSources=true  -DdownloadJavadocs=true'
alias mvn-install='mvn install -DskipTests=true -DwarProject.packaging=jar -T4C'
alias mvn-clean-install='mvn clean install -DskipTests=true -DwarProject.packaging=jar -T4C'
alias mvn-compile='mvn-clean-install -T4C'
alias mvn-clean-install-eclipse='mvn clean install eclipse:eclipse -DskipTests=true -DwarProject.packaging=jar -Dwtpversion=2.0 -DdownloadSources=true -DdownloadJavadocs=true -T16'
alias mvn-clean-compile-all='mvn clean test-compile'
#alias mvn-all='mvn-clean-install-eclipse -T16'
alias mvn-all="mvn-clean-install -T4C -Pweb-releasex"
alias mvn-war-inplace='mvn war:inplace tomcat:inplace -DskipTests=true'
alias mvn-quality='mvn com.outbrain:codecleaner-maven-plugin:validation com.outbrain:codecleaner-maven-plugin:compiler com.outbrain:codecleaner-maven-plugin:style'
alias mvn-fetch-sources='mvn -U clean dependency:sources -DexcludeGroupIds=com.outbrain'
alias mvn-integration='mvn test -P integration'
alias up-clean-install='svn up; mvn-clean-install'
alias checkout='svn co https://svn.il.outbrain.com:8443/repos/Outbrain/trunk'
alias gotrunk='cd ~/dev/outbrain/trunk'
export PATH=$PATH:$USER_HOME/bin

export SVN_EDITOR=vim
export PHANTOMJS_BIN=/usr/local/bin/phantomjs

## bash coloring ##
alias grep='grep --color'

# set a nice command prompt
export PS1="\[\e[32;1m\]\w\[\e[30;1m\] $ \[\e[30;0m\]"
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# allow colors for ls
export CLICOLOR=1

## environment for unit tests ##
export com_outbrain_environment=junit
export WORK_AREA=/Users/aetzioni/dev/outbrain/trunk
export ADP_AREA=/Users/aetzioni/dev/adp_area

bind 'set completion-ignore-case on'

function revert() {
  cmd="svn st | grep '$1' | awk '{print \$2}' | xargs svn revert"
  echo $cmd
  eval $cmd
}

function changed() {
  cmd="svn st | awk {'print \$NF'} | awk -F/ {'print \$1'} | uniq | tr '\n', ',' | rev | cut -c2- | rev "
  #echo $cmd
  eval $cmd
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

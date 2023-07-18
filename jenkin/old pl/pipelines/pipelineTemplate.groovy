pipelineJob('pipeline_demo') {
  description('abcd')
  displayName('pipelinejob_converted')
  keepDependencies(false)
  configure { flowdefinition ->
    flowdefinition / 'actions' << 'org.jenkinsci.plugins.pipeline.modeldefinition.actions.DeclarativeJobAction'(plugin:'pipeline-model-definition')
    flowdefinition / 'actions' << 'org.jenkinsci.plugins.pipeline.modeldefinition.actions.DeclarativeJobPropertyTrackerAction'(plugin:'pipeline-model-definition') {
    }

    flowdefinition << delegate.'definition'(class:'org.jenkinsci.plugins.workflow.cps.CpsScmFlowDefinition',plugin:'workflow-cps') {
      'scm'(class:'hudson.plugins.git.GitSCM',plugin:'git') {
        'configVersion'(2)
        'userRemoteConfigs' {
          'hudson.plugins.git.UserRemoteConfig' {

            'url'('https://github.com/hirajendra2999/rworld.git')

            'credentialsId'('github-git')

          }

        }

        'branches' {

          'hudson.plugins.git.BranchSpec' {

            'name'('*/master')

          }

        }

        'doGenerateSubmoduleConfigurations'(false)

        'submoduleCfg'(class:'empty-list')

        'extensions'()

      }

      'scriptPath'('pipelines/pipeline2.jdp')

      'lightweight'(true)

    }

  }

}
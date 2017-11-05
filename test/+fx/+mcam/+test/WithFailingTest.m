classdef WithFailingTest < fx.mcam.test.WithSampleSandbox
    
    methods( TestMethodSetup )
        
        function updateForFailingTests( this )
            sandbox = fx.mcam.Sandbox( this.Root );
            try %#ok<TRYNC>
                sandbox.Configuration.TestPackages(end+1,:) = {'failing', 'fx.submission.sample.failingTestOncePackaged'};
            end
            try %#ok<TRYNC>
                sandbox.Configuration.TestPackages(end+1,:) = {'bad', 'fx.submission.sample.badTests.tBadTest'};
            end
            copyfile(...
                fullfile( mcamtestroot, 'Sample', 'prjfile.prj' ),...
                fullfile( this.Root, 'code', this.ShortName, 'prjfile.prj' ) );
            copyfile(...
                fullfile( mcamtestroot, 'Sample', 'prjFileExist.m' ),...
                fullfile( this.Root, 'code', this.ShortName, 'prjFileExist.m' ) );
            packagePath = cellfun( @(str) sprintf( '+%s', str ), this.ParentPackages,...
                'UniformOutput', false );
            mkdir( fullfile( this.Root, this.TestFolder, packagePath{:}, sprintf( '+%s', this.ShortName ), '+failingTestOncePackaged' ) );
            copyfile(...
                fullfile( mcamtestroot, 'Sample', 'tprjFileExist.m' ),...
                fullfile( this.Root, this.TestFolder, packagePath{:}, sprintf( '+%s', this.ShortName ), '+failingTestOncePackaged', 'tprjFileExist.m' ) );
            mkdir( fullfile( this.Root, this.TestFolder, packagePath{:}, sprintf( '+%s', this.ShortName ), '+badTests' ) );
            copyfile(...
                fullfile( mcamtestroot, 'Sample', 'tBadTest.m' ),...
                fullfile( this.Root, this.TestFolder, packagePath{:}, sprintf( '+%s', this.ShortName ), '+badTests', 'tBadTest.m' ) );
        end
        
    end
    
end
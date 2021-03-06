function packagesandbox( varargin )
    % Package the sandbox into an MLTBX
    % Packages the sandbox into an MLTBX, using the "fcam.json" and the PRJ
    % file.
    %
    %   packagesandbox() packages the sandbox in the current folder.
    %    
    %   packagesandbox( path ) packages the sandbox in the "path" location.
    %
    %   Example
    %      mksandbox( 'ShortName', 'filesystem' );
    %      packagesandbox();
    %      ver filesystem
    %
    %   See also mksandbox, addsandbox, rmsandbox, testsandbox, testaddon
    
    fx.fcam.command.packagesandbox( varargin{:} );
end
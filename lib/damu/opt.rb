    require 'main'

   # ARGV.replace %w( --foo=40 -f2 ) if ARGV.empty?

    Main {
          argument('argument')
          option('option'){
           required
          }
          option('ml')
          option('sp')


      def run
        p params['foo'].given?
        p params['foo'].values
        p params['bar'].given?
        p params['bar'].values
        p params['ml'].given?
  p params['ml']
        p params['ml'].values
        p params['sp'].given?
        p params['sp'].value
      end
}
